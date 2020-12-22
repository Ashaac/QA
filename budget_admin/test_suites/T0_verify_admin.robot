*** Settings ***
Documentation    this suite verifies admin pge.
Library     SeleniumLibrary
Library     String
Resource    ../pages/loginPage.robot


Resource    ../pages/capexPrebudget.robot
Resource    ../pages/templateButtonPage.robot
Resource    ../common/navigateSidebar.robot

Resource    ../api_keywords/commonApiKeywords.robot

Library     RequestsLibrary
Library     SeleniumLibrary
Library      BuiltIn
Library      String
Library      OperatingSystem

Suite Setup    Open Budget Application
Suite Teardown  close all browsers



*** Test Cases ***
Verify that login page works properly and is authenticated
    run keyword and continue on failure    Verify Invalid Login
    Verify Login Page is successful
    Verify that Toggle Prebudget menu is clicked
    Verify that Capex Prebudget Sidebar is clicked

#Test api
#    Verify Login Page is successful
    Compare capex Land data

