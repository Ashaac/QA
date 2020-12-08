*** Settings ***
Documentation    this suite verifies User Management page.
Library     SeleniumLibrary
Resource    ../pages/userManagementPage.robot

*** Test Cases ***

Verify User Add
    Click on User Management
    Click Users
    Refresh User Button
    Click Add User
    run keyword and continue on failure    Click User Add Button
    Click on User Management

