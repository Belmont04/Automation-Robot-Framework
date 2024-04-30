*** Settings ***
Documentation    Caso de prueba para NES Escolares: Nuevo periodo de Propedéutico
Library          SeleniumLibrary
Suite setup      Abrir NES Escolares En El Navegador
Suite Teardown   Close Browser

*** Variables ***
${NOM_COMPLETO}    RAMOS CASTRO NADIA
${CONTRASEÑA}      default_admin_pass
${DELAY}           1
${FECHA_FIN}       2021-09-30
${FECHA_INICIO}    2021-05-24
${NAVEGADOR}       Chrome
${PROMEDIO}        5.1
${TITLE}           NES Escolares | Inicio de Sesión
${URL}             http://192.168.13.128:3001/user_sessions/new
#${URL}             https://pruebas-nes.kadasoftware.com/user_sessions/new
${USUARIO}         default_admin
*** Test Cases ***
Iniciar Sesion
    Login
Nuevo Periodo de Propedeutico
    Ir a Periodos de Propedeutico
    Ir a Nuevo Registro de Propedeutico
    Seleccionar Ciclo
    Establecer Fecha Inicio
    Establecer Fecha Fin
    Seleccionar Tipo Propedeutico
    Clic en Guardar
    Activar Periodo Propedeutico
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
Ir a Periodos de Propedeutico
    Mouse Over      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]
    Mouse Over      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]/ul/li[2]/a
    Click Link      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]/ul/li[2]/ul/li[1]/a
    Sleep   10s
Ir a Nuevo Registro de Propedeutico
    Click Link    xpath://*[@id="nuevo"]
    Sleep   5s
    Location Should Contain    http://192.168.13.128:3001/periodos_propedeuticos/new
Seleccionar Ciclo
    Select From List By Value   id:periodo_propedeutico_ciclo_id    30
Establecer Fecha Inicio
    #Click Element    id:periodo_propedeutico_fecha_inicio
    #Select From List By Value   xpath:/html/body/div[3]/div/div/select[1]    4
    #Click Element    xpath:/html/body/div[3]/table/tbody/tr[5]/td[1]
    Input Text    id:periodo_propedeutico_fecha_inicio    ${FECHA_INICIO}
    Press Keys    id:periodo_propedeutico_fecha_inicio   RETURN
Establecer Fecha Fin
    #Click Element    id:periodo_propedeutico_fecha_fin
    #Select From List By Value   xpath:/html/body/div[3]/div/div/select[1]    8
    #Click Element    xpath:/html/body/div[3]/table/tbody/tr[5]/td[4]
    Input Text    id:periodo_propedeutico_fecha_fin    ${FECHA_FIN}
    Press Keys    id:periodo_propedeutico_fecha_fin   RETURN
Seleccionar Tipo Propedeutico
    Select From List By Value   id:periodo_propedeutico_tipo    CORTO
Clic en Guardar
    Click Element    name:commit
    Sleep   5s
    Location Should Be    http://192.168.13.128:3001/periodos_propedeuticos
Activar Periodo Propedeutico
    Click Element    xpath://*[@id="all"]/section/article/div/table/tbody/tr[3]/td[5]/a
    Alert Should Be Present    ¿Estas seguro que desea activar o desactivar este periodo?    ACCEPT
    Sleep   3s
    Capture Page Screenshot
