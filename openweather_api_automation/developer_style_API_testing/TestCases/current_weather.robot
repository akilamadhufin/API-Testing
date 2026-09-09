*** Settings ***
Resource          ../Resources/keywords.robot

*** Test Cases ***
Valid City Returns 200 And Has Name
    [Documentation]    Verify that a valid city returns a 200 status code
    [Tags]    smoke    API
    ${resp}=    Get Current Weather Response For City    Tampere
    Should Be Equal As Integers    ${resp.status_code}    200
    # ${json}=    Evaluate    ${resp.json()} # returns a dictionary, so evaluate is not needed
    ${json}=    Set Variable    ${resp.json()}
    Should Contain    ${json}    name
    Should Be Equal    ${json['name']}    Tampere

Validate Current Weather Response Matches Schema
    [Documentation]    Verify that a valid current-weather response matches the JSON Schema
    [Tags]    schema    API    smoke
    ${resp}=    Get Current Weather Response For City    Tampere
    Should Be Equal As Integers    ${resp.status_code}    200
    ${json}=    Set Variable    ${resp.json()}
    ${schema_path}=    Set Variable     ${EXECDIR}/schemas/current_weather_schema.json
    Validate Current Weather JSON Against Schema    ${json}    ${schema_path}        


