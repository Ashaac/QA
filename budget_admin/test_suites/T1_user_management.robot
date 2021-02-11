*** Settings ***
Documentation    this suite verifies User Management page.
Library     SeleniumLibrary
Resource    ../pages/userManagementPage.robot
Resource    ../pages/templateButtonPage.robot
Resource    ../pages/guidelines.robot

*** Test Cases ***

Verify User Add
    run keyword and continue on failure    Click on User Management
    run keyword and continue on failure    Click Users

Refresh User Button
    run keyword and continue on failure     Refresh User Button
Click Add User
    run keyword and continue on failure     Click Add User
vaidate inputs of users name
    run keyword and continue on failure     validate inputs of name        testing1a1
validate inputs of users username
    run keyword and continue on failure     validate inputs of users username    testing1a1
validate inputs of users password
    run keyword and continue on failure     validate inputs of users password       testing1a1
validate inputs of users email
    run keyword and continue on failure     validate inputs of users email      testing1a1@gmail.com
verify click in input roles
    run keyword and continue on failure     verify click in input roles
verify click list and input region
    run keyword and continue on failure     verify click list and input region      Region 1
verify that click in branch list
    run keyword and continue on failure     verify that click in branch list
Click User Add Button
    run keyword and continue on failure    Click User Add Button
#    run keyword and continue on failure    Click close user add button

Pagination change
    run keyword and continue on failure    Pagination change

#Edit username
Click edit user button in User Management
    run keyword and continue on failure    click edit button from user page
Click edit name in User Management
    run keyword and continue on failure     validate inputs of name     testing121

Click edit username in User Management
    run keyword and continue on failure     validate inputs of users username    testing121

Click edit email in User Management
    run keyword and continue on failure     validate inputs of users email      testing121@gmail.com

Click edit user click list and input region
    run keyword and continue on failure     verify edit user click list and input region     Region 2

Click edit user in branch list
    run keyword and continue on failure     verify that edit click in branch list

Click button edit user
    run keyword and continue on failure     Click Edit user Button


click delete user button
    run keyword and continue on failure    click delete user button
    run keyword and continue on failure    Yes delete user
#    run keyword and continue on failure    No delete user


Click on User Management
    run keyword and continue on failure     Click on User Management
