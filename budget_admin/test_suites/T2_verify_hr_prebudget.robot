*** Settings ***
Documentation    this suite verifies hr page.
Library     SeleniumLibrary
Resource    ../pages/hrPrebudget.robot
Resource    ../pages/templateButtonPage.robot


*** Test Cases ***

Verify Hr Prebudget
    Verify that hr Prebudget Sidebar is clicked

#Verify HR Download Worksheet Template button is clicked and downloaded
#    Verify Download Worksheet Template button is clicked and downloaded
#
#Verify that HR Download Excel Template button is clicked
#    Verify that Download Excel Template button is clicked
#
#Verify that HR Upload Worksheet button is working
#    Verify that Upload Worksheet button is working
#
#Upload HR file after click upload
#    Upload file after click upload         E://for_branch_999//hr.xlsx
#
#Click on HR Upload worksheet difference tab
#    Click on Upload worksheet difference tab
#
#Click on HR Upload submit to database
#    Click on Upload submit to database
#
#Verify that HR Refresh Button prebudget is clicked
#    Verify that Refresh Button prebudget is clicked
#
#Click on HR Monthly tab
#    Click on Monthly tab    4
#
#Click on HR Yearly tab
#    Click on Yearly tab     4

##    Confirmation dialogue for worksheet upload
