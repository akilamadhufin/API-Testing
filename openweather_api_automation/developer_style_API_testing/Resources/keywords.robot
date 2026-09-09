*** Settings ***
Library           ../python/api_client.py
Library           ../python/schema_validator.py 

*** Keywords ***
Get Current Weather Response For City
    [Arguments]    ${city}    ${units}=metric    ${lang}=en
    ${resp}=    Get Current Weather By City   ${city}    ${units}    ${lang}
    RETURN    ${resp}

Validate Current Weather JSON Against Schema
    [Arguments]    ${json}    ${schema_path}
    Validate Json Schema    ${json}    ${schema_path}
