*** Settings ***
Documentation    Caso de prueba para NES Escolares: Configuración de Calificaciones de Curso Propedéutico
Library          SeleniumLibrary
Suite setup      Abrir NES Escolares En El Navegador
Suite Teardown   Close Browser

*** Variables ***
${NOM_COMPLETO}         RAMOS CASTRO NADIA
${CAL_ALGORITMOS_A1}    3.2
${CAL_ALGORITMOS_A2}    3.8
${CAL_FISICA_A1}        4.6
${CAL_FISICA_A2}        4.7
${CAL_LOGICA_A1}        3.9
${CAL_LOGICA_A2}        3.4
${CAL_MATEMATICAS_A1}   5.1
${CAL_MATEMATICAS_A2}   5.6
${CAL_ALGORITMOS_EA1}   3.3
${CAL_ALGORITMOS_EA2}   3.7
${CAL_FISICA_EA1}       4.8
${CAL_FISICA_EA2}       4.9
${CAL_LOGICA_EA1}       4.0
${CAL_LOGICA_EA2}       3.8
${CAL_MATEMATICAS_EA1}  5.3
${CAL_MATEMATICAS_EA2}  4.6
${CONTRASEÑA}          default_admin_pass
${DELAY}               1
${NAVEGADOR}           Chrome
${PROMEDIO}            5.1
${TITLE}               NES Escolares | Inicio de Sesión
${URL}                 http://192.168.13.128:3001/user_sessions/new
#${URL}                 https://pruebas-nes.kadasoftware.com/user_sessions/new
${USUARIO}             default_admin
*** Test Cases ***
Iniciar Sesion
    Login
Configurar Calificaciones Curso Propedeutico
    Ir a Propedeutico en Ventanilla
    Ir a Registrar Calificaciones
    Seleccionar Carrera Grupo
    Clic en Buscar
    Registrar Calificaciones Alumno1
    Registrar Calificaciones Alumno2
    Clic en Guardar
    Clic en Regresar
    Ir a Mostrar Calificaciones
    Ver Calificaciones
    Clic en Regresar Calificaciones
    Ir a Editar Calificaciones
    Editar Calificaciones Alumno1
    Editar Calificaciones Alumno2
    Clic en Guarda Editados
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
Ir a Registro de Calificaciones Propedeutico
    Mouse Over      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]
    Mouse Over      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]/ul/li[2]/a
    Click Link      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]/ul/li[2]/ul/li[8]/a
    Sleep   10s
Ir a Registrar Calificaciones
    Click Link    xpath://*[@id="all"]/section/article/div/table/tbody/tr[1]/td[4]/a
    Sleep   6s
    Page Should Contain    Registrar Calificaciones de Curso Propedeútico
    Page Should Contain Element    xpath://*[@id="find_aspirantes_new"]/table
Seleccionar Carrera Grupo
    Select From List by Value   id:carrera_id    2
    Select From List By Value   id:grupo_id    3
Clic en Buscar
    Click Element    name:commit
    Sleep   5s
    Page Should Contain Element    xpath://*[@id="alumnos_list"]/div/table
Registrar Calificaciones Alumno1
    ${element1}    Get WebElement    xpath:/html/body/div[2]/section/article/div/form[2]/div[2]/div/table/tbody/tr[1]/td[3]/input
    ${id1}    Get Element Attribute     ${element1}    id
    Input Text    id:${id1}    ${CAL_ALGORITMOS_A1}
    ${element2}    Get WebElement    xpath:/html/body/div[2]/section/article/div/form[2]/div[2]/div/table/tbody/tr[1]/td[4]/input
    ${id2}    Get Element Attribute     ${element2}    id
    Input Text    id:${id2}    ${CAL_FISICA_A1}
    ${element3}    Get WebElement    xpath:/html/body/div[2]/section/article/div/form[2]/div[2]/div/table/tbody/tr[1]/td[5]/input
    ${id3}    Get Element Attribute     ${element3}    id
    Input Text    id:${id3}    ${CAL_LOGICA_A1}
    ${element4}    Get WebElement    xpath:/html/body/div[2]/section/article/div/form[2]/div[2]/div/table/tbody/tr[1]/td[6]/input
    ${id4}    Get Element Attribute     ${element4}    id
    Input Text    id:${id4}    ${CAL_MATEMATICAS_A1}
Registrar Calificaciones Alumno2
    ${element1}    Get WebElement    xpath:/html/body/div[2]/section/article/div/form[2]/div[2]/div/table/tbody/tr[2]/td[3]/input
    ${id1}    Get Element Attribute     ${element1}    id
    Input Text    id:${id1}    ${CAL_ALGORITMOS_A2}
    ${element2}    Get WebElement    xpath:/html/body/div[2]/section/article/div/form[2]/div[2]/div/table/tbody/tr[2]/td[4]/input
    ${id2}    Get Element Attribute     ${element2}    id
    Input Text    id:${id2}    ${CAL_FISICA_A2}
    ${element3}    Get WebElement    xpath:/html/body/div[2]/section/article/div/form[2]/div[2]/div/table/tbody/tr[2]/td[5]/input
    ${id3}    Get Element Attribute     ${element3}    id
    Input Text    id:${id3}    ${CAL_LOGICA_A2}
    ${element4}    Get WebElement    xpath:/html/body/div[2]/section/article/div/form[2]/div[2]/div/table/tbody/tr[2]/td[6]/input
    ${id4}    Get Element Attribute     ${element4}    id
    Input Text    id:${id4}    ${CAL_MATEMATICAS_A2}
Clic en Guardar
    Click Element    xpath:/html/body/div[2]/section/article/div/form[2]/div[2]/div/div/input
    Sleep   4s
    Page Should Contain    Se han guardado correctamente las calificaciones
Clic en Regresar
    Click Element    xpath:/html/body/div[2]/section/article/div/form[1]/div[2]/a
    Sleep   5s
    Location Should Be    http://192.168.13.128:3001/calificaciones_propedeuticos
Ir a Mostrar Calificaciones
    Click Element    xpath://*[@id="all"]/section/article/div/table/tbody/tr[1]/td[5]/a
    Sleep   5s
    Location Should Contain    http://192.168.13.128:3001/calificaciones_propedeuticos/mostrar?
    Page Should Contain    Mostrar Calificaciones de Curso Propedéutico
Ver Calificaciones
    Page Should Contain Element    xpath:/html/body/div[2]/section/article/div/div/div/table
    Should Not Be Empty            xpath:/html/body/div[2]/section/article/div/div/div/table
    Should Not Be Empty            xpath:/html/body/div[2]/section/article/div/div/div/table/tbody/tr[1]
Clic en Regresar Calificaciones
    Click Element    xpath:/html/body/div[2]/section/article/div/form/div[2]/a
    Sleep   5s
    Location Should Be    http://192.168.13.128:3001/calificaciones_propedeuticos
Ir a Editar Calificaciones
    Click Element    xpath://*[@id="all"]/section/article/div/table/tbody/tr[1]/td[6]/a
    Sleep   5s
    Location Should Contain    http://192.168.13.128:3001/calificaciones_propedeuticos/editar?
Editar Calificaciones Alumno1
    ${element1}    Get WebElement    xpath:/html/body/div[2]/section/article/div/form[2]/div[2]/div/table/tbody/tr[1]/td[3]/input
    ${id1}    Get Element Attribute     ${element1}    id
    Input Text    id:${id1}    ${CAL_ALGORITMOS_EA1}
    ${element2}    Get WebElement    xpath:/html/body/div[2]/section/article/div/form[2]/div[2]/div/table/tbody/tr[1]/td[4]/input
    ${id2}    Get Element Attribute     ${element2}    id
    Input Text    id:${id2}    ${CAL_FISICA_EA1}
    ${element3}    Get WebElement    xpath:/html/body/div[2]/section/article/div/form[2]/div[2]/div/table/tbody/tr[1]/td[5]/input
    ${id3}    Get Element Attribute     ${element3}    id
    Input Text    id:${id3}    ${CAL_LOGICA_EA1}
    ${element4}    Get WebElement    xpath:/html/body/div[2]/section/article/div/form[2]/div[2]/div/table/tbody/tr[1]/td[6]/input
    ${id4}    Get Element Attribute     ${element4}    id
    Input Text    id:${id4}    ${CAL_MATEMATICAS_EA1}
Editar Calificaciones Alumno2
    ${element1}    Get WebElement    xpath:/html/body/div[2]/section/article/div/form[2]/div[2]/div/table/tbody/tr[2]/td[3]/input
    ${id1}    Get Element Attribute     ${element1}    id
    Input Text    id:${id1}    ${CAL_ALGORITMOS_EA2}
    ${element2}    Get WebElement    xpath:/html/body/div[2]/section/article/div/form[2]/div[2]/div/table/tbody/tr[2]/td[4]/input
    ${id2}    Get Element Attribute     ${element2}    id
    Input Text    id:${id2}    ${CAL_FISICA_EA2}
    ${element3}    Get WebElement    xpath:/html/body/div[2]/section/article/div/form[2]/div[2]/div/table/tbody/tr[2]/td[5]/input
    ${id3}    Get Element Attribute     ${element3}    id
    Input Text    id:${id3}    ${CAL_LOGICA_EA2}
    ${element4}    Get WebElement    xpath:/html/body/div[2]/section/article/div/form[2]/div[2]/div/table/tbody/tr[2]/td[6]/input
    ${id4}    Get Element Attribute     ${element4}    id
    Input Text    id:${id4}    ${CAL_MATEMATICAS_EA2}
Clic en Guarda Editados
    Click Element    xpath:/html/body/div[2]/section/article/div/form[2]/div[2]/div/div/input
    Sleep   4s
    Page Should Contain    Se han guardado correctamente las calificaciones
