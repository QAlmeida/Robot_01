*** Settings ***
Library    Browser
Library    Collections

*** Variables ***
${BROWSER}    chromium
${PAGE}    https://www.amazon.com.br/

*** Keywords ***
Abrir o navegador e o site
    New Browser    browser=${BROWSER}    headless=False
    New Page    ${PAGE}
    Set Viewport Size    1920    1080
    ${TITULO}=    Get Title
    Should Contain    ${TITULO}    Amazon

Fechar o navegador
    Take Screenshot    screenshot.png    mask=//a[@id='nav-cart']
    Close Browser

Clicar em "Continuar comprando" se aparecer
    Run Keyword And Ignore Error    Click    //button[contains(., 'Continuar comprando')]    

Entrar no menu "${MENU}"
    Click    //a[contains(text(),'Eletrônicos')]

Verificar se o título da pagina fica "${TITULO_PAGE}"
    Get Title    ==    ${TITULO_PAGE}

Verificar se aparece a frase "${FRASE}"
    Get Text    (//span[contains(text(),'${FRASE}')])[1]

Verificar se aparece a categoria "${CATEGORIA}"
    Get Text    //span[@class='a-size-base-plus'][normalize-space()='${CATEGORIA}']

Digitar o nome de produto ${PRODUTO} no campo Pesquisa
    Fill Text    //input[@id='twotabsearchtextbox']    ${PRODUTO}

Clicar no botão de Pesquisa
    Click    //input[@id='nav-search-submit-button']

Get Texts
    [Arguments]    ${xpath}
    ${elementos}=    Get Elements    ${xpath}
    @{textos}=    Create List
    FOR    ${el}    IN    @{elementos}
        ${texto}=    Get Text    ${el}
        Append To List    ${textos}    ${texto}
    END
    [Return]    ${textos}


Verificar resultado da pesquisa, se está listando o produto pesquisado
    [Arguments]    ${PRODUTO}
    ${TITULOS}=    Get Texts   //h2//span
    ${TEM_PRODUTO}=    Evaluate    any('${PRODUTO}' in t for t in ${TITULOS})
    Should Be True    ${TEM_PRODUTO}    O produto ${PRODUTO} não foi encontrado nos resultados!

      