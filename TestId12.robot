*** Settings ***
Documentation    Caso de prueba para NES Escolares: Registro de Ficha en Ventanilla
Library          SeleniumLibrary
Suite setup      Abrir NES Escolares En El Navegador
Suite Teardown   Close Browser

*** Variables ***
${ALERGIA}       NINGUNA
${APELLIDO_P}    RAMOS
${APELLIDO_M}    CASTRO
${APELLIDO_M_P}  CASTILLO
${APELLIDO_M_M}  RAMÍREZ
${AÑO_INICIO}    2016
${AÑO_FIN}       2019
${ASPIRANTE}     NADIA
${ASPIRANTE_FULL}  NADIA RAMOS CASTRO
${CALLE}         ZARAGOZA
${CODIGO_P}      69171
${COLONIA}       CENTRO
${CONTRASEÑA}    default_admin_pass
${CORREO}        ramos.98@gmail.com
${CURP}          RACN990618MOCMSD00
${DELAY}         1
${ENFERMEDAD}    NINGUNA
${ESCUELA}       BACHILLERATO INTEGRAL COMUNITARIO 31
${ESPECIALIDAD}  TIC'S
${MEDICAMENTO}   NINGUNO
${NAVEGADOR}     Chrome
${NOMBRE_PADRE}  JUAN
${NOMBRE_MADRE}  ANA
${NUM_CALLE}     6
${NUM_SEGURO}    34568231447
${OCUPACION_M}   AMA DE CASA
${OCUPACION_P}   CAMPESINO
${PROMEDIO}      8.7
${TELEFONO}      9535202178
${TITLE}         NES Escolares | Inicio de Sesión
${URL}           http://192.168.13.128:3001/user_sessions/new
#${URL}           https://pruebas-nes.kadasoftware.com/user_sessions/new
${USUARIO}       default_admin

*** Test Cases ***
Iniciar Sesion
    Login
Registro de Ficha en Ventanilla
    Ir a Registro en Ventanilla
    Ir a Nuevo Registro
    Agregar Nuevo Aspirante
    Agregar Nuevo Aspirante Datos Personales
    Agregar Nuevo Aspirante Datos Domicilio
    Agregar Nuevo Aspirante Datos Lenguas Indigenas
    Agregar Nuevo Aspirante Datos Academicos Procedencia
    Agregar Nuevo Aspirante Datos Tutores
    Click en Guardar Aspirante
    Inscripcion a Fichas Nombre Aspirante
    Inscripcion a Fichas Seleccionar Carrera
    Clic en Guardar Registro

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
Ir a Ficha en Ventanilla
    Go To      https://pruebas-nes.kadasoftware.com/windows_tokens
Ir a Registro en Ventanilla
    Mouse Over      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]
    Mouse Over      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]/ul/li[1]/a
    Click Link      xpath://*[@id="contentido_menu_buscador"]/nav/ul/li[1]/ul/li[1]/ul/li[4]/a
    Sleep   12s
Ir a Nuevo Registro
    Click Element   xpath://*[@id="configuraciones"]/tr[2]/td[7]
Agregar Nuevo Aspirante
    Click Link      xpath://*[@id="ficha_form"]/div[2]/table/tbody/tr[5]/td[2]/div/a
    Sleep   10s
Agregar Nuevo Aspirante Datos Personales
    ${window1}   Get Title
    Switch Window   NEW
    Input Text      id:aspirante_curp                ${CURP}
    Input Text      id:aspirante_nombre              ${ASPIRANTE}
    Input Text      id:aspirante_apellido_paterno    ${APELLIDO_P}
    Input Text      id:aspirante_apellido_materno    ${APELLIDO_M}
    Input Text      id:dato_personal_nss             ${NUM_SEGURO}
    Input Text      id:dato_personal_email           ${CORREO}
    Click Element   id:dato_personal_lugar_nacimiento
    Sleep   5s
    Select From List By Value   id:pais_id         118
    Sleep   3s
    Select From List By Value   id:estado_id       218
    Sleep   3s
    Select From List By Value   id:municipio_id    1491
    Sleep   3s
    Select From List By Value   id:localidad_id    179483
    Click Button    xpath:/html/body/div[4]/div[11]/div/button[1]
    Sleep   3s
    Select From List By Value   id:dato_personal_estado_civil     4
    Select From List By Value   id:dato_medico_tipo_sangre_id    8
    Input Text      id:dato_medico_enfermedad_atencion_especial                ${ENFERMEDAD}
    Input Text      id:dato_medico_alergia                                     ${ALERGIA}
    Input Text      id:dato_medico_medicamento_enfermedad_atencion_especial    ${MEDICAMENTO}
Agregar Nuevo Aspirante Datos Domicilio
    Click Link      xpath://*[@id="tabs"]/ul/li[2]/a
    Input Text      id:direccion_calle            ${CALLE}
    Input Text      id:direccion_numero           ${NUM_CALLE}
    Input Text      id:direccion_colonia          ${COLONIA}
    Input Text      id:direccion_codigo_postal    ${CODIGO_P}
    Input Text      id:dato_personal_telefono     ${TELEFONO}
    Click Element   id:direccion_lugar_id
    Sleep   3s
    Select From List By Value   id:pais_id         118
    Sleep   2s
    Select From List By Value   id:estado_id       218
    Sleep   2s
    Select From List By Value   id:municipio_id    1491
    Sleep   3s
    Select From List By Value   id:localidad_id    179483
    Click Button    xpath:/html/body/div[4]/div[11]/div/button[1]
Agregar Nuevo Aspirante Datos Lenguas Indigenas
    Click Link    xpath://*[@id="tabs"]/ul/li[3]/a
    Select Checkbox    xpath://*[@id="datos_lenguas_lengua_indigena_"]
Agregar Nuevo Aspirante Datos Academicos Procedencia
    Click Link    xpath://*[@id="tabs"]/ul/li[4]/a
    Input Text    id:antecedente_academico_escuela_procedente_nombre          ${ESCUELA}
    Press Keys    id:antecedente_academico_escuela_procedente_nombre   ARROW_DOWN    RETURN
    #Press Keys    id:antecedente_academico_escuela_procedente_nombre   RETURN
    Input Text    id:antecedente_academico_escuela_procedente_fecha_inicio    ${AÑO_INICIO}
    Input Text    id:antecedente_academico_escuela_procedente_fecha_fin       ${AÑO_FIN}
    Input Text    id:antecedente_academico_escuela_procedente_especialidad    ${ESPECIALIDAD}
    Sleep   3s
    Select From List By Value    id:antecedente_academico_escuela_procedente_area_conocimiento_id    11
    Input Text    id:antecedente_academico_escuela_procedente_promedio        ${PROMEDIO}
Agregar Nuevo Aspirante Datos Tutores
    Click Link    xpath://*[@id="tabs"]/ul/li[5]/a
    Select Checkbox    id:TutorDesconocido
    Select Checkbox    id:familiar_tutor_padre
    Input Text    id:familiar_padre_nombre                     ${NOMBRE_PADRE}
    Input Text    id:familiar_padre_apellido_paterno           ${APELLIDO_P}
    Input Text    id:familiar_padre_apellido_materno           ${APELLIDO_M_P}
    #Select From List By Value   id:familiar_padre_parentesco    PADRE
    Input Text    id:familiar_padre_ocupacion                  ${OCUPACION_P}
    Input Text    id:familiar_padre_direccion_calle            ${CALLE}
    Input Text    id:familiar_padre_direccion_numero           ${NUM_CALLE}
    Input Text    id:familiar_padre_direccion_colonia          ${COLONIA}
    Input Text    id:familiar_padre_direccion_codigo_postal    ${CODIGO_P}
    Input Text    id:familiar_padre_telefono                   ${TELEFONO}
    Click Element   id:familiar_padre_direccion_lugar_id
    Sleep   5s
    Select From List By Value   id:pais_id         118
    Sleep   3s
    Select From List By Value   id:estado_id       218
    Sleep   2s
    Select From List By Value   id:municipio_id    1491
    Sleep   2s
    Select From List By Value   id:localidad_id    179483
    Click Button    xpath:/html/body/div[4]/div[11]/div/button[1]
    Input Text    id:familiar_madre_nombre                     ${NOMBRE_MADRE}
    Input Text    id:familiar_madre_apellido_paterno           ${APELLIDO_M}
    Input Text    id:familiar_madre_apellido_materno           ${APELLIDO_M_M}
    #Select From List By Value   id:familiar_padre_parentesco    PADRE
    Input Text    id:familiar_madre_ocupacion                  ${OCUPACION_M}
    Input Text    id:familiar_madre_direccion_calle            ${CALLE}
    Input Text    id:familiar_madre_direccion_numero           ${NUM_CALLE}
    Input Text    id:familiar_madre_direccion_colonia          ${COLONIA}
    Input Text    id:familiar_madre_direccion_codigo_postal    ${CODIGO_P}
    Input Text    id:familiar_madre_telefono                   ${TELEFONO}
    Click Element   id:familiar_madre_direccion_lugar_id
    Click Button    xpath:/html/body/div[4]/div[11]/div/button[1]
    Select Radio Button   aspirante[estudio]    false
    #Select Radio Button    id:aspirante_estudio_true     true
Click en Guardar Aspirante
    Click Element    name:commit
    Alert Should Be Present    Esta seguro que desea guardar los datos?    ACCEPT
    Click Element   xpath://*[@id="content"]/center/form/center/div/a
    Switch Window   NES ESCOLARES
Inscripcion a Fichas Nombre Aspirante
    Input Text      id:aspirante_nombre    ${CURP}
    Press Keys      id:aspirante_nombre   ARROW_DOWN    RETURN
    #Press Keys      id:aspirante_nombre     RETURN
Inscripcion a Fichas Seleccionar Carrera
    Sleep   4s
    Select From List By Value    id:token_carrera_id    2
Clic en Guardar Registro
    Click Element    xpath://*[@id="ficha_form"]/div[3]/input
    Sleep   3s
    Location Should Contain    http://192.168.13.128:3001/windows_tokens
    #Location Should Contain    https://pruebas-nes.kadasoftware.com/windows_tokens