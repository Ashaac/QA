*** Settings ***
Documentation    this suite verifies admin pge.
Library     SeleniumLibrary
Library     String
Resource    ../pages/loginPage.robot


Resource    ../pages/capexPrebudget.robot
Resource    ../pages/templateButtonPage.robot
Resource    ../common/navigateSidebar.robot

Resource    ../api_keywords/commonApiKeywords.robot

Resource    ../pages/adhocTemplateAssign.robot

Library     RequestsLibrary
Library     SeleniumLibrary
Library      BuiltIn
Library      String
Library      OperatingSystem

Suite Setup    Open Budget Application
#Suite Teardown  close all browsers



*** Test Cases ***
Verify that login page works properly and is authenticated
    #run keyword and continue on failure    Verify Invalid Login
    Verify Login Page is successful
Click on assign Adhoc templates
    Click Budget
    click to adhoc templates
    click on assign adhoc
click assign adhoc region
    click assign adhoc region


#    Click on Prebudget menu
#    Click Capex Prebudget Sidebar

#Test api
#    Verify Login Page is successful
    #Compare capex Land data

