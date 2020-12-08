*** Settings ***
Documentation    this suite verifies Capex page.
Library     SeleniumLibrary
Resource    ../pages/profitLossPrebudget.robot
Resource    ../pages/templateButtonPage.robot

Resource    ../common/navigateSidebar.robot

*** Variables ***
${rule}     fixedAsset

*** Test Cases ***

Verify Activity Prebudget

    Open Profit Loss Prebudget
    Download Worksheet Template
    Download Excel Template
    run keyword and continue on failure    Upload Worksheet  E://for_branch_999//pl.xlsx
    run keyword and continue on failure    Upload worksheet difference tab
    run keyword and continue on failure    Upload submit to database
    Refresh Button
    Monthly tab     2
    Yearly tab      2


    Simulation Button
    Yes simulation
    ${count}=       GET ELEMENT COUNT        xpath=//li[@id="prebudget"]//span
    RUN KEYWORD IF      ${count} > 0        Click rules simulation    ${rule}

    toggle Activity Monitoring
    Execution log
    Approve click simulation
    #Ok button to approve simualtion
    Cancel approve simulation
    Download prebudget result
    toggle Activity Monitoring
    Template log