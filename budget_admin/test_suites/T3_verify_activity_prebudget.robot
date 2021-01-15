*** Settings ***
Documentation    this suite verifies Capex page.
Library     SeleniumLibrary
Resource    ../pages/activityPrebudget.robot
Resource    ../pages/templateButtonPage.robot

*** Test Cases ***


Verify that Activity Based Prebudget Sidebar is clicked
    Verify that Activity Based Prebudget Sidebar is clicked

Verify Download ActivtyBased Worksheet Template button is clicked and downloaded
    Verify Download Worksheet Template button is clicked and downloaded

Verify that ActivtyBased Download Excel Template button is clicked
    Verify that Download Excel Template button is clicked

Verify that ActivtyBasedv Upload Worksheet button is working
    Verify that Upload Worksheet button is working

Upload file ActivtyBased after click upload
    Upload file after click upload         E://for_branch_999//ab.xlsx

Click on ActivtyBased Upload worksheet difference tab
    Click on Upload worksheet difference tab

Click on ActivtyBased Upload submit to database
    Click on Upload submit to database

Verify that ActivtyBased Refresh Button prebudget is clicked
    Verify that Refresh Button prebudget is clicked

Click on ActivtyBased Monthly tab
    Click on Monthly tab    5

Click on ActivtyBased Yearly tab
    Click on Yearly tab     5
#    Confirmation dialogue for worksheet upload


