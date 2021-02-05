*** Settings ***
Documentation    this suite verifies Capex page.
Library     SeleniumLibrary
Resource    ../pages/balanceSheetPrebudget.robot
Resource    ../pages/templateButtonPage.robot

*** Test Cases ***

Verify that BalanceSheet Prebudget Sidebar is clicked
    run keyword and continue on failure    Verify that Balance Sheet Prebudget Sidebar is clicked

#Verify Download BalanceSheet Worksheet Template button is clicked and downloaded
#    run keyword and continue on failure    Verify Download Worksheet Template button is clicked and downloaded
#
#Verify that BalanceSheet Download Excel Template button is clicked
#    run keyword and continue on failure    Verify that Download Excel Template button is clicked
#
#Verify that BalanceSheet Upload Worksheet button is working
#    run keyword and continue on failure    Verify that Upload Worksheet button is working
#
#Upload file BalanceSheet after click upload
#    run keyword and continue on failure    Upload file after click upload         E://for_branch_999//bs.xlsx
#
#Click on BalanceSheet Upload worksheet difference tab
#    run keyword and continue on failure    Click on Upload worksheet difference tab
#
#Click on BalanceSheet Upload submit to database
#    run keyword and continue on failure    Click on Upload submit to database
#
#Verify that BalanceSheet Refresh Button prebudget is clicked
#    run keyword and continue on failure    Verify that Refresh Button prebudget is clicked
#
#Click on BalanceSheet Monthly tab
#    run keyword and continue on failure    Click on Monthly tab    1
#
#Click on BalanceSheet Yearly tab
#    run keyword and continue on failure    Click on Yearly tab     1


