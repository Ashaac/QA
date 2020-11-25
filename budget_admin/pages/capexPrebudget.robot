*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${menu_name}    prebudget
${download_dropdown}    //span[@class='ant-dropdown-trigger']//i
${download_worksheet_xpath}    //app-download-worksheet[@id='download_worksheet_btn']
${download_excel_xpath}    //li[@id='download_template_btn']
*** Keywords ***
Verify Capex Prebudget
    Toggle Prebudget
    Open Capex Prebudget
#    Capex Download Worksheet
#    Capex Download Excel

Toggle Prebudget
    Wait Until Element Is Visible        xpath=//li[@id="${menu_name}"]//span
    click element    xpath=//li[@id="${menu_name}"]//span
    sleep   2s

Open Capex Prebudget
    Wait Until Element Is Visible       xpath=//a[@id='${menu_name}_3']
    click element    xpath=//a[@id='${menu_name}_3']
    sleep   2s


Download Dropdown
#   Dropdown Button
    Wait Until Element Is Visible       ${download_dropdown}
    click element    ${download_dropdown}
    sleep   1s
Capex Download Worksheet
    Download Dropdown
#   Download Worksheet
    Wait Until Element Is Visible   ${download_worksheet_xpath}
    click element   ${download_worksheet_xpath}
    sleep   5s

Capex Download Excel
    Download Dropdown
#   Download Excel
    Wait Until Element Is Visible      ${download_excel_xpath}
    click element     ${download_excel_xpath}
    sleep   2s
