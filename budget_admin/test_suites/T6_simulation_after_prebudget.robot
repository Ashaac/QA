*** Settings ***
Documentation    this suite verifies simulation page.

Library     SeleniumLibrary

Resource    ../pages/templateButtonPage.robot
Resource    ../common/navigateSidebar.robot


*** Variables ***
${rule}     fixedAsset

*** Test Cases ***
Click on Simulation Button Template
    Click on Simulation Button Template

click Yes for simulation template
    click Yes for simulation template
    ${count}=       GET ELEMENT COUNT        xpath=//li[@id="prebudget"]//span
    RUN KEYWORD IF      ${count} > 0        Click rules simulation    ${rule}


Click on Activity Monitoring
    Click on Activity Monitoring
click to Execution log
    Execution log
Approve click simulation
    Approve click simulation

#click on Ok button to approve simualtion
#    Ok button to approve simualtion

Click on Cancel approve simulation
    Cancel approve simulation

Download prebudget result
    Download prebudget result

Click on Activity Monitoring
    Click on Activity Monitoring
Template log
    Template log