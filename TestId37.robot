*** Settings ***
Documentation    Caso de prueba para NES Escolares: Inscribir Aspirante a Primer Semestre (Inscripiones en Línea)
Library          SeleniumLibrary
Suite setup      Abrir NES Escolares En El Navegador
Suite Teardown   Close Browser

*** Variables ***
${CARRERA}         INGENIERÍA EN COMPUTACIÓN
${CONTRASEÑA}      default_admin_pass
${DELAY}           1
${GRUPO}           PCIC-002
${NAVEGADOR}       Chrome
${NOM_ALUMNO}      EDUARDO RAMÍREZ MÁRQUEZ
${TIPO_PROPE}      CORTO
${TITLE}           NES Escolares | Inicio de Sesión
${URL}             http://192.168.13.128:3001/user_sessions/new
#${URL}             https://pruebas-nes.kadasoftware.com/user_sessions/new
${USUARIO}         default_admin
*** Test Cases ***
Iniciar Sesion
    Login
Inscribir Aspirante a Primer Semestre en Linea
    Ir a Inscripciones en Linea
    Seleccionar Carrera Inscripcion
    Clic en Buscar
    Seleccionar Estudiante Inscripcion
    Seleccionar Grupo Inscripcion
    Clic en Inscribir a Primer Semestre
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
Ir a Inscripciones en Linea
    Mouse Over      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]
    Mouse Over      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]/ul/li[3]/a
    Click Link      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]/ul/li[3]/ul/li/a
    Sleep   6s
Seleccionar Carrera Inscripcion
    Sleep   2s
    Select From List By Label    id:carrera_id    ${CARRERA}
Clic En Buscar
    Click Element     name:commit
    Sleep   3s
    Page Should Contain Element    xpath://*[@id="inscripcion_list_div"]/div[1]/table
Seleccionar Estudiante Inscripcion
    ${cantidad}    Get Element Count    xpath://*[@id="inscripcion_list_div"]/div[1]/table/tbody/tr
    FOR    ${i}    IN RANGE    1    ${cantidad}+1
        ${celda}    Get Text    //*[@id="inscripcion_list_div"]/div[1]/table/tbody/tr[${i}]/td[3]
        IF    "${celda}" == "${NOM_ALUMNO}"
            Log to Console    ${celda}
            ${registro}    Get WebElement    xpath:/html/body/div[2]/section/article/form[2]/div[2]/div[1]/table/tbody/tr[${i}]/td[1]/input
        END
    END
    ${locator}    Get Element Attribute     ${registro}    name
    Select Checkbox    ${locator}
Seleccionar Grupo Inscripcion
    Select From List By Value    id:grupo_nombre    102-A
Clic en Inscribir a Primer Semestre
    Click Element    xpath:/html/body/div[2]/section/article/form[2]/div[2]/div[2]/div/input
    Sleep   4s
    Location Should Contain     http://192.168.13.128:3001/inscripciones_linea/inscripcion_guardada