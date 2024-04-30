*** Settings ***
Documentation    Caso de prueba para NES Escolares: Editar Status de un Aspirante
Library          SeleniumLibrary
Suite setup      Abrir NES Escolares En El Navegador
Suite Teardown   Close Browser

*** Variables ***
${CALIFICACION1}   3.1
${CALIFICACION2}   6.1
${CALIFICACION3}   4.5
${CALIFICACION4}   3.8
${CALIFICACION5}   8.1
${CONTRASEÑA}      default_admin_pass
#${CURP}            RACN990618MOCMSD00
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
Editar Status Aspirante
    Ir a Registro de Calificaciones
    Ir a Editar Status
    Seleccionar Parametros Estudiante
    Cambiar Status Aspirante
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
Ir a Editar Status
    Mouse Over      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]
    Mouse Over      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]/ul/li[1]/a
    Click Link      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]/ul/li[1]/ul/li[5]/a
    Sleep   10s
Seleccionar Parametros Estudiante
    Sleep   2s
    Select From List By Value   id:periodo_id    48
    Select From List By Value   id:carrera_id    2
    Select From List By Value   id:tipo_ficha    CORTO
    Select From List By Value   id:fecha_examen    2021-07-05 00:00:00 UTC
    Select From List By Value   id:sede_examen    MÉXICO
    Input Text       id:promedio_examen    ${PROMEDIO}
    Click Element    name:commit
    Sleep   2s
    Page Should Contain Element    xpath://*[@id="aspirantes_list"]/div[2]/form/table
Cambiar Status Aspirante
    ${element}    Get WebElement    xpath:/html/body/div[2]/section/article/div/form/div[3]/div[2]/form/table/tbody/tr/td[4]/select
    ${id}    Get Element Attribute     ${element}    id
    Select From List By Value   id:${id}    ACEPTADO
Clic en Guardar Status
    Click Element    xpath:/html/body/div[2]/section/article/div/form/div[3]/div[2]/form/div[2]/input
    Sleep   4s
    Page Should Contain    El status de los aspirantes se ha actualizado.