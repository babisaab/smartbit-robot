*** Settings ***
Documentation        Ações e elementos da página de Matrículas

Library    Browser
Resource    components/toast.resource

*** Keywords ***
Create new membership
    [Arguments]    ${data}

    Go to enroll form
    Select account        ${data}[account][name]    ${data}[account][cpf]
    Select plan           ${data}[plan][name]
    Input payment data    ${data}[credit_card]

    Click    css=button[type=submit] >> text=Cadastrar
Go to enroll form

    Click    css=a[href="/memberships/new"]

    Wait For Elements State    css=h1 >> text=Nova matrícula
    ...    visible    5

Select account
    [Arguments]    ${name}    ${cpf}

    Fill Text    css=input[aria-label=select_account]    ${name}
    Click        css=[data-testid="${cpf}"]

Select plan
    [Arguments]    ${plan_name}

    Fill Text    input[aria-label=select_plan]    ${plan_name}
    Click        css=div[id*=option] >> text=${plan_name}

Input payment data
    [Arguments]    ${credit_card}

    Fill Text    css=input[name=card_number]    ${credit_card}[card_number]
    Fill Text    css=input[name=card_holder]    ${credit_card}[card_holder]
    Fill Text    css=input[name=card_month]     ${credit_card}[card_month]
    Fill Text    css=input[name=card_year]      ${credit_card}[card_year]
    Fill Text    css=input[name=card_cvv]       ${credit_card}[card_cvv]

# Confirm enroll
#     Click    css=button[type=submit] >> text=Cadastrar
#     Toast should be    Matrícula cadastrada com sucesso.

Search by name
    [Arguments]    ${name}

    Fill Text    css=input[placeholder^=Busque]    ${name}
    Wait For Elements State    css=strong >> text=Total: 1
    ...    visible    5

Should filter by name
    [Arguments]    ${name}
    
    Wait For Elements State    css=table tbody tr >> text=${name}
    ...    visible    5

Request delete
    Click                    css=button[class="sc-fMiknA ewJUdq"]
