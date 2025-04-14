*** Settings ***
Documentation     Suite de testes para o cadastro de usuários no Serverest.
Library           SeleniumLibrary
Library           BuiltIn
Suite Setup       Abrir site
Suite Teardown    Fechar navegador

*** Variables ***
${URL}                         https://front.serverest.dev/cadastrarusuarios
${BROWSER}                     chrome
${input_nome}                  id:nome
${input_email}                 id:email
${input_password}              id:password
${button_cadastrar}            xpath=//button[@data-testid='cadastrar']
${input_administrador}         id:administrador
${TIMEOUT_PADRAO}              40s
${URL_HOME}                    https://front.serverest.dev/home
${URL_ADMIN_HOME}              https://front.serverest.dev/admin/home

*** Keywords ***
Abrir site
    Open Browser            ${URL}         ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT_PADRAO}

Fechar navegador
    Close Browser

Validar redirecionamento para home
    Wait Until Location Contains     ${URL_HOME}    

Validar redirecionamento para admin
    Wait Until Location Contains     ${URL_ADMIN_HOME} 

Validar que permaneceu na tela de cadastro
    Wait Until Location Contains     ${URL}

Preencher campos válidos
    Input Text    ${input_nome}       Jessica Silva
    Input Text    ${input_email}      ogloboteste2265465842@gmail.com
    Input Text    ${input_password}   12109975@Ja
    Click Button  ${button_cadastrar}

Preencher campo nome em branco
    Input Text    ${input_nome}       ${EMPTY}
    Input Text    ${input_email}      teste.nome.branco@teste.com
    Input Text    ${input_password}   123456789@@
    Click Button  ${button_cadastrar}

Preencher campo email em branco
    Input Text    ${input_nome}       Jessica Teste Email Branco
    Input Text    ${input_email}      ${EMPTY}
    Input Text    ${input_password}   SenhaParaEmailBranco123
    Click Button  ${button_cadastrar}

Preencher campo senha em branco
    Input Text    ${input_nome}       Jessica Teste Senha Branca
    Input Text    ${input_email}      senha.branco.v7@teste.com
    Input Text    ${input_password}   ${EMPTY}
    Click Button  ${button_cadastrar}

Preencher campo email com formato invalido
    Input Text    ${input_nome}       Nome Formato Email Inv
    Input Text    ${input_email}      email.formato.invalido.com
    Input Text    ${input_password}   SenhaFormatoEmailInv123
    Click Button  ${button_cadastrar}

Preencher com email existente
    Input Text    ${input_nome}       Nome Email Existente
    Input Text    ${input_email}      ogloboteste21@gmail.com
    Input Text    ${input_password}   SenhaEmailExistente123
    Click Button  ${button_cadastrar}

Preencher e marcar como admin
    Input Text         ${input_nome}               Nome Usuario Admin Basico
    Input Text         ${input_email}              admin.basico1363623@teste.com
    Input Text         ${input_password}           SenhaAdminBasico123
    Select Checkbox    ${input_administrador}
    Click Button       ${button_cadastrar}

Preencher com espaços extras
    Input Text    ${input_nome}       Nome Com Espacos Basico
    Input Text    ${input_email}      espacos.basico@teste.com
    Input Text    ${input_password}   SenhaEspacosBasico123
    Click Button  ${button_cadastrar}

Validar Mensagens De Erro Quando Campos Estão Vazios
    Click Button    ${button_cadastrar}

*** Test Cases ***
Cenário 1 - Cadastro de novo usuário
    Abrir site
    Preencher campos válidos
    Validar redirecionamento para home
    Fechar navegador

Cenário 2 - Cadastro com nome em branco
    Abrir site
    Preencher campo nome em branco 
    Validar que permaneceu na tela de cadastro
    Fechar navegador

Cenário 3 - Cadastro com email em branco
    Abrir site
    Preencher campo email em branco
    Validar que permaneceu na tela de cadastro
    Fechar navegador

Cenário 4 - Cadastro com senha em branco
    Abrir site
    Preencher campo senha em branco 
    Validar que permaneceu na tela de cadastro     
    Fechar navegador

Cenário 5 - Cadastro com formato de email inválido
    Abrir site
    Preencher campo email com formato invalido
    Validar que permaneceu na tela de cadastro
    Fechar navegador

Cenário 6 - Cadastro com email já existente
    Abrir site
    Preencher com email existente 
    Validar que permaneceu na tela de cadastro 
    Fechar navegador

Cenário 7 - Cadastro como administrador
    Abrir site
    Preencher e marcar como admin
    Validar redirecionamento para admin
    Fechar navegador

Cenário 8 - Cadastro com espaços extras
    Abrir site
    Preencher com espaços extras
    Validar que permaneceu na tela de cadastro
    Fechar navegador

Cenário 9 - Validar campos Vazios
    Abrir site 
    Validar Mensagens De Erro Quando Campos Estão Vazios 
    Validar que permaneceu na tela de cadastro
    Fechar navegador
