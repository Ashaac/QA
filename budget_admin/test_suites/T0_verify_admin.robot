*** Settings ***
Documentation    this suite verifies admin pge.
Library     SeleniumLibrary
Library     String
Resource    ../pages/loginPage.robot


Resource    ../pages/capexPrebudget.robot
Resource    ../pages/templateButtonPage.robot
#Resource    ../common/navigateSidebar.robot

Resource    ../api_keywords/commonApiKeywords.robot

Resource    ../pages/adhocTemplateAssign.robot
Resource    ../pages/guidelines.robot

Library     RequestsLibrary
Library     SeleniumLibrary
Library      BuiltIn
Library      String
Library      OperatingSystem

Suite Setup    Open Budget Application

#Suite Teardown  Click Logout



*** Test Cases ***
Verify that login page works properly and is authenticated
#    run keyword and continue on failure    Verify Invalid Login
    run keyword and continue on failure    Verify Login Page is successful
    run keyword and continue on failure    Click Logout


#Test api
#    #Verify Login Page is successful
#    #Compare capex Land data
#    run keyword and continue on failure    Click on Prebudget menu
#    run keyword and continue on failure     Click Capex Prebudget Sidebar
#    Compare capex Land month1
#    Capex Land month2
