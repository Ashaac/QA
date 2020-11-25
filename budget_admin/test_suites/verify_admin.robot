*** Settings ***
Documentation    this suite verifies admin pge.
Library     SeleniumLibrary
Library     String
Resource    ../pages/loginPage.robot
Resource    ../pages/userManagementPage.robot
Resource    ../pages/capexPrebudget.robot

Suite Setup    Open Budget Application
#Suite Teardown  close all browsers

*** Variables ***
#${url}     https://10.13.189.56:8443/cas/login?service=https%3A%2F%2F10.13.189.56%3A8443%2Fbudget%2Flogin%2Fcas
${url}    https://10.13.189.8:8443/cas/login?service=https%3A%2F%2F10.13.189.8%3A8443%2Fbudget%2Flogin%2Fcas




*** Test Cases ***

Verify Login Page
#    run keyword and continue on failure    Verify Invalid Login
    Login user

#    Verify User Add
    Verify Capex Prebudget


*** Keywords ***
Open Budget Application
    open browser    ${url}    Chrome
    MAXIMIZE BROWSER WINDOW
    click button    details-button
    click element    proceed-link
    sleep    2S


