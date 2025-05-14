*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Resource    ../resources/base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve iniciar o cadastro do cliente
    [Tags]    smoke

    ${account}    Create Dictionary
    ...        name=babi maria
    ...        email=teste.robot33@gmail.com 
    ...        cpf=547.146.580-69

    Delete Account By Email    ${account}[email]

    Submit signup form    ${account}
    Verify welcome message

Pré-cadastro com dados inválidos
    [Template]    Attempt signup
    ${EMPTY}      teste.robot05@gmail.com    564.814.420-28    Por favor informe o seu nome completo
    babi maria    ${EMPTY}                   564.814.420-28    Por favor, informe o seu melhor e-mail
    babi maria    teste.robot07@gmail.com    ${EMPTY}          Por favor, informe o seu CPF
    babi maria    teste.robot07#gmail.com    662.174.180-45    Oops! O email informado é inválido
    babi maria    teste.robot07@gmail.com    000.000.000-00    Oops! O CPF informado é inválido

*** Keywords ***
Attempt signup
    [Arguments]    ${name}    ${email}    ${cpf}    ${output_message}

    ${account}        Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    cpf=${cpf}

    Submit signup form    ${account}
    Notice should be    ${output_message}
