*** Settings ***
Resource             config.robot

Test Setup           Nova sessão   
Test Teardown        Encerra sessão

     

*** Variables ***

${url}                      http://demo.automationtesting.in/Register.html 
${name}                     xpath://input[@placeholder='First Name']
${lastname}                 xpath://input[@placeholder='Last Name']
${email}                    //*[@id="eid"]/input
${phone}                    xpath://*[@id="basicBootstrapForm"]/div[4]/div/input
${conutry}                  id:countries
${year}                     id:yearbox 
${month}                    xpath://*[@id="basicBootstrapForm"]/div[11]/div[2]/select
${day}                      id:daybox 
${submit}                   id:submitbtn  
${Refresh}                  id:Button1
${password}                 id:firstpassword
${confirmapassword}         id:secondpassword



*** Test Cases ***


Contexto: Formulario
    [tags]      form
	Dado que acessei o formulario de cadastro de usuario


Cenário: CTO1- Realizar cadastro de usuário
	[tags]      cadastro
	Quando eu preencho os campos obrigatorios
    E clico em "Enviar"
	Então vejo a listagem de usuarios 

Cenário: CT02- Campo senha deve ser obrigatorio 
	[tags]      obrigatorio
	Quando eu nao preencho os campos obrigatorios de senha
    E clico em "Enviar"
	Então vejo uma validação informando que os campos de senha são obrigatórios

Cenário: CT03- Senha nao confere
    [tags]      senhanaoconfere
	Quando eu preencho os campos obrigatorios informando senhas diferentes
    E clico em "Enviar"
    Então vejo uma mensagem de validação informando que os campos não conferem


*** Keywords ***


Dado que acessei o formulario de cadastro de usuario
    Title Should Be         Register
    
Quando eu preencho os campos obrigatorios 

    Input Text                       ${name}                 Raquel
    Input Text                       ${lastname}             Cardoso Dutra
    Input Text                       ${email}                seila@teste.com
    Input Text                       ${phone}                4878787855
    Select Radio Button              radiooptions            FeMale
    Select From List By Label        ${conutry}              Brazil
    Select From List By Label        ${year}                 1988
    Select From List By Value        ${month}                November
    Select From List By Value        ${day}                  12
    Input Text                       ${password}             Robot123456
    Input Text                       ${confirmapassword}     Robot123456 



Quando eu nao preencho os campos obrigatorios de senha


    Input Text                       ${name}                 Raquel
    Input Text                       ${lastname}             Cardoso Dutra
    Input Text                       ${email}                seila@teste.com
    Input Text                       ${phone}                4878787855
    Select Radio Button              radiooptions            FeMale
    Select From List By Label        ${conutry}              Brazil
    Select From List By Label        ${year}                 1988
    Select From List By Value        ${month}                November
    Select From List By Value        ${day}                  12
    Input Text                       ${password}             ${EMPTY}
    Input Text                       ${confirmapassword}     ${EMPTY} 


Quando eu preencho os campos obrigatorios informando senhas diferentes

    Input Text                       ${name}                 raquel
    Input Text                       ${lastname}             cardoso
    Input Text                       ${email}                seila@teste.com
    Input Text                       ${phone}                4878787855
    Select Radio Button              radiooptions            FeMale
    Select From List By Label        ${conutry}              Brazil
    Select From List By Label        ${year}                 1988
    Select From List By Value        ${month}                November
    Select From List By Value        ${day}                  12
    Input Text                       ${password}             Robot123456
    Input Text                       ${confirmapassword}     Robot123400 


E clico em "Enviar"

    Click Element       ${submit}
   
Então vejo a listagem de usuarios 

    Wait Until Location Is          http://demo.automationtesting.in/WebTable.html      
    Title Should Be                 Web Table

Então vejo uma validação informando que os campos de senha são obrigatórios

  Page Should Contain          Please Enter an UpperCase,LowerCase Alphabet and a Number

Então vejo uma mensagem de validação informando que os campos não conferem

    Page Should Contain          Passwords dont match
