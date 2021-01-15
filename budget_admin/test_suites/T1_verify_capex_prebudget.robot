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
    Click on Prebudget menu
    Click Capex Prebudget Sidebar

#Verify Capex Download Worksheet Template button is clicked and downloaded
#    Verify Download Worksheet Template button is clicked and downloaded
#
#Verify that Capex Download Excel Template button is clicked
#    Verify that Download Excel Template button is clicked
#
#Verify that Capex Upload Worksheet button is working
#    Verify that Upload Worksheet button is working
#Upload file after click upload
#    Upload file after click upload         E://for_branch_999//cpx.xlsx
#
#Click on Capex Upload worksheet difference tab
#    Click on Upload worksheet difference tab
#
#Click on Capex Upload submit to database
#    Click on Upload submit to database
#
#Verify that Capex Refresh Button prebudget is clicked
#    Verify that Refresh Button prebudget is clicked
#
#Verify to Capex input values in Capex unit price prebudget
#    Verify to input values in Capex unit price prebudget
#
#Verify that Capex Save Button is clicked
#    Verify that Save Button is clicked
#
#Verify that Capex Yes button is clicked and values are saved
#    Verify that Yes button is clicked and values are saved
#No button Capex
#    No button
#Click on Capex Monthly tab
#    Click on Monthly tab    3
#Click on Capex Yearly tab
#    Click on Yearly tab     3
#
#Verify that Capex Guideline Button is working
#    Verify that Guideline Button is working
#
#Validate test Capex Remarks to branch 1
#    Validate test Remarks to branch 1
#
#Verify that Capex History Button is working
#    Verify that History Button is working


#   Confirmation dialogue for worksheet upload









