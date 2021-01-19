*** Settings ***
Documentation    this suite verifies simulation page.

Library     SeleniumLibrary

Resource    ../pages/templateButtonPage.robot
Resource    ../common/navigateSidebar.robot


*** Variables ***
${rule}     fixedAsset

*** Test Cases ***
Click on Simulation Button Template
    run keyword and continue on failure    Click on Simulation Button Template

click Yes for simulation template
    click Yes for simulation template
    ${count}=       GET ELEMENT COUNT        xpath=//li[@id="prebudget"]//span
    RUN KEYWORD IF      ${count} > 0        Click rules simulation    ${rule}


Click on Activity Monitoring
    run keyword and continue on failure    Click on Activity Monitoring
click to Execution log
    run keyword and continue on failure    Execution log
Approve click simulation
    run keyword and continue on failure    Approve click simulation

#click on Ok button to approve simualtion
#    run keyword and continue on failure    Ok button to approve simualtion

Click on Cancel approve simulation
    run keyword and continue on failure    Cancel approve simulation

Download prebudget result
    run keyword and continue on failure    Download prebudget result

Click on Activity Monitoring
    run keyword and continue on failure    Click on Activity Monitoring
Template log
    run keyword and continue on failure    Template log