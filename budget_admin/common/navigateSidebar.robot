*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${menu_prebudget_xpath}                                  prebudget
${actiivity_monitoring_section_click_xpath}         //li[@id='activity']//div
${execution_log_click_xpath}                        //a[@id='activity_execution']
${refresh_button_execution_log}                     //app-execution-log/div/div[2]/nz-button-group/button

${click_template_log_xpath}                         //li//a[@id='activity_template']
${click_history_template_log}                       //button[@id='history-button-template']
*** Keywords ***

Verify that Toggle Prebudget menu is clicked
    Wait Until Element Is Visible        xpath=//li[@id="${menu_prebudget_xpath}"]//span
    click element    xpath=//li[@id="${menu_prebudget_xpath}"]//span
    sleep   2s

Click on Activity Monitoring
    wait until element is visible    ${actiivity_monitoring_section_click_xpath}
    click element    ${actiivity_monitoring_section_click_xpath}
#    Execution log

Execution log
# --- Execution log
    wait until element is visible    ${execution_log_click_xpath}
    click element    ${execution_log_click_xpath}
#-- refresh button
    sleep   6s
    wait until element is visible    ${refresh_button_execution_log}
    click element    ${refresh_button_execution_log}
    sleep   8s
    click element    ${refresh_button_execution_log}
    sleep   4s


Template log
    wait until element is visible    ${click_template_log_xpath}
    click element    ${click_template_log_xpath}

# -- click history of template log
    wait until element is visible    ${click_history_template_log}
    click element    ${click_history_template_log}



