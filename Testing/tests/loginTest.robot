*** Settings ***
Resource            ../pageObjects/loginPage.robot

Suite Setup  Open My Website
Suite Teardown  Close browser

*** Variables ***
${users}=  Get Text  xpath://a[normalize-space()='Gebruikers']
${logout}=  xpath://a[normalize-space()='Log uit']
*** Test Cases ***

Login with wrong password
    Fill in login username  admin
    Fill in login password  incorrectPassword
    ${error}=  Login and get error code
    Should Contain  ${error}  Inloggen mislukt: controleer of je gebruikersnaam en wachtwoord juist zijn.

Login with wrong username
    Fill in login username  tom
    Fill in login password  admin
    ${error}=  Login and get error code
    Should Contain  ${error}  Inloggen mislukt: controleer of je gebruikersnaam en wachtwoord juist zijn.


Login with correct credentials
    Fill in login username  admin
    Fill in login password  admin
    Should contain  ${users}  Gebruikers

Logout and error
    Fill in login username  admin
    Fill in login password  admin
    Click Element  css:.navbar-toggler-icon
    Click Element  css:.navbar_navbuttons_btn_logout
    Click Element  ${logout}
    Click Button  css:input[value='log uit']
    Location Should Be  https://hummingbee.herokuapp.com/