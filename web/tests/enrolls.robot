*** Settings ***
Documentation        Suite de testes de adesão de planos

Resource        ../resources/Base.resource
Resource    ../resources/pages/components/Modal.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve realizar uma nova adesão
    ${data}    Get Json fixture    memberships    create
    
    Delete Account By Email    ${data}[account][email]
    Insert Account             ${data}[account]

    Signin admim
    Go to enrolls
    Create new membership     ${data}
    Toast should be    Matrícula cadastrada com sucesso.

Não deve realizar matrícula duplicada
    [Tags]    dup
    ${data}    Get Json fixture    memberships    duplicate

    Insert Membership    ${data}
    
    Signin admim
    Go to enrolls
    #Create new membership     ${data}
    Sleep    8
    Create new membership     ${data}
    Toast should be    O usuário já possui matrícula.

Must search by name
    [Tags]    busca
    
    ${data}    Get Json fixture    memberships    search
    
    Insert Membership    ${data}

    Signin admim
    Go to enrolls
    Search by name           ${data}[account][name]
    Should filter by name    ${data}[account][name]

Must delet a enroll
    [Tags]    delete
    
    ${data}    Get Json fixture    memberships    delete
    
    Insert Membership    ${data}

    Signin admim
    Go to enrolls
    Search by name           ${data}[account][name]
    Request delete
    Confirm delete
    
    Sleep    5

    Wait For Elements State    css=table tbody tr >> text=Gina Wesley
    ...    detached    5