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
    vaidate inputs of users name
    validate inputs of users username
    validate inputs of users password
    validate inputs of users email
    verify click in input roles
    verify click list and input region
    verify that click in branch list
    run keyword and continue on failure    Click User Add Button
    Click on User Management

