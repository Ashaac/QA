*** Settings ***
Documentation    this suite verifies User Management page.
Library     SeleniumLibrary
Resource    ../pages/userManagementPage.robot

*** Test Cases ***

Verify User Add
    run keyword and continue on failure    Click on User Management
    run keyword and continue on failure    Click Users
#Refresh User Button
#    run keyword and continue on failure     Refresh User Button
#Click Add User
#    run keyword and continue on failure     Click Add User
#vaidate inputs of users name
#    run keyword and continue on failure     validate inputs of users name
#validate inputs of users username
#    run keyword and continue on failure     validate inputs of users username
#validate inputs of users password
#    run keyword and continue on failure     validate inputs of users password
#validate inputs of users email
#    run keyword and continue on failure     validate inputs of users email
#verify click in input roles
#    run keyword and continue on failure     verify click in input roles
#verify click list and input region
#    run keyword and continue on failure     verify click list and input region
#verify that click in branch list
#    run keyword and continue on failure     verify that click in branch list
#Click User Add Button
#    run keyword and continue on failure    Click User Add Button
#Click on User Management
#    run keyword and continue on failure     Click on User Management

