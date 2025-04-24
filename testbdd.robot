*** Settings ***
Documentation     Suite de testes para o cadastro de usuários no Serverest.
Resource          resourcestests.robot
Suite Setup       Abrir site
Suite Teardown    Fechar navegador



*** Test Cases ***
Cenário 1 - Cadastro de novo usuário
    [Documentation]        Esse testes verfifica o cadastro de um novo usuário
    ...                    Para sucesso nessa execução, é necessário possuir um e-mail não cadastrado na base de dados
    [Tags]                 Cadastro de novo usuario    
    Dado que eu estou na tela de cadastro
    Quando preencher os campos com dados válidos
    E clicar no botão de cadastrar
    Então deve direcionar o usuário para a home

Cenário 2 - Cadastro com nome em branco
    [Documentation]        Testa o cadastro com o campo 'Nome' deixado em branco.
    [Tags]                Falha no cadastro
    Dado que eu estou na tela de cadastro
    Quando preencher campo nome em branco
    E clicar no botão de cadastrar
    Então deve permanecer na página de cadastro
    E o cadastro não deve ser concluído

Cenário 3 - Cadastro com email em branco
    [Documentation]        Testa o cadastro com o campo 'Email' deixado em branco.
    [Tags]                Falha no cadastro
    Dado que eu estou na tela de cadastro
    Quando preencher campo email em branco
    E clicar no botão de cadastrar
    Então deve permanecer na página de cadastro
    E o cadastro não deve ser concluído


Cenário 4 - Cadastro com senha em branco
    [Documentation]        Testa o cadastro com o campo 'Senha' deixado em branco
    [Tags]                Falha no cadastro
     Dado que eu estou na tela de cadastro
    Quando preencher campo senha em branco
    E clicar no botão de cadastrar
    Então deve permanecer na página de cadastro
    E o cadastro não deve ser concluído

Cenário 5 - Cadastro com formato de email inválido
    [Documentation]       Testa o cadastro com um formato de email inválido.
    [Tags]                Falha no cadastro
    Dado que eu estou na tela de cadastro
    Quando preencher email com formato invalido
    E clicar no botão de cadastrar
    Então deve permanecer na página de cadastro
    E o cadastro não deve ser concluído
    
Cenário 6 - Cadastro com email já existente
    [Documentation]       Testa o cadastro utilizando um email que já existe na base de dados.
    [Tags]                Falha no cadastro
    Dado que eu estou na tela de cadastro
    Quando preencher email já existente
    E clicar no botão de cadastrar
    Então deve permanecer na página de cadastro
    E o cadastro não deve ser concluído

Cenário 7 - Cadastro como administrador
    [Documentation]        Testa o cadastro de um novo usuário com permissões de administrador.
    [Tags]                 Cadastro de usuário admin
    Dado que eu estou na tela de cadastro
    Quando preencher os campos com dados admin
    E clicar no botão de cadastrar
    Então deve direcionar o usuário para home admin

Cenário 8 - Validar campos Vazios
    [Documentation]       Testa o comportamento ao clicar em cadastrar com todos os campos vazios.
    [Tags]                Falha no cadastro
   Dado que eu estou na tela de cadastro
   Quando clicar no botão de cadastrar
   Então deve permanecer na página de cadastro
   E o cadastro não deve ser concluído
