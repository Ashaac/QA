*** Settings ***
Documentation    this suite verifies hr page.
Library     SeleniumLibrary
Resource    ../pages/hrPrebudget.robot
Resource    ../pages/templateButtonPage.robot


*** Test Cases ***

Verify Hr Prebudget
    Verify that hr Prebudget Sidebar is clicked
    Verify Download Worksheet Template button is clicked and downloaded
    Verify that Download Excel Template button is clicked
    Verify that Upload Worksheet button is working     E://for_branch_999//hr.xlsx
    Click on Upload worksheet difference tab
    Click on Upload submit to database
    Verify that Refresh Button prebudget is clicked
    Click on Monthly tab    4
    Click on Yearly tab     4

