*** Settings ***
Documentation    Essa suite testa o site da Amazon
Resource    amazon_resources.robot
Test Setup    Abrir o navegador e o site
Test Teardown    Fechar o navegador
Library    Collections

*** Test Cases ***

Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste verifica o menu eletrônicos do site da Amazon.com.br
    ...                e verifica a categoria Computadores e Informática
    [Tags]             menus    categorias
    Clicar em "Continuar comprando" se aparecer    
    Entrar no menu "Eletrônicos"
    Verificar se o título da pagina fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece a categoria "TV e Cinema"

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos  lista_busca
    ${PRODUTO}=    Set Variable    Xbox Series S
    Clicar em "Continuar comprando" se aparecer
    Digitar o nome de produto ${PRODUTO} no campo Pesquisa
    Clicar no botão de Pesquisa
    Verificar resultado da pesquisa, se está listando o produto pesquisado    ${PRODUTO}


    