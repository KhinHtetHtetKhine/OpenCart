*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource   ./variables.robot

*** Keywords ***
Open My Browser
    # Create ChromeOptions
    ${options}=    Create WebDriver    ChromeOptions
    # Add user-data-dir argument
    Call Method    ${options}    add_argument    --user-data-dir=${USER_DATA_DIR}
    # Start the browser with the defined options
    Create WebDriver    Chrome    options=${options}

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

