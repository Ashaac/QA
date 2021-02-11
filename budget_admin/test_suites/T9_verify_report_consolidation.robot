*** Settings ***
Documentation    This suite verifies Template page
Library    SeleniumLibrary

Resource    ../common/navigateSidebar.robot
Resource    ../pages/templateButtonPage.robot
Resource    ../common/navigateSidebar.robot
Resource    ../pages/loginPage.robot

*** Test Cases ***
Click Reports
    run keyword and continue on failure    toggle Reports
Click Balance sheet Reports
    run keyword and continue on failure     Balance sheet Reports
Click Dropdown Reports and download
    run keyword and continue on failure    Click Dropdown Reports
    run keyword and continue on failure    Click download Reports
Click Refresh Report
    run keyword and continue on failure    Refresh Reports
Close Reports
    run keyword and continue on failure    toggle Reports


click logout
    run keyword and continue on failure    Click Logout

#Click PL Reports Download and refresh
#    run keyword and continue on failure    PL Reports
#Capex Reports Download and refresh
#    run keyword and continue on failure    Capex Reports
#Hr Reports Download and refresh
#    run keyword and continue on failure    Hr Reports
#Activity Based Reports Download and refresh
#    run keyword and continue on failure    Activity Based Reports
#Adhoc Reports Download and refresh
#    run keyword and continue on failure    Adhoc Reports