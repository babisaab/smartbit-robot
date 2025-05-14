*** Settings ***
Documentation        Suite de testes de login

Resource        ../resources/Base.resource

Test Setup        Start session
Test Teardown     Finish session

*** Test Cases ***
Deve logar com IP e CPF

    ${data}    Get Json fixture    login
    Insert Membership    ${data}

    Signin with Document            ${data}[account][cpf]
    User is logged in

Não deve logar com cpf não cadastrado
    
    Signin with Document            15655605074
    Popup have Text                 Acesso não autorizado! Entre em contato com a central de atendimento

Não deve logar com cpf inválido
    
    Signin with Document            00000000000
    Popup have Text                 CPF inválido, tente novamente

Não deve logar sem cpf
    
    Signin with Document            ${EMPTY}
    Popup have Text                 Informe o número do seu CPF