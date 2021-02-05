*** Settings ***
Library    SeleniumLibrary

Resource    ../common/navigateSidebar.robot
Resource    ../pages/templateButtonPage.robot
Resource    ../common/navigateSidebar.robot
Resource    ../pages/loginPage.robot

*** Test Cases ***

Click template Consolidation
    run keyword and continue on failure     Click template Consolidation

Balance sheet Template Consolidation
    run keyword and continue on failure     Balance sheet Template Consolidation

Click Download template Consolidation
    run keyword and continue on failure    Download template Consolidation

Click refresh template Consolidation
    run keyword and continue on failure    Click refresh template Consolidation
    run keyword and continue on failure    Click template Consolidation

click logout
    run keyword and continue on failure    Click Logout

#
#Click Hr template Consolidation
#    run keyword and continue on failure    Hr template Consolidation
#
#Click Activity Based template Consolidation
#    run keyword and continue on failure    Activity Based template Consolidation
#
#Click Adhoc template Consolidation
#    run keyword and continue on failure    Adhoc template Consolidation
#
#
