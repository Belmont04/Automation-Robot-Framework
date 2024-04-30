*** Settings ***
Documentation    Caso de prueba para NES Escolares: Inscribir Aspirante a Propedéutico en Ventanilla
Library          SeleniumLibrary
Suite setup      Abrir NES Escolares En El Navegador
Suite Teardown   Close Browser

*** Variables ***
${NOM_COMPLETO}    RAMOS CASTRO NADIA
${CONTRASEÑA}      default_admin_pass
${DELAY}           1
${NAVEGADOR}       Chrome
${PROMEDIO}        5.1
${TITLE}           NES Escolares | Inicio de Sesión
${URL}             http://192.168.13.128:3001/user_sessions/new
#${URL}             https://pruebas-nes.kadasoftware.com/user_sessions/new
${USUARIO}         default_admin
*** Test Cases ***
Iniciar Sesion
    Login
Inscribir Aspirante a Propedeutico en Ventanilla
    Ir a Propedeutico en Ventanilla
    Ir a Nuevo Registro
    Ingresar Nombre Estudiante
    Seleccionar Grupo
    Click en Guardar
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
Ir a Propedeutico en Ventanilla
    Mouse Over      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]
    Mouse Over      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]/ul/li[2]/a
    Click Link      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]/ul/li[2]/ul/li[5]/a
    Sleep   10s
Ir a Nuevo Registro
    Click Element    xpath://*[@id="all"]/section/article/div/table/tbody/tr[2]/td[4]/a
    Sleep   5s
    Location Should Contain    http://192.168.13.128:3001/windows_propaedeutics/new
Ingresar Nombre Estudiante
    Input Text    id:alumno_nombre    ${NOM_COMPLETO}
    Press Keys    id:alumno_nombre   ARROW_DOWN    ARROW_DOWN
    Press Keys    id:alumno_nombre   RETURN
    Sleep   4s
    Page Should Contain    El estatus del aspirante es: ACEPTADO!!
Seleccionar Grupo
    Sleep   2s
    Select From List By Value   id:inscripcion_propedeutico_grupo_propedeutico_id    3
Clic en Guardar
    Click Element    name:commit
    Sleep   4s
    Capture Page Screenshot
