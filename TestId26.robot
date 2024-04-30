*** Settings ***
Documentation    Caso de prueba para NES Escolares: Registro de Calificaciones de un Aspirante de su Examen de Selección
Library          SeleniumLibrary
Suite setup      Abrir NES Escolares En El Navegador
Suite Teardown   Close Browser

*** Variables ***
${CALIFICACION1}   65
${CALIFICACION2}   61
${CALIFICACION3}   45
${CALIFICACION4}   38
${CALIFICACION5}   81
${CONTRASEÑA}      default_admin_pass
${CURP}            RACN990618MOCMSD00
${TITLE}           NES Escolares | Inicio de Sesión
${URL}             http://192.168.13.128:3001/user_sessions/new
#${URL}             https://pruebas-nes.kadasoftware.com/user_sessions/new
${USUARIO}         default_admin
*** Test Cases ***
Iniciar Sesion
    Login
Registrar Calificaciones Examen Seleccion Aspirante
    Ir a Registro de Calificaciones
    Ir a Agregar Calificaciones
    Seleccionar Parametros Carrera Alumno
    Clic en Buscar
    Registrar Calificaciones
    Clic en Guardar Calificaciones
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
Ir a Registro de Calificaciones
    Mouse Over      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]
    Mouse Over      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]/ul/li[1]/a
    Click Link      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]/ul/li[1]/ul/li[7]/a
    Sleep   10s
Ir a Agregar Calificaciones
    Click Element   xpath://*[@id="all"]/section/article/div/table/tbody/tr[1]/td[7]
    Sleep   6s
Seleccionar Parametros Carrera Alumno
    Sleep   2s
    Select From List By Value   id:calificacion_ficha_carrera_id    2
    #Select From List By Value   id:calificacion_ficha_asignatura_aspirante_id    1
    Select From List By Value   id:calificacion_ficha_ficha_id    564
Clic en Buscar
    Click Element    name:commit
    Sleep   5s
Registrar Calificaciones
    Input Text    xpath:/html/body/div[2]/section/article/form[2]/div[2]/article/div/table/tbody/tr/td[3]/input    ${CALIFICACION1}
    Input Text    xpath:/html/body/div[2]/section/article/form[2]/div[2]/article/div/table/tbody/tr/td[4]/input    ${CALIFICACION2}
    Input Text    xpath:/html/body/div[2]/section/article/form[2]/div[2]/article/div/table/tbody/tr/td[5]/input    ${CALIFICACION3}
    Input Text    xpath:/html/body/div[2]/section/article/form[2]/div[2]/article/div/table/tbody/tr/td[6]/input    ${CALIFICACION4}
    Input Text    xpath:/html/body/div[2]/section/article/form[2]/div[2]/article/div/table/tbody/tr/td[7]/input    ${CALIFICACION5}
Clic en Guardar Calificaciones
    Click Element    xpath://*[@id="contenedor_botones_inferiores"]/input
    Sleep   4s
    Page Should Contain    Las calificaciones se han guardado correctamente.
    Capture Page Screenshot
