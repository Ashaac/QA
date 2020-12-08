*** Settings ***
Documentation    this suite verifies hr page.
Library     SeleniumLibrary
Resource    ../pages/hrPrebudget.robot
Resource    ../pages/templateButtonPage.robot


*** Test Cases ***

Verify Hr Prebudget
    Open hr Prebudget
    Download Worksheet Template
    Download Excel Template
    Upload Worksheet  E://for_branch_999//hr.xlsx
    Upload worksheet difference tab
    Upload submit to database
    Refresh Button
    Monthly tab     4
    Yearly tab      4