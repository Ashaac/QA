*** Settings ***
Documentation    this suite verifies Capex page.
Library     SeleniumLibrary
Resource    ../pages/activityPrebudget.robot
Resource    ../pages/templateButtonPage.robot

*** Test Cases ***

Verify Activity Prebudget

    Open Activity Prebudget
    Download Worksheet Template
    Download Excel Template
    Upload Worksheet  E://for_branch_999//ab.xlsx
    Upload worksheet difference tab
    Upload submit to database
    Refresh Button
    Monthly tab     5
    Yearly tab      5