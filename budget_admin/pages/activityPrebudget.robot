*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${menu_name_xpath}    prebudget

*** Keywords ***

Verify that Activity Based Prebudget Sidebar is clicked
    Wait Until Element Is Visible       xpath=//a[@id='${menu_name_xpath}_5']    timeout=10s
    click element    xpath=//a[@id='${menu_name_xpath}_5']
    sleep   2s
