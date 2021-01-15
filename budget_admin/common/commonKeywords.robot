*** Settings ***
Documentation    this suite verifies simulation page.

Library     SeleniumLibrary

Resource    ../pages/templateButtonPage.robot
Resource    ../common/navigateSidebar.robot

*** Variables ***
${rule}     fixedAsset
*** Keywords ***
#
#Verify that simulation button in template is working fine
#    Click on Simulation Button Template
#    click Yes for simulation template
#    ${count}=       GET ELEMENT COUNT        xpath=//li[@id="prebudget"]//span
#    RUN KEYWORD IF      ${count} > 0        Click rules simulation    ${rule}
#
#
#Verify that simulation done in activity log
#    Click on Activity Monitoring
#    Execution log
#    Approve click simulation
#    #Ok button to approve simualtion
#    Cancel approve simulation
#    Download prebudget result
#    Click on Activity Monitoring
#    Template log

