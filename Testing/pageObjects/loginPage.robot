*** Settings ***
Resource  ../helpers/browser.robot

*** Variables ***

${LOGIN_USER}=    css:#username
${LOGIN_PASS}=    css:#password
${LOGIN_BUTTON}=  css:input[value='log in']
${ERROR}=         css:.login_errormessage


*** Keywords ***
Fill in login username
    [Arguments]  ${login}
    Input Text  ${LOGIN_USER}  ${login}

Fill in login password
    [Arguments]  ${login}
    Input Text  ${LOGIN_PASS}  ${login}

Login
    Sleep  2s
    Click Button  ${LOGIN_BUTTON}

Get error text
    ${error}=  Get Text  ${ERROR}
    Log  ${error}
    [return]  ${error}

Login and get error code
    Login
    ${error}=  Get error text
    Log  ${error}
    [return]  ${error}