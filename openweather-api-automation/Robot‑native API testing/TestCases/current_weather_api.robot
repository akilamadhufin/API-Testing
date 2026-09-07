*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://api.openweathermap.org/data/2.5
${API_KEY}     ${ENV:OPENWEATHER_API_KEY}

*** Test Cases ***
Valid City Returns 200 And Has Name
    [Documentation]    Verify that a valid city returns a 200 status code
    [Tags]    smoke    API
    Create Session    weather    ${BASE_URL}
    ${resp}=    GET    weather    /weather?q=Tampere&appid=${API_KEY}&units=metric&lang=en

    Should Be Equal As Integers    ${resp.status_code}    200

    ${json}=    To Json    ${resp.content}
    Dictionary Should Contain Key    ${json}    name
    Should Be Equal    ${json["name"]}    Tampere     
