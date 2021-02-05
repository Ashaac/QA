*** Settings ***
Documentation    this suite verifies Capex page.

Library     SeleniumLibrary
Resource    ../common/navigateSidebar.robot
Resource    ../pages/templateButtonPage.robot
Resource    ../pages/adhocTemplateAssign.robot

*** Test Cases ***

Click on budget
    run keyword and continue on failure     Click Budget

#click to adhoc templates
#    run keyword and continue on failure     click to adhoc templates
#
#click on assign adhoc
#    run keyword and continue on failure     click on assign adhoc
#
#click assign adhoc region
#    run keyword and continue on failure    click assign adhoc region
#
#select region on adhoc
#    run keyword and continue on failure    select region on adhoc
#
#Select region 2
#    run keyword and continue on failure    Select region 2
#
#select branch on adhoc except one
#    run keyword and continue on failure    select branch on adhoc except one    Branch-033
#open calendar adhoc
#    run keyword and continue on failure    open calendar adhoc
#select from date
#    run keyword and continue on failure    select from date    2022    Jul   10
#select to date
#    run keyword and continue on failure    select to date    2022    Aug   10
#select adhoc category
#    run keyword and continue on failure    select adhoc category
#Click Adhoc save button
#    run keyword and continue on failure    Click Adhoc save button
#Click Assign Adhoc Cancel button
#    run keyword and continue on failure    Click Assign Adhoc Cancel button
#Click Close Adhoc button
#    run keyword and continue on failure    Click Close Adhoc button



#Click on assign Adhoc templates
#    run keyword and continue on failure     Click Budget


#Click Assign Adhoc Ok button
#    run keyword and continue on failure    Click Assign Adhoc Ok button

#Click Adhoc reset button
#    run keyword and continue on failure    Click Adhoc reset button
