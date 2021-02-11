*** Settings ***
Documentation    This suite verifies admin login page
Library     SeleniumLibrary
Library     String
Resource    ../pages/loginPage.robot

Library     RequestsLibrary
Library     SeleniumLibrary
Library      BuiltIn
Library      String
Library      OperatingSystem

#Resource    ../pages/templateButtonPage.robot

Suite Setup    Open Budget Application

#Suite Teardown  Click Logout



*** Test Cases ***
Verify that login page works properly and is authenticated
#    run keyword and continue on failure    Verify Invalid Login
    run keyword and continue on failure    Verify Login Page is successful

