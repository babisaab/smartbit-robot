*** Settings ***
Documentation        Suite de testes da feature de cadastro de medidas no app

Resource        ../resources/Base.resource

Test Setup        Start session
Test Teardown     Finish session

*** Test Cases ***
Deve poder cadastrar minhas medidas

    ${data}    Get Json fixture    update
    Insert Membership    ${data}

    Signin with Document    ${data}[account][cpf]
    User is logged in
    Touch my body

    Send my measurements    ${data}[account]
    Popup have Text         Seu cadastro foi atualizado com sucesso

    Set user token
    ${account}    Get account by name    ${data}[account][name]

    Should Be Equal    ${account}[weight]    ${data}[account][weight]
    Should Be Equal    ${account}[height]    ${data}[account][height]

