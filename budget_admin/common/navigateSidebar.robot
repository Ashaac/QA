*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${actiivity_monitoring_section_click_xpath}         //li[@id='activity']//div
${execution_log_click_xpath}                        //a[@id='activity_execution']
${refresh_button_execution_log}                     //app-execution-log/div/div[2]/nz-button-group/button

#${approve_button_unitl_complete_execution_log_xpath}     //nz-tag[contains(text(), "completed")]
#${approve_click_execution_log}    //app-execution-log/nz-table/nz-spin/div/div/div/div/div[2]/table/tbody/tr[1]/td[9]/a
#${ok_approve_button_click_xpath}        //div[@class="ant-popover-buttons"]//button[2]
#${cancel_simulation_inside_execution_log_xpath}     //div[@class="ant-popover-buttons"]//button[1]
#${download_prebudget_result_xpath}  //app-execution-log/nz-table/nz-spin/div/div/div/div/div[2]/table/tbody/tr[1]/td[9]/span/a

${click_template_log_xpath}                         //li//a[@id='activity_template']
${click_history_template_log}                       //button[@id='history-button-template']
*** Keywords ***

toggle Activity Monitoring
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





#
#Approve click simulation
## -- approve click
#    wait until element is not visible   ${approve_button_unitl_complete_execution_log_xpath}
#    click element    ${approve_click_execution_log}
#    sleep   1s
#Ok button to approve simualtion
##-- ok approve click
#    wait until element is visible   ${ok_approve_button_click_xpath}
#    click element        ${ok_approve_button_click_xpath}
#    sleep   2s
#Cancel approve simulation
## --  cancel click
#    wait until element is visible   ${cancel_simulation_inside_execution_log_xpath}
#    click button   ${cancel_simulation_inside_execution_log_xpath}
#    sleep    2s

#Download prebudget result
## -- download prebudget
#    wait until element is visible    ${download_prebudget_result_xpath}
#    click element    ${download_prebudget_result_xpath}
#    sleep    2s
##    toggle Activity Monitoring



