*** Settings ***
Documentation    this suite verifies Capex prebudget.

Library     SeleniumLibrary
Resource    ../pages/capexPrebudget.robot
Resource    ../pages/templateButtonPage.robot
Resource    ../common/navigateSidebar.robot
Resource    ../api_keywords/commonApiKeywords.robot

*** Variables ***
${rule}     fixedAsset

*** Test Cases ***

Verify Capex Prebudget
    run keyword and continue on failure    Click on Prebudget menu
    run keyword and continue on failure     Click Capex Prebudget Sidebar

Test api
    Compare capex Land month1
    Capex Land month2
#    #Verify Login Page is successful
#    #Compare capex Land data
#    run keyword and continue on failure    Click on Prebudget menu
#    run keyword and continue on failure     Click Capex Prebudget Sidebar


Verify Capex Download Worksheet Template button is clicked and downloaded
    run keyword and continue on failure    Verify Download Worksheet Template button is clicked and downloaded

Verify that Capex Download Excel Template button is clicked
    run keyword and continue on failure    Verify that Download Excel Template button is clicked

Verify that Capex Upload Worksheet button is working
    run keyword and continue on failure    Verify that Upload Worksheet button is working
Upload file after click upload
    run keyword and continue on failure    Upload file after click upload         E://for_branch_999//cpx.xlsx

Click on Capex Upload worksheet difference tab
    run keyword and continue on failure    Click on Upload worksheet difference tab

Click on Capex Upload submit to database
    run keyword and continue on failure    Click on Upload submit to database

Verify that Capex Refresh Button prebudget is clicked
    run keyword and continue on failure    Verify that Refresh Button prebudget is clicked

Verify to Capex input values in Capex unit price prebudget
    run keyword and continue on failure    Verify to input values in Capex unit price prebudget     5000

Verify that Capex Save Button is clicked
    run keyword and continue on failure    Verify that Save Button is clicked

Verify that Capex Yes button is clicked and values are saved
    run keyword and continue on failure    Verify that Yes button is clicked and values are saved
#No button Capex
#    run keyword and continue on failure    No button

Click on Capex Monthly tab
    run keyword and continue on failure    Click on Monthly tab    3
Click on Capex Yearly tab
    run keyword and continue on failure    Click on Yearly tab     3

Verify that Capex Guideline Button is working
    run keyword and continue on failure    Verify that Guideline Button is working

Validate test Capex Remarks to branch 1
    run keyword and continue on failure    Validate test Remarks to branch 1

Verify that Capex History Button is working
    run keyword and continue on failure    Verify that History Button is working





#Template log
#    run keyword and continue on failure    Template log



