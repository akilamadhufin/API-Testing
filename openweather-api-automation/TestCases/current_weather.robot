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

