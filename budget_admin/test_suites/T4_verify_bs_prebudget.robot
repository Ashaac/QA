*** Settings ***
Documentation    this suite verifies Capex page.
Library     SeleniumLibrary
Resource    ../pages/balanceSheetPrebudget.robot
Resource    ../pages/templateButtonPage.robot

*** Test Cases ***

Verify Activity Prebudget

    Verify that Balance Sheet Prebudget Sidebar is clicked
    Verify Download Worksheet Template button is clicked and downloaded
    Verify that Download Excel Template button is clicked
    Verify that Upload Worksheet button is working     E://for_branch_999//bs.xlsx
    Click on Upload worksheet difference tab
    Click on Upload submit to database
    Verify that Refresh Button prebudget is clicked
    Click on Monthly tab    1
    Click on Yearly tab     1


