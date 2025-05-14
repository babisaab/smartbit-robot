*** Settings ***
Documentation        Teste de API 

Resource    ./Service.resource

*** Tasks ***
Teste de API
    Set user token
    Get account by name    Jorge Wesley