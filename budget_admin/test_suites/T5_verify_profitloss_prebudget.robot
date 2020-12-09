*** Settings ***
Documentation    this suite verifies Capex page.
Library     SeleniumLibrary
Resource    ../pages/profitLossPrebudget.robot
Resource    ../pages/templateButtonPage.robot

#Resource    ../common/navigateSidebar.robot
Resource    ../common/commonKeywords.robot

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
    Verify that simulation button in template is working fine
    Verify that simulation done in activity log
