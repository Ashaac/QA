*** Settings ***
Documentation    this suite verifies Capex page.
Library     SeleniumLibrary
Resource    ../pages/profitLossPrebudget.robot
Resource    ../pages/templateButtonPage.robot

#Resource    ../common/navigateSidebar.robot
Resource    ../common/commonKeywords.robot

*** Test Cases ***

Verify that ProfitLoss Prebudget Sidebar is clicked
    run keyword and continue on failure    Verify that Profit Loss Prebudget Sidebar is clicked
#
#Verify Download Worksheet Template button is clicked and downloaded
#    run keyword and continue on failure    Verify Download Worksheet Template button is clicked and downloaded
#
#Verify that Download Excel Template button is clicked
#    run keyword and continue on failure    Verify that Download Excel Template button is clicked
#
#Verify that Upload Worksheet button is working
#    run keyword and continue on failure    Verify that Upload Worksheet button is working
#
#Upload file after click upload
#    run keyword and continue on failure    Upload file after click upload          E://for_branch_999//pl.xlsx
#
#Click on Upload worksheet difference tab
#    run keyword and continue on failure    Click on Upload worksheet difference tab
#
#Click on Upload submit to database
#    run keyword and continue on failure    Click on Upload submit to database
#
#Verify that Refresh Button prebudget is clicked
#    run keyword and continue on failure    Verify that Refresh Button prebudget is clicked
#
#Click on Monthly tab
#    run keyword and continue on failure    Click on Monthly tab    2
#
#Click on Yearly tab
#    run keyword and continue on failure    Click on Yearly tab     2


