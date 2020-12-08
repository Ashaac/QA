*** Settings ***
Documentation    this suite verifies Capex page.
Library     SeleniumLibrary
Resource    ../pages/balanceSheetPrebudget.robot
Resource    ../pages/templateButtonPage.robot

*** Test Cases ***

Verify Activity Prebudget

    Open Balance Sheet Prebudget
    Download Worksheet Template
    Download Excel Template
    Upload Worksheet  E://for_branch_999//bs.xlsx
    Upload worksheet difference tab
    Upload submit to database
    Refresh Button
    Monthly tab     1
    Yearly tab      1