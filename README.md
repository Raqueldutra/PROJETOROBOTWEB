# Projeto PROJETOROBOTWEB

Aplica teste funcional ao cadastro de usuário no site  http://demo.automationtesting.in/Register.html , utilizando a técnica BDD com as ferramentas: selenium Web Drive e Robot Framework.


# Funcionalidades testadas
* Cadastro de usuario
* Campo Senha deve ser obrigatório
* Senha não confere

# Requisitos
* [Phyton 3.8+](https://www.python.org/downloads/)
* Robot Framework: pip install robotframework
* Chrome 70+
* [Chromedriver 70+](https://github.com/SeleniumHQ/selenium/wiki/ChromeDriver)

# Instalando dependências
* pip install robotframework-seleniumlibrary

# Executando o projeto
robot -d ./report Tests\register.robot

Serão executados todos os casos de testes e os detalhes com os prints do resultado de cada caso de teste estarão disponíveis em relatório HTML no diretório /report.

# Implementações/Melhorias futuras

* Refactoração do codigo na captura de elementos com xpath
* Melhoria nas validações
* Implementação de PageObject
