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
    Verify that Toggle Prebudget menu is clicked
    Verify that Capex Prebudget Sidebar is clicked
    Verify Download Worksheet Template button is clicked and downloaded
    Verify that Download Excel Template button is clicked
    Verify that Upload Worksheet button is working     E://for_branch_999//cpx.xlsx
    Click on Upload worksheet difference tab
    Click on Upload submit to database
    Verify that Refresh Button prebudget is clicked
    Verify to input values in Capex unit price prebudget
    Verify that Save Button is clicked
    Verify that Yes button is clicked and values are saved
##    No button
    Click on Monthly tab    3
    Click on Yearly tab     3
#    Verify that Guideline Button is working
    Validate test Remarks to branch 1
    Verify that History Button is working











