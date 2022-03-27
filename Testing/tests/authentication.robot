*** Settings ***
Resource            ../pageObjects/basePage.robot
Resource            ../pageObjects/accountPopup.robot

Suite Setup  Open My Website and go to Account
Suite Teardown  Close browser

*** Variables ***

${message}     xpath=(//button[@type='button'])[2]

*** Test Cases ***

Login without email
    Fill in login password  somepassword
    Wait Until Element Is Visible  ${message}

Login with existing account
    Fill in login username  vera
    Fill in login password  vera
    Wait Until Element Is Visible  ${message}

Login without password
    Fill in login username  dfklfdklfdklvmnb

