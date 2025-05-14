*** Settings ***
Documentation        Ações e elemetos da página de Login

Library        Browser
Variables      ../Env.py

*** Keywords ***
Go to login page

    Go To    ${BASE_URL}/login

Submit login form
    [Arguments]    ${email}    ${password}

    Fill Text    id=email       ${email}
    Fill Text    id=password    ${password}

    Click    xpath=//button[text()="Entrar"]