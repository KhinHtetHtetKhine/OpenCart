*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource   ./variables.robot

*** Keywords ***
Open My Browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --user-data-dir=${USER_DATA_DIR}
    Create WebDriver    Chrome    options=${options}
    #Go To    ${URL}
    #Open Browser    https://your-login-url    Chrome
    Open Browser    ${URL}    chrome

Close My Browser
    Capture Page Screenshot
    Close Browser

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

