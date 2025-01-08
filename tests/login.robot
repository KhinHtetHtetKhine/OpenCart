*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords.robot
Library    DataDriver    ../testdata/logindata.csv

Suite Setup    Open My Browser
Suite Teardown    Close My Browser
Test Template    Perform Login Test

*** Keywords ***
Perform Login Test
    [Arguments]    ${No}    ${Scenario}    ${Summary}    ${Email}    ${PW}
    Log    No: ${No}
    Log    Scenario: ${Scenario}
    Log    Summary: ${Summary}
    Log    Email: ${Email}
    Log    Password: ${PW}

    Log In With Email And Password   ${Email}    ${PW}
    Run Keyword If  "${Scenario}"=="Valid"    Verify Valid Log In
    ...  ELSE    Verify Invalid Log In

*** Test Cases ***
${No} ${Summary}