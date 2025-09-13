*** Settings ***
Resource    amazon_resources.robot
Library    Browser
Library    Collections

*** Keywords ***

Dado que estou na home page da Amazon.com.br
    Clicar em "Continuar comprando" se aparecer

Quando acessar o menu "Eletrônicos"
    Entrar no menu "$MENU"    

Então o título da página deve ficar
    [Arguments]    ${TITULO_PAGE}
    Verificar se o título da pagina fica "${TITULO_PAGE}"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "$FRASE"      

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "$CATEGORIA"    

Quando pesquisar pelo produto ${PRODUTO}
    Digitar o nome de produto $PRODUTO no campo Pesquisa    
    Clicar no botão de Pesquisa

Então pelo menos um produto da linha deve ser mostrado na página
    Verificar resultado da pesquisa, se está listando o produto pesquisado    $PRODUTO    