*** Settings ***
Documentation    this suite verifies Guidelines page.
Library     SeleniumLibrary
Resource    ../pages/guidelines.robot
Resource    ../common/navigateSidebar.robot

*** Test Cases ***

Click guidelines
    run keyword and continue on failure    Click guidelines

Add guideline
    run keyword and continue on failure    Add guideline

Input name and value
    run keyword and continue on failure    Input name and value

click add items in guidelines
    run keyword and continue on failure    click add items in guidelines

#click close guidelines button
#    run keyword and continue on failure    click close guidelines button
#
#    run keyword and continue on failure    Click Budget

click save guidelines button
    run keyword and continue on failure    click save guidelines button
    run keyword and continue on failure    Click Budget

