*** Settings ***
Library    SeleniumLibrary
Resource   ./variables.robot

*** Keywords ***
Open My Browser
    Open Browser    ${URL}    chrome

Close My Browser
    Capture Page Screenshot
    Close Browser

Log In With Email And Password
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

Register Account With Input Fields
    [Arguments]    ${FirstName}    ${LastName}    ${Email}    ${Phone}    ${Password}
    Click Element  ${My_Account}
    Click Link    ${Register}
    Input Text      //*[@id="input-firstname"]   ${FirstName}
    Input Text      //*[@id="input-lastname"]    ${LastName}
    Input Text      //*[@id="input-email"]       ${Email}
    Input Text      //*[@id="input-password"]    ${Password}
    Input Text      //*[@id="input-confirm"]     ${Password}
    Click Button    //*[@id="content"]/form/div/div/input[2]

Verify Register Page   
    [Arguments]    ${Expected}
    Page Should Contain    ${Expected}