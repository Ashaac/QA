*** Settings ***
Documentation    this suite verifies hr template prebudget.
Library     SeleniumLibrary
Resource    ../pages/hrPrebudget.robot
Resource    ../pages/templateButtonPage.robot


*** Test Cases ***

Verify Hr Prebudget
    run keyword and continue on failure    Verify that hr Prebudget Sidebar is clicked
#
#Verify HR Download Worksheet Template button is clicked and downloaded
#    run keyword and continue on failure    Verify Download Worksheet Template button is clicked and downloaded
#
#Verify that HR Download Excel Template button is clicked
#    run keyword and continue on failure    Verify that Download Excel Template button is clicked
#
#Verify that HR Upload Worksheet button is working
#    run keyword and continue on failure    Verify that Upload Worksheet button is working
#
#Upload HR file after click upload
#    run keyword and continue on failure    Upload file after click upload         E://for_branch_999//hr.xlsx
#
#Click on HR Upload worksheet difference tab
#    run keyword and continue on failure    Click on Upload worksheet difference tab
#
#Click on HR Upload submit to database
#    run keyword and continue on failure    Click on Upload submit to database
#
#Verify that HR Refresh Button prebudget is clicked
#    run keyword and continue on failure    Verify that Refresh Button prebudget is clicked
#
#Click on HR Monthly tab
#    run keyword and continue on failure    Click on Monthly tab    4
#
#Click on HR Yearly tab
#    run keyword and continue on failure    Click on Yearly tab     4
#
