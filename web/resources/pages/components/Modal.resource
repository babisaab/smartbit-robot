*** Settings ***
Documentation        Ações e elementos da modal de exclusão

Library    Browser

Resource    toast.resource

*** Keywords ***
Confirm delete
    Click                    css=button >> text=Confirmar
    Toast should be          Matrícula removida com sucesso.