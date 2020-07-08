*** Settings ***
Resource             ../Resource/Resource.robot
Resource             ../Resource/PageObject/Register_PO.robot
Test Setup           Nova sessão   
Test Teardown        Encerra sessão

*** Test Cases ***

Cenário: CTO1- Realizar cadastro de usuário
	[tags]      cadastro
    Dado que acessei o formulario de cadastro de usuario
	Quando eu preencho os campos obrigatorios
    E clico em "Enviar"
	Então vejo a listagem de usuarios 
Cenário: CT02- Campo senha deve ser obrigatorio 
	[tags]      obrigatorio
    Dado que acessei o formulario de cadastro de usuario
	Quando eu nao preencho os campos obrigatorios de senha
    E clico em "Enviar"
	Então vejo uma validação informando que os campos de senha são obrigatórios

Cenário: CT03- Senha nao confere
    [tags]      senhanaoconfere
    Dado que acessei o formulario de cadastro de usuario
	Quando eu preencho os campos obrigatorios informando senhas diferentes
    E clico em "Enviar"
    Então vejo uma mensagem de validação informando que os campos não conferem
