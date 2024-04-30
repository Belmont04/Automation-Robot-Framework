*** Settings ***
Documentation    Caso de prueba para NES Escolares: Validar Documentos de la Solicitud de Ficha de un Aspirante
Library          SeleniumLibrary
Suite setup      Abrir NES Escolares En El Navegador
Suite Teardown   Close Browser

*** Variables ***
${CONTRASEÑA}  default_admin_pass
${DELAY}       1
${NAVEGADOR}   Chrome
${NOM_ALUMNO}  LOPEZ HERNANDEZ MIGUEL ANGEL
${TITLE}       NES Escolares | Inicio de Sesión
${URL}         http://192.168.13.128:3001/user_sessions/new
${USUARIO}     default_admin

***Test Cases ***
Iniciar Sesión
    Login
Validar Documentos Aspirante
    Ir A Fichas En Linea
    Seleccionar El Tipo De Ficha
    Seleccionar La Carrera
    Esperar Lista De Aspirantes
    Clic En Ver
    Clic En Validar
    Aceptar O Rechazar Documentos
    Clic En Aceptar

***Keywords ***
Abrir NES Escolares En El Navegador
    Open Browser             ${URL}    ${NAVEGADOR}
    Maximize Browser Window
    Set Selenium Speed       ${DELAY}
    Title Should Be          ${TITLE}
Login
    Input Text      id:user_session_login       ${USUARIO}
    Input Text      id:user_session_password    ${CONTRASEÑA}
    Click Button    name:commit
    Sleep   1s
Ir A Fichas En Linea
    Go to    http://192.168.13.128:3001/tokens
Seleccionar El Tipo De Ficha
    Select From List By Value        tipo_ficha    CORTO
Seleccionar La Carrera
    Select From List By Label        carrera_id    LICENCIATURA EN INFORMÁTICA
Esperar Lista De Aspirantes
    Wait Until Element Is Visible    //*[@id="aspirantes_list"]
Clic En Ver
    ${CANTIDAD}=  Get Element Count  //*[@id="aspirantes_list"]/div/table/tbody/tr
    #Click Element    //*[@id="aspirantes_list"]/div/table/tbody/tr[${CANTIDAD}]/td[4]
    #Wait Until Element Is Visible    //*[@id="aspirantes_list"]/div/table/tbody/tr[15]/td[4]
    FOR    ${i}    IN RANGE    2    ${CANTIDAD}+1
        ${celda}    Get Table Cell    xpath://*[@id="aspirantes_list"]/div/table    ${i}    1
        IF    "${celda}" == "${NOM_ALUMNO}"
            Click Element                    //*[@id="aspirantes_list"]/div/table/tbody/tr[${i}-1]/td[4]
            EXIT FOR LOOP
        END
    END
Clic En Validar
    Wait Until Element Is Visible    //*[@id="new_token"]/div[2]/table[3]/tbody/tr/td[1]/a
    Click Element                    //*[@id="new_token"]/div[2]/table[3]/tbody/tr/td[1]/a
Aceptar O Rechazar Documentos
    ${element}    Get WebElement    //*[@id="aspirantes_form"]/table/tbody/tr[1]/td[3]/input[1]
    ${name}    Get Element Attribute     ${element}    name
    Select Radio Button    ${name}                  1       #Valida Acta de Nacimiento
    ${element}    Get WebElement    //*[@id="aspirantes_form"]/table/tbody/tr[2]/td[3]/input[1]
    ${name}    Get Element Attribute     ${element}    name
    Select Radio Button    ${name}                  1       #Valida Certificado de Secundaria
    ${element}    Get WebElement    //*[@id="aspirantes_form"]/table/tbody/tr[3]/td[3]/input[1]
    ${name}    Get Element Attribute     ${element}    name
    Select Radio Button    ${name}                  1       #Valida Certificado de Bachillerato
    ${element}    Get WebElement    //*[@id="aspirantes_form"]/table/tbody/tr[4]/td[3]/input[1]
    ${name}    Get Element Attribute     ${element}    name
    Select Radio Button    ${name}                  1       #Valida el CURP
    Select Radio Button    comprobante[aceptado]    true    #Validar comprobante De Pago
    Select Radio Button    fotografia[aceptado]     true    #Validar Fotografia
    Click Button           name:commit
Clic En Aceptar
    Wait Until Element Is Visible    //*[@id="new_token"]/div[2]/a[1]
    Click Element                    //*[@id="new_token"]/div[2]/a[1]
    Alert Should Be Present          ¿Estás seguro (a) de Aceptar? Los cambios no se podrán deshacer.    ACCEPT
    Page Should Contain Element      //*[@id="edit_token_549"]/div[2]/div/table
    Click Button                     //*[@id="edit_token_549"]/div[2]/div/a

