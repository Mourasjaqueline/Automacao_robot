# Automação de Testes de Cadastro de Usuários no Serverest

Este projeto de automação, foi desenvolvido com o Robot Framework,e tem como objetivo testar o fluxo de cadastro de usuários no website [Serverest](https://front.serverest.dev/cadastrarusuarios). Os testes cobrem tanto cenários de sucesso quanto de falha, garantindo a robustez e a qualidade do processo de registro de novos usuários.

## Tecnologias Utilizadas

* **Robot Framework:** Framework de automação de testes genérico e de código aberto.
* **SeleniumLibrary:** Biblioteca do Robot Framework para automação de navegadores web.
* **BuiltIn:** Biblioteca padrão do Robot Framework com funcionalidades essenciais.
* **Navegador:** Google Chrome (configurado na variável `${BROWSER}`).

## Pré-requisitos

Antes de executar os testes, certifique-se de ter os seguintes softwares instalados:

* **Python:** Versão compatível com o Robot Framework.
* **pip:** Gerenciador de pacotes do Python.
* **Robot Framework:** Pode ser instalado com `pip install robotframework`.
* **SeleniumLibrary:** Pode ser instalada com `pip install robotframework-seleniumlibrary`.
* **WebDriver do Chrome:** Certifique-se de que o ChromeDriver esteja instalado e acessível no seu PATH ou configurado corretamente para a SeleniumLibrary. Você pode baixá-lo em [ChromeDriver Downloads](https://chromedriver.chromium.org/downloads).

## Estrutura do Projeto

O projeto está organizado da seguinte forma:
Automacao Robot/
├── resourcestests.robot    # Arquivo de recursos com configurações, variáveis e keywords
└── testbdd.robot # Arquivo contendo os casos de teste com escrita em gherkin




## Casos de Teste Implementados

Os seguintes cenários de teste foram implementados utilizando a abordagem Behavior-Driven Development (BDD):

1.  **Cenário 1 - Cadastro de novo usuário:**
    * Verifica o fluxo de cadastro com dados válidos, garantindo que um novo usuário seja criado e redirecionado para a página inicial.
    * **Tag:** `Cadastro de novo usuário`
2.  **Cenário 2 - Cadastro com nome em branco:**
    * Testa o comportamento do sistema ao tentar cadastrar um usuário com o campo "Nome" vazio, verificando se o usuário permanece na página de cadastro e o cadastro não é concluído.
    * **Tag:** `Falha no cadastro`
3.  **Cenário 3 - Cadastro com email em branco:**
    * Testa o comportamento ao tentar cadastrar com o campo "Email" vazio, verificando se o usuário permanece na página de cadastro e o cadastro não é concluído.
    * **Tag:** `Falha no cadastro`
4.  **Cenário 4 - Cadastro com senha em branco:**
    * Testa o comportamento ao tentar cadastrar com o campo "Senha" vazia, verificando se o usuário permanece na página de cadastro e o cadastro não é concluído.
    * **Tag:** `Falha no cadastro`
5.  **Cenário 5 - Cadastro com formato de email inválido:**
    * Verifica se o sistema impede o cadastro com um formato de email inválido, mantendo o usuário na página de cadastro e não concluindo o registro.
    * **Tag:** `Falha no cadastro`
6.  **Cenário 6 - Cadastro com email já existente:**
    * Testa o cenário em que um usuário tenta se cadastrar com um email já registrado, verificando se o sistema impede o cadastro e o usuário permanece na página de cadastro.
    * **Tag:** `Falha no cadastro`
7.  **Cenário 7 - Cadastro como administrador:**
    * Verifica o fluxo de cadastro de um usuário com permissões de administrador, garantindo que, ao marcar a opção correspondente, o usuário seja redirecionado para a página inicial de administrador.
    * **Tag:** `Cadastro de novo usuário`
9.  **Cenário 8 - Validar campos Vazios:**
    * Testa o comportamento ao tentar cadastrar sem preencher nenhum campo, verificando se o usuário permanece na página de cadastro e o registro não é concluído (e possivelmente se mensagens de erro são exibidas, embora a validação de mensagens não esteja explicitamente no código fornecido).
    * **Tag:** `Falha no cadastro`

## Como Executar os Testes

1.  **Navegue até o diretório do projeto** no seu terminal.
2.  **Execute o seguinte comando** para rodar todos os testes:

    ```bash
    robot seu_arquivo_de_testes.robot
    ```

    Para executar testes com tags específicas, você pode usar a opção `-i`:

    ```bash
    robot -i "Cadastro de novo usuário" testbdd.robot
    robot -i "Falha no cadastro" testbdd.robot
    robot -i "Cadastro de usuário admin" testbdd.robot
    ```

3.  **Após a execução**, os resultados serão gerados nos arquivos `log.html` e `report.html` (geralmente criados em uma pasta `output`, dependendo da sua configuração). Abra esses arquivos no seu navegador para visualizar os detalhes da execução dos testes.

## Arquivo de Recursos (`resourcestests.robot`)

Este arquivo contém configurações, variáveis e keywords reutilizáveis para os testes:

* **Settings:** Define a documentação da suite, importa as bibliotecas `SeleniumLibrary` e `BuiltIn`, e configura o `Suite Setup` (abrir o navegador) e `Suite Teardown` (fechar o navegador e tirar um screenshot da página).
* **Variables:** Define variáveis como a URL do site, o navegador a ser utilizado, os locators dos elementos da página de cadastro (IDs e XPath), o timeout padrão e as URLs da página inicial (para usuário comum e administrador).
* **Keywords:** Contém palavras-chave personalizadas que encapsulam as ações e verificações realizadas nos testes, tornando os casos de teste mais legíveis e fáceis de manter (por exemplo, `Abrir site`, `Preencher campos válidos`, `Validar redirecionamento para home`).

## Próximos Passos e Melhorias

* **Validação de Mensagens de Erro:** Implementar validações para garantir que as mensagens de erro corretas são exibidas quando os campos são preenchidos incorretamente ou deixados em branco.
* **Cenários Adicionais:** Adicionar mais cenários de teste, como validação de senhas (complexidade, confirmação), tratamento de outros campos (se houver), e possíveis mensagens de sucesso no cadastro.
* **Data-Driven Testing:** Considerar a utilização de arquivos de dados externos para executar os mesmos cenários com diferentes conjuntos de dados (por exemplo, diferentes formatos de email inválidos).
* **Relatórios Mais Detalhados:** Integrar bibliotecas como Allure para gerar relatórios de teste mais visuais e informativos.
* **Execução em Diferentes Navegadores:** Configurar o projeto para ser executado em outros navegadores (Firefox, Edge) através da variável `${BROWSER}` ou da linha de comando.
* 

## Contribuição

Sinta-se à vontade para contribuir com este projeto! Você pode abrir issues para relatar bugs ou sugerir melhorias.

