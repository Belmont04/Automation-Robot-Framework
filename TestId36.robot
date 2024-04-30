*** Settings ***
Documentation    Caso de prueba para NES Escolares: Inscribir Aspirante a Propedéutico en Línea
Library          SeleniumLibrary
Suite setup      Abrir NES Escolares En El Navegador
Suite Teardown   Close Browser

*** Variables ***
${CARRERA}         INGENIERÍA EN COMPUTACIÓN
${CONTRASEÑA}      default_admin_pass
${DELAY}           1
${GRUPO}           PCIC-002
${NAVEGADOR}       Chrome
${TIPO_PROPE}      CORTO
${TITLE}           NES Escolares | Inicio de Sesión
${URL}             http://192.168.13.128:3001/user_sessions/new
#${URL}             https://pruebas-nes.kadasoftware.com/user_sessions/new
${USUARIO}         default_admin
*** Test Cases ***
Iniciar Sesion
    Login
Inscribir Aspirante a Propedeutico en Linea
    Ir a Propedeutico en Linea
    Seleccionar Carerra
    Seleccionar Tipo Propedeutico
    Clic en Buscar
    Clic en Ver Detalles
    Seleccionar Grupo de Propedeutico
    Inscribir Aspirante a Propedeutico
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
    Sleep   2s
Ir a Propedeutico en Linea
    Mouse Over      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]
    Mouse Over      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]/ul/li[2]/a
    Click Link      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]/ul/li[2]/ul/li[4]/a
    Sleep   6s
Seleccionar Carerra
    Sleep   2s
    Select From List By Label    id:carrera_id     ${CARRERA}
Seleccionar Tipo Propedeutico
    Select From List By Label    id:semestre_id    ${TIPO_PROPE}
Clic en Buscar
    Click Element     name:commit
    Sleep   4s
    Page Should Contain Element    xpath:/html/body/div[2]/section/article/div/article/div/table
Clic en Ver Detalles
    Click Element    xpath://*[@id="inscripcion_list_div"]/article/div/table/tbody/tr/td[5]/a
    Sleep   4s
    Location Should Contain    http://192.168.13.128:3001/inscripciones_prope
Seleccionar Grupo de Propedeutico
    Select From List By Label    id:grupo_id    ${GRUPO}
Inscribir Aspirante a Propedeutico
    Click Element    id:reinscribir_button
    Alert Should Be Present    ¿Desea realizar la Inscripción al propedéutico?    ACCEPT
    Sleep   3s
    Page Should Contain    La inscripción se ha guardado.
    Page Should Contain    Inscripción guardada exitosamente
    Location Should Be      http://192.168.13.128:3001/inscripciones_prope/inscripcion_guardada
    Capture Page Screenshot
