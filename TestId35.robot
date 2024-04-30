*** Settings ***
Documentation    Caso de prueba para NES Escolares: Nuevo grupo de Propedéutico
Library          SeleniumLibrary
Suite setup      Abrir NES Escolares En El Navegador
Suite Teardown   Close Browser

*** Variables ***
${CONTRASEÑA}      default_escolar_pass
${DELAY}           1
${FECHA_FIN}       2021-09-30
${FECHA_INICIO}    2021-05-24
${NAVEGADOR}       Chrome
${NOMBRE_GRUPO}    PCLA-001
${TITLE}           NES Escolares | Inicio de Sesión
${URL}             http://192.168.13.128:3001/user_sessions/new
#${URL}             https://pruebas-nes.kadasoftware.com/user_sessions/new
${USUARIO}         default_escolar
*** Test Cases ***
Iniciar Sesion
    Login
Nuevo Grupo de Propedeutico
    Ir a Grupos de Propedeutico
    Ir a Nuevo Registro de Grupo
    Seleccionar Carrera
    Ingresar Nombre de Grupo
    Clic en Guardar
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
Ir a Grupos de Propedeutico
    Mouse Over      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]
    Mouse Over      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]/ul/li[2]/a
    Click Link      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]/ul/li[2]/ul/li[2]/a
    Sleep   10s
Ir a Nuevo Registro de Grupo
    Click Link    xpath://*[@id="nuevo"]
    Sleep   5s
    Location Should Contain    http://192.168.13.128:3001/grupos_propedeuticos/new
Seleccionar Carrera
    Select From List By Value   id:grupo_propedeutico_carrera_id    3
Ingresar Nombre de Grupo
    Input Text    id:grupo_propedeutico_nombre    ${NOMBRE_GRUPO}
Clic en Guardar
    Click Element    name:commit
    Sleep   5s
    Location Should Be    http://192.168.13.128:3001/grupos_propedeuticos
    Table Should Contain    xpath:/html/body/div[2]/section/article/div/table    ${NOMBRE_GRUPO}