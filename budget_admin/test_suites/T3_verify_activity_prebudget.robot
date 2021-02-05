*** Settings ***
Documentation    this suite verifies Activity based template
Library     SeleniumLibrary
Resource    ../pages/activityPrebudget.robot
Resource    ../pages/templateButtonPage.robot

*** Test Cases ***


Verify that Activity Based Prebudget Sidebar is clicked
    run keyword and continue on failure    Verify that Activity Based Prebudget Sidebar is clicked
#
#Verify Download ActivtyBased Worksheet Template button is clicked and downloaded
#    run keyword and continue on failure    Verify Download Worksheet Template button is clicked and downloaded
#
#Verify that ActivtyBased Download Excel Template button is clicked
#    run keyword and continue on failure    Verify that Download Excel Template button is clicked
#
#Verify that ActivtyBasedv Upload Worksheet button is working
#    run keyword and continue on failure    Verify that Upload Worksheet button is working
#
#Upload file ActivtyBased after click upload
#    run keyword and continue on failure    Upload file after click upload         E://for_branch_999//ab.xlsx
#
#Click on ActivtyBased Upload worksheet difference tab
#    run keyword and continue on failure    Click on Upload worksheet difference tab
#
#Click on ActivtyBased Upload submit to database
#    run keyword and continue on failure    Click on Upload submit to database
#
#Verify that ActivtyBased Refresh Button prebudget is clicked
#    run keyword and continue on failure    Verify that Refresh Button prebudget is clicked
#
#Click on ActivtyBased Monthly tab
#    run keyword and continue on failure    Click on Monthly tab    5
#
#Click on ActivtyBased Yearly tab
#    run keyword and continue on failure    Click on Yearly tab     5



