*** Settings ***
Documentation    Arquivo principal do projeto robot2

Library     Browser
Library     ../../libs/Account.py
Library     ../../libs/Database.py
Library     JSONLibrary

Variables    Env.py

Resource    pages/Landing.resource
Resource    pages/Welcome.resource
Resource    pages/Login.resource
Resource    pages/Client.resource
Resource    pages/Memberships.resource

Resource    pages/components/toast.resource
Resource    pages/components/Notice.resource
Resource    pages/components/Navbar.resource
Resource    pages/components/Modal.resource

*** Variables ***
${ADMIN_EMAIL}    sac@smartbit.com
${ADMIM_PASS}     pwd123

*** Keywords ***
Start session
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Page       ${BASE_URL}

#Helpers
Get Json fixture
    [Arguments]    ${file_name}    ${scenario}

    ${data}    Load Json From File    
    ...    ${EXECDIR}/resources/fixtures/${file_name}.json
    ...    encoding=utf-8

    [Return]    ${data}[${scenario}]

Signin admim
    Go to login page
    Submit login form    ${ADMIN_EMAIL}    ${ADMIM_PASS}
    User is logged in    ${ADMIN_EMAIL}