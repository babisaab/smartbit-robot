*** Settings ***
Documentation        Ações e elementos da tela Meu corpo

Library    AppiumLibrary

*** Keywords ***
Send my measurements
    [Arguments]    ${account}

    Wait Until Page Contains    Registre ou atualize suas medidas    5

    Input Text    xpath=//android.widget.EditText[@resource-id="weight"]    ${account}[weight]
    Input Text    xpath=//android.widget.EditText[@resource-id="height"]    ${account}[height]

    Click Element    xpath=//android.widget.TextView[@text="Enviar minhas medidas"]