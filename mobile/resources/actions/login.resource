*** Settings ***
Documentation        Ações e elementos da tela login

Library        AppiumLibrary

*** Keywords ***
Signin with Document
    [Arguments]        ${cpf}

    Input Text        xpath=//android.widget.EditText[@resource-id="ipAddress"]    
    ...    192.168.100.228

    Input Text        xpath=//android.widget.EditText[@resource-id="cpf"]          
    ...    ${cpf}

    Click Element     xpath=//android.view.ViewGroup[@resource-id="btnLogin"]