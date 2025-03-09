*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords.robot
Library    DataDriver    ../testdata/register.csv

Suite Setup    Open My Browser
Suite Teardown    Close My Browser
Test Template    Perform Register Test

*** Keywords ***

Perform Register Test
    [Arguments]    ${Scenario}    ${FirstName}    ${LastName}    ${Email}    ${Phone}    ${Password}    ${Expected}
    
    Register Account With Input Fields    ${FirstName}    ${LastName}    ${Email}    ${Phone}    ${Password}
    Run Keyword If  "${Scenario}"=="Valid"    Verify Register Page   ${Expected}

*** Test Cases ***
${No} ${Summary}

