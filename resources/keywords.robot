*** Settings ***
Library    SeleniumLibrary
Resource   ./variables.robot

*** Keywords ***
Open My Browser
    Open Browser    ${URL}    chrome

Close My Browser
    Capture Page Screenshot
    Close Browserx

Log In With Email And Password
    Open My Browser
    [Arguments]   ${Email}    ${PW}
    Wait Until Element Is Visible    ${My_Account}
    Click Element  ${My_Account}  
    Click Link    ${Login}
    Wait Until Page Contains    Returning Customer
    Input Text    ${Mail}    ${Email}
    Input Password    ${Password}    ${PW}
    Click Button    ${Button_Login}

Verify Valid Log In
    Wait Until Page Contains    Logout
    Click Link    ${Logout}
    Close Browser

Verify Invalid Log In
    Page Should Contain  Warning: No match for E-Mail Address and/or Password.
    Close Browser

