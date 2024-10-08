*** Settings ***
Library           RequestsLibrary


*** Variables ***
${BASE_URL}    http://localhost:5000

*** Keywords ***
Call API and Check Result
    [Arguments]    ${number}    ${expected_result}
    ${response}=    GET    ${BASE_URL}/is2honor/${number}

    Status Should Be    200

    ${result}=    Set Variable    ${response.json()["result"]}
    Should Be Equal  ${result}    ${expected_result}

*** Test Cases ***

Test when x is 3.7
    Call API and Check Result    3.7   ${False}

Test when x is 3.4
    Call API and Check Result    3.4   ${True}

Test when x is 3.1
    Call API and Check Result    3.1    ${False}
