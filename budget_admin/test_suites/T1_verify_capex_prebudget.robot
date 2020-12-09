*** Settings ***
Documentation    this suite verifies Capex page.

Library     SeleniumLibrary
Resource    ../pages/capexPrebudget.robot
Resource    ../pages/templateButtonPage.robot
Resource    ../common/navigateSidebar.robot

*** Variables ***
${rule}     fixedAsset

*** Test Cases ***

Verify Capex Prebudget
    Toggle Prebudget
    Open Capex Prebudget Sidebar
    Download Worksheet Template
    Download Excel Template
    Upload Worksheet  E://for_branch_999//cpx.xlsx
    Upload worksheet difference tab
    Upload submit to database
    Refresh Button
    Capex unit price prebudget
    Save Button
    Yes button
##    No button
    Monthly tab    3
    Yearly tab     3
#    Verify that Guideline Button is working
    Validate test Remarks to branch 1
    History Button











