*** Settings ***
Documentation    this suite verifies Capex page.
Library     SeleniumLibrary
Resource    ../pages/profitLossPrebudget.robot
Resource    ../pages/templateButtonPage.robot

#Resource    ../common/navigateSidebar.robot
Resource    ../common/commonKeywords.robot

*** Test Cases ***

Verify Activity Prebudget

    Verify that Profit Loss Prebudget Sidebar is clicked
    Verify Download Worksheet Template button is clicked and downloaded
    Verify that Download Excel Template button is clicked
    Verify that Upload Worksheet button is working     E://for_branch_999//pl.xlsx
    Click on Upload worksheet difference tab
    Click on Upload submit to database
    Verify that Refresh Button prebudget is clicked
    Click on Monthly tab    2
    Click on Yearly tab     2
# Simulation is done after prebudget exercise
    Verify that simulation button in template is working fine
    Verify that simulation done in activity log

