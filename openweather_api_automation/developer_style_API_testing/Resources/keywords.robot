*** Settings ***
Library           ../python/api_client.py

*** Keywords ***
Get Current Weather Response For City
    [Arguments]    ${city}    ${units}=metric    ${lang}=en
    ${resp}=    Get Current Weather By City   ${city}    ${units}    ${lang}
    RETURN    ${resp}
