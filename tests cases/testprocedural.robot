*** Settings ***
Documentation     Suite de testes para o cadastro de usuários no Serverest.
Resource    ../resources/resourcestests.robot
Suite Setup       Abrir site
Suite Teardown    Fechar navegador

    
*** Test Cases ***
Cenário 1 - Cadastro de novo usuário
    [Documentation]        Esse testes verfifica o cadastro de um novo usuário
    ...                    Para sucesso nessa execução, é necessário possuir um e-mail não cadastrado na base de dados
    [Tags]                 Cadastro de novo usuário    
    Abrir site
    Verificar titulo da página "Front - ServeRest"
    Preencher campos válidos
    Validar redirecionamento para home
    Fechar navegador

Cenário 2 - Cadastro com nome em branco
    [Tags]                Falha no cadastro
    Abrir site
    Verificar titulo da página "Front - ServeRest"
    Preencher campo nome em branco 
    Validar que permaneceu na tela de cadastro
    Fechar navegador

Cenário 3 - Cadastro com email em branco
    [Tags]                Falha no cadastro
    Abrir site
    Verificar titulo da página "Front - ServeRest"
    Preencher campo email em branco
    Validar que permaneceu na tela de cadastro
    Fechar navegador

Cenário 4 - Cadastro com senha em branco
    [Tags]                Falha no cadastro
    Abrir site
    Verificar titulo da página "Front - ServeRest"
    Preencher campo senha em branco 
    Validar que permaneceu na tela de cadastro     
    Fechar navegador

Cenário 5 - Cadastro com formato de email inválido
    [Tags]                Falha no cadastro
    Abrir site
    Verificar titulo da página "Front - ServeRest"
    Preencher campo email com formato invalido
    Validar que permaneceu na tela de cadastro
    Fechar navegador

Cenário 6 - Cadastro com email já existente
    [Tags]                Falha no cadastro
    Abrir site
    Verificar titulo da página "Front - ServeRest"
    Preencher com email existente 
    Validar que permaneceu na tela de cadastro 
    Fechar navegador

Cenário 7 - Cadastro como administrador
    [Tags]                 Cadastro de novo usuário  
    Abrir site
    Verificar titulo da página "Front - ServeRest"
    Preencher e marcar como admin
    Validar redirecionamento para admin
    Fechar navegador


Cenário 8 - Validar campos Vazios
    [Tags]                Falha no cadastro
    Abrir site 
    Verificar titulo da página "Front - ServeRest"
    Validar que permaneceu na tela de cadastro
    Fechar navegador