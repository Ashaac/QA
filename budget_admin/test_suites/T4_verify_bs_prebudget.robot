*** Settings ***
Documentation    this suite verifies Capex page.
Library     SeleniumLibrary
Resource    ../pages/balanceSheetPrebudget.robot
Resource    ../pages/templateButtonPage.robot

*** Test Cases ***

Verify that BalanceSheet Prebudget Sidebar is clicked
    Verify that Balance Sheet Prebudget Sidebar is clicked

Verify Download BalanceSheet Worksheet Template button is clicked and downloaded
    Verify Download Worksheet Template button is clicked and downloaded

Verify that BalanceSheet Download Excel Template button is clicked
    Verify that Download Excel Template button is clicked

Verify that BalanceSheet Upload Worksheet button is working
    Verify that Upload Worksheet button is working

Upload file BalanceSheet after click upload
    Upload file after click upload         E://for_branch_999//bs.xlsx

Click on BalanceSheet Upload worksheet difference tab
    Click on Upload worksheet difference tab

Click on BalanceSheet Upload submit to database
    Click on Upload submit to database

Verify that BalanceSheet Refresh Button prebudget is clicked
    Verify that Refresh Button prebudget is clicked

Click on BalanceSheet Monthly tab
    Click on Monthly tab    1

Click on BalanceSheet Yearly tab
    Click on Yearly tab     1
#    Confirmation dialogue for worksheet upload


