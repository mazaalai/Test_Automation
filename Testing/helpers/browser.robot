*** Settings ***
Library  SeleniumLibrary
Resource  ../webconfig.robot

*** Keywords ***
Open My Website
    [Arguments]  ${url}=${BASE_URL}  ${browser}=${BROWSER}
    Open Browser  ${url}  ${browser}