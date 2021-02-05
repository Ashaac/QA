*** Settings ***
Library    SeleniumLibrary

Resource    ../common/navigateSidebar.robot
Resource    ../pages/templateButtonPage.robot

*** Test Cases ***

Click quarterlyReports Section
    run keyword and continue on failure     toggle quarterlyReports

Click Balance sheet quarterlyReports
    run keyword and continue on failure     Balance sheet quarterlyReports
    run keyword and continue on failure     toggle quarterlyReports

#PL quarterlyReports
#    run keyword and continue on failure    PL quarterlyReports
#
#click Capex quarterlyReports
#    run keyword and continue on failure    Capex quarterlyReports
#
#click HR quarterlyReports
#    run keyword and continue on failure    HR quarterlyReports

#click Activity Based quarterlyReports
#    run keyword and continue on failure    Activity Based quarterlyReports

