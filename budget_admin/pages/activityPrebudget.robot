*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${menu_name_xpath}    prebudget

*** Keywords ***

Open Activity Prebudget
    Wait Until Element Is Visible       xpath=//a[@id='${menu_name_xpath}_5']    timeout=10s
    click element    xpath=//a[@id='${menu_name_xpath}_5']
    sleep   2s
