*** Settings ***
Library    SeleniumLibrary

Resource    ../common/navigateSidebar.robot
Resource    ../pages/templateButtonPage.robot

*** Test Cases ***

Click specialReports Section
    run keyword and continue on failure     toggle specialReports

Click Balance sheet specialReports
    run keyword and continue on failure     Balance sheet specialReports
    run keyword and continue on failure     toggle specialReports

#PL specialReports
#    run keyword and continue on failure    PL specialReports
#
#click Capex specialReports
#    run keyword and continue on failure    Capex specialReports
#
#click HR specialReports
#    run keyword and continue on failure    Hr specialReports
#
#
#click Activity based specialReports
#    run keyword and continue on failure    Activity based specialReports