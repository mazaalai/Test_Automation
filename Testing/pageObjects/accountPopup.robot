*** Settings ***
Resource  ../helpers/browser.robot

*** Variables ***

${LOGIN_USER}=  css:#username
${LOGIN_PASS}=  css:#password


*** Keywords ***
Fill in login username
    [Arguments]  ${login}
    Input Text  ${LOGIN_USER}  ${login}

Fill in login password
    [Arguments]  ${login}
    Input Text  ${LOGIN_PASS}  ${login}

Login
    Click Button  xpath:/html[1]/body[1]/div[3]/div[1]/div[1]/form[1]/div[2]/button[2]

Clear fields
    Clear Element Text  ${LOGIN_USER}
    Clear Element Text  ${LOGIN_PASS}