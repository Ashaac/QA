*** Settings ***
Documentation    this suite verifies admin pge.
Library     SeleniumLibrary
Library     String
Resource    ../pages/loginPage.robot



Suite Setup    Open Budget Application
#Suite Teardown  close all browsers


*** Test Cases ***
Verify that login page works properly and is authenticated
    Verify Login Page is successful
#    run keyword and continue on failure    Verify Invalid Login

