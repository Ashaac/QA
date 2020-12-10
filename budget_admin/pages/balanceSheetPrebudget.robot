*** Settings ***
Library      SeleniumLibrary
Resource     ../pages/templateButtonPage.robot
*** Variables ***
${menu_name_xpath}    prebudget

*** Keywords ***


Verify that Balance Sheet Prebudget Sidebar is clicked
    Wait Until Element Is Visible       xpath=//a[@id='${menu_name_xpath}_1']    timeout=5s
    click element    xpath=//a[@id='${menu_name_xpath}_1']
    sleep   2s

