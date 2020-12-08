*** Settings ***
Library    SeleniumLibrary


Resource     ../pages/templateButtonPage.robot
*** Variables ***
${menu_name_xpath}    prebudget

*** Keywords ***


Open Profit Loss Prebudget
    Wait Until Element Is Visible       xpath=//a[@id='${menu_name_xpath}_2']    timeout=5s
    click element    xpath=//a[@id='${menu_name_xpath}_2']
    sleep   2s

