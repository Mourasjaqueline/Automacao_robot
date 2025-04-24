*** Settings ***
Documentation     Suite de testes para o cadastro de usuários no Serverest.
Library           SeleniumLibrary
Library           BuiltIn

*** Variables ***
${URL}                         https://front.serverest.dev/cadastrarusuarios
${BROWSER}                     chrome
${input_nome}                  id:nome
${input_email}                 id:email
${input_password}              id:password
${button_cadastrar}            xpath=//button[@data-testid='cadastrar']
${input_checkbox}              id:administrador
${Value}                       18s
${URL_HOME}                    https://front.serverest.dev/home
${URL_ADMIN_HOME}              https://front.serverest.dev/admin/home



*** Keywords ***
Abrir site
    Open Browser            ${URL}         ${BROWSER}
    Maximize Browser Window     
    Set Selenium Timeout    ${Value}

Fechar navegador
    Capture Page Screenshot
    Close Browser
    

Verificar titulo da página "${título}"
    Title Should Be    title=${título}

Validar redirecionamento para home
    Wait Until Location Contains     ${URL_HOME}    

Validar redirecionamento para admin
    Wait Until Location Contains     ${URL_ADMIN_HOME} 

Validar que permaneceu na tela de cadastro
    Wait Until Location Contains     ${URL}

Preencher campos válidos
    Input Text    ${input_nome}       Jessica Silva
    Input Text    ${input_email}      og44174582@gmail.com
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
    Input Text    ${input_email}      oglobotesttyy17tttte21@gmail.com
    Input Text    ${input_password}   SenhaEmailExistente123
    Click Button  ${button_cadastrar}

Preencher e marcar como admin
    Input Text         ${input_nome}               Nome Usuario Admin 
    Input Text         ${input_email}              adm44o@teste.com
    Input Text         ${input_password}           SenhaAdminBasico123
    Select Checkbox    ${input_checkbox}
    Click Button       ${button_cadastrar}

Preencher com espaços extras
    Input Text    ${input_nome}       Nome Com Espacos Basico
    Input Text    ${input_email}      espacos.basico@teste.com
    Input Text    ${input_password}   SenhaEspacosBasico123
    Click Button  ${button_cadastrar}

Dado que eu estou na tela de cadastro
    Abrir site

Quando preencher os campos com dados válidos
    Preencher campos válidos

E clicar no checkbox administrador
    Preencher e marcar como admin

E clicar no botão de cadastrar
    Click Button    ${button_cadastrar}

Então deve direcionar o usuário para a home
    Validar redirecionamento para home

Então deve direcionar o usuário para home admin
    Validar redirecionamento para admin

Imprimir URL atual
    ${url_atual}=    Get Location
    Log To Console   URL atual: ${url_atual}

Quando preencher campo nome em branco    
    Preencher campo nome em branco

Quando preencher campo senha em branco
    Preencher campo senha em branco

Quando preencher campo email em branco
    Preencher campo email em branco
    

Então deve permanecer na página de cadastro
    Validar que permaneceu na tela de cadastro

Quando preencher email já existente
    Preencher com email existente

Quando clicar no botão de cadastrar
    Click Button    ${button_cadastrar}

Quando preencher email com formato invalido
    Preencher campo email com formato invalido

E o cadastro não deve ser concluído
    Validar que permaneceu na tela de cadastro

Quando preencher os campos com dados admin
    Preencher e marcar como admin
