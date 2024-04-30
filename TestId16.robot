*** Settings ***
Documentation    Caso de prueba para NES Escolares: Inscripción Aspiarante a Primer Semestre en Ventanilla
Library          SeleniumLibrary
Suite setup      Abrir NES Escolares En El Navegador
Suite Teardown   Close Browser

*** Variables ***
${CONTRASEÑA}          default_escolar_pass
${DELAY}               1
${NOM_COMPLETO}        RAMOS CASTRO NADIA
${NAVEGADOR}           Chrome
${PROMEDIO}            5.1
${TITLE}               NES Escolares | Inicio de Sesión
${URL}                 http://192.168.13.128:3001/user_sessions/new
#${URL}                 https://pruebas-nes.kadasoftware.com/user_sessions/new
${USUARIO}             default_escolar
*** Test Cases ***
Iniciar Sesion
    Login
Inscribir Aspirante a Primer Semestre en Ventanilla
    Buscar Aspiarante Buscador Principal
    Clic en Buscar
    Ir a Inscribir
    Seleccionar Carrera
    Seleccionar Grupo
    Clic en Inscribir
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
Buscar Aspiarante Buscador Principal
    Input Text    id:alumno_nombre_superior   ${NOM_COMPLETO}
    Press Keys    id:alumno_nombre_superior   ARROW_DOWN    RETURN
Clic en Buscar
    Click Element    xpath://*[@id="alumno_nombre"]/input[2]
    Sleep   5s
    Page Should Contain Element    xpath://*[@id="all"]/section/div[1]/ul
Ir a Inscribir
    Click Link    xpath://*[@id="all"]/section/div[1]/ul/li[6]/a
    Sleep   3s
    Page Should Contain Element    xpath://*[@id="all"]/section/article/div[1]
    Page Should Contain    Información de Inscripción
    Table Header Should Contain    xpath://*[@id="all"]/section/article/div[2]/form/table[1]    Información de Inscripción
Seleccionar Carrera
    Select From List By Value   id:inscripciones_carrera_id    1
    Sleep   5s
    ${semestre}    Get Text    id:semestre_nombre
    Should Be Equal    ${semestre}    PRIMERO
    Should Not Be Empty    id:asignaturas_id
    Table Column Should Contain    id:asignaturas_id    1    Disponible
    Table Column Should Contain    id:asignaturas_id    2    Clave
    Table Column Should Contain    id:asignaturas_id    3    Asignatura
    Table Column Should Contain    id:asignaturas_id    4    Estado
    #Page Should Contain    Semestre:PRIMERO
Seleccionar Grupo
    Select From List By Index   id:inscripciones_grupo_id    0
Clic en Inscribir
    Click Element    id:inscribir
    Sleep   2s
    Alert Should Be Present    ¿Desea realizar la inscripción?    ACCEPT
    Capture Page Screenshot
    Sleep   3s
    Capture Page Screenshot
