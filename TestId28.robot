*** Settings ***
Documentation    Caso de prueba para NES Escolares: Editar Status a Alumnos Inscritos a Propedéutico
Library          SeleniumLibrary
Suite setup      Abrir NES Escolares En El Navegador
Suite Teardown   Close Browser

*** Variables ***
#${NOM_COMPLETO}    RAMOS CASTRO NADIA
${CAL_ALGORITMOS_A1}    3.2
${CAL_ALGORITMOS_A2}    3.8
${CAL_FISICA_A1}        4.6
${CAL_FISICA_A2}        4.7
${CAL_LOGICA_A1}        3.9
${CAL_LOGICA_A2}        3.4
${CAL_MATEMATICAS_A1}   5.1
${CAL_MATEMATICAS_A2}   5.6
${CONTRASEÑA}           default_admin_pass
${DELAY}                1
${NAVEGADOR}            Chrome
${PROMEDIO_A1}          4.2
${PROMEDIO_A2}          4.3
${TITLE}                NES Escolares | Inicio de Sesión
${URL}                  http://192.168.13.128:3001/user_sessions/new
#${URL}                  https://pruebas-nes.kadasoftware.com/user_sessions/new
${USUARIO}              default_admin
*** Test Cases ***
Iniciar Sesion
    Login

Editar Status Aspirante Inscrito Propedeutico
    Ir a Editar Status de Propedeutico
    Seleccionar Parametros Estudiante
    Clic en Buscar
    Editar Status Propedeutico
    Clic en Guardar Status


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
Ir a Editar Status de Propedeutico
    Mouse Over      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]
    Mouse Over      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]/ul/li[2]/a
    Click Link      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]/ul/li[2]/ul/li[6]/a
    Sleep   10s
Seleccionar Parametros Estudiante
    Location Should Be    http://192.168.13.128:3001/inscripciones_propedeuticos
    Sleep   2s
    Select From List By Value   id:periodo_id    30
    Select From List By Value   id:carrera_id    1
    Select From List By Value   id:tipo_ficha    CORTO
    Select From List By Value   id:grupo_id      1
    Input Text                  id:promedio_propedeutico    ${PROMEDIO_A2}
Clic en Buscar
    Click Element    name:commit
    Sleep   10s
    Page Should Contain Element    xpath:/html/body/div[2]/section/article/form/div[2]/div[2]/div/form/div[2]/table
Editar Status Propedeutico
    ${element}    Get WebElement    xpath:/html/body/div[2]/section/article/form/div[2]/div[2]/div/form/div[2]/table/tbody/tr/td[3]/select
    ${id}    Get Element Attribute     ${element}    id
    Select From List By Value   id:${id}    ACEPTADO
Clic en Guardar Status
    Click Element    xpath:/html/body/div[2]/section/article/form/div[2]/div[2]/div/form/div[2]/div/input
    Sleep   8s
    Page Should Contain    El status de los aspirantes se ha actualizado.
    Capture Page Screenshot