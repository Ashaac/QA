*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${menu_name}                            prebudget
${download_dropdown}                    //span[@class='ant-dropdown-trigger']//i
${download_worksheet_xpath}             //app-download-worksheet[@id='download_worksheet_btn']
${download_excel_xpath}                 //li[@id='download_template_btn']

${upload_button}                        //app-upload-template[@id='upload_worksheet_btn']

${file_upload_block}                    document.getElementById('upload_file-chooser').getElementsByTagName('input')[0].style.display='block'
${file_upload_none}                     document.getElementById('upload_file-chooser').getElementsByTagName('input')[0].style.display='none'
${worksheet_difference_tab_xpath}           //app-upload-worksheet/div/mat-horizontal-stepper/div[1]/mat-step-header[2]/div[3]
${worksheet_submit_tab_xpath}           //app-upload-worksheet/div/mat-horizontal-stepper/div[1]/mat-step-header[3]
${submit_to_database_upload_button}     //mat-horizontal-stepper//button//span
${notify_after_upload}                  //nz-notification/div/div/div/div/div[1]
${backdrop_click}                       document.getElementsByClassName('cdk-overlay-backdrop')[0].click()
${save_button}                          //i[@id='template_save_btn']
${yes_button}                           //button[@id='confirm_save']
${no_button}                            //button[@id='confirm_dismiss']

${template_refresh}                     //i[@id='template_refresh_btn']

${history_button}                       //budget-treetable-capex/div[1]/app-button-on-template/span/nz-dropdown[2]
${click_latest_history}                 //div[@class='cdk-overlay-container']//li[1]
${first_row_table_history}              //app-history/div[2]/div/ejs-treegrid/div[2]/div[3]/div/table/tbody/tr[1]

${guideline_button}                     //app-budget-guideline-template[@id='guidleline_btn']
${guideline_xpath}                      //mat-dialog-container[@id='mat-dialog-0']
${close_guideline_button}               //mat-dialog-container/app-view-guideline/div/span/button

${simulation_button}                    //span//i[@id='simulation_dialog_btn']
${yes_before_simulation_button}         //nz-modal/div/div[2]/div/div/div[3]/button[2]
${no_before_simulation_button}          //nz-modal/div/div[2]/div/div/div[3]/button[1]

${no_simulation_button}                 //button[@id='confirm_dismiss']//span
${yes_simulation_button}                //button[@id='confirm_save']//span

${radio_button_click_fixedAsset}        //nz-radio-group/label[1]/span[2]
${radio_button_click_netProfit}         //nz-radio-group/label[2]/span[2]

${click_view_remarks}                   //app-template-remark[@id='remark_btn']
${click_view_remarks_branch_1}          //app-remark-dialog/div[1]/div/div/div[1]/div[2]/button[2]
${test_message_click}                   //div[@id='type_msg']
${test_message_placeholder}             xpath=//textarea[@placeholder='Remark']
${send_remarks_button}                  //div[@id='type_msg']/i

${approve_button_unitl_complete_execution_log_xpath}     //nz-tag[contains(text(), "completed")]
${approve_click_execution_log}                          //app-execution-log/nz-table/nz-spin/div/div/div/div/div[2]/table/tbody/tr[1]/td[9]/a

${ok_approve_button_click_xpath}                        //div[@class="ant-popover-buttons"]//button[2]
${cancel_simulation_inside_execution_log_xpath}         //div[@class="ant-popover-buttons"]//button[1]

${download_prebudget_result_xpath}                      //app-execution-log/nz-table/nz-spin/div/div/div/div/div[2]/table/tbody/tr[1]/td[9]/span/a

${quarterly_menu_name}        quarterlyReports
${quarterlyreport}      quarterlyReports_consolidate
${specialReports}       specialReports
${click_template_consolidate_xpath}     //li[@id="template"]//div
${template_consolidate}     template_consolidate

${Reports_consolidation}    reports_consolidate
${Reports}      reports
*** Keywords ***

Download Dropdown Button
#   Dropdown Button
    Wait Until Element Is Visible       ${download_dropdown}
    click element    ${download_dropdown}
    sleep   1s

Verify Download Worksheet Template button is clicked and downloaded
    Download Dropdown Button
    sleep   2s
#   Download Worksheet
    Wait Until Element Is Visible   ${download_worksheet_xpath}
    click element   ${download_worksheet_xpath}
    sleep   5s
#    Confirmation dialogue for worksheet upload

Verify that Download Excel Template button is clicked
    Download Dropdown Button
#   Download Excel
    sleep   2s
    Wait Until Element Is Visible      ${download_excel_xpath}
    click element     ${download_excel_xpath}
    sleep   2s


Verify that Upload Worksheet button is working
    Download Dropdown Button
    sleep    1s
#   Upload Button
    Wait Until Element Is Visible      ${upload_button}
    click element    ${upload_button}
    sleep   1s


Upload file after click upload
    [Arguments]    ${upload_cpx}
# file gets upload
    Execute Javascript    ${file_upload_block}
    input text      xpath=//label[@id='upload_file-chooser']//input     ${upload_cpx}
    Execute Javascript    ${file_upload_none}
    sleep   1s



Click on Upload worksheet difference tab
    wait until element is visible    ${worksheet_difference_tab_xpath}
    click element   ${worksheet_difference_tab_xpath}
    sleep       1s
# Upload worksheet submit tab
    click element       ${worksheet_submit_tab_xpath}
    sleep   2s



Click on Upload submit to database
    WAIT UNTIL ELEMENT IS VISIBLE    ${submit_to_database_upload_button}
    log to console      submit clickcked
    click element        //app-upload-worksheet/div/mat-horizontal-stepper/descendant::button
    sleep    2s
#    log to console      submit clickcked ended
    ${Action_in_progress}=  get element count    xpath=//div[contains(@class, "ant-message-notice-content")]
    log to console   ================= ${Action_in_progress} =========================
    RUN KEYWORD IF      ${Action_in_progress}>0    wait until page does not contain element       xpath=//div[contains(@class, "ant-message-notice-content")]    timeout=300s
    ...     ELSE        backdrop
#    ${Action_in_progress}=  get element count    xpath=//div[contains(@class, "ant-message-notice-content")]
#    backdrop
    sleep    1s


Verify that Save Button is clicked
    Wait Until Element Is Visible      ${save_button}
    click element    ${save_button}
    sleep   1s


#   Yes confirm save
Verify that Yes button is clicked and values are saved
    Wait until element is visible    ${yes_button}
    click element       ${yes_button}
    sleep   2s
    ${Action_in_progress}=  get element count    xpath=//div[contains(@class, "ant-message-notice-content")]
    RUN KEYWORD IF      ${Action_in_progress}>0    wait until page does not contain element       xpath=//div[contains(@class, "ant-message-notice-content")]    timeout=40s
    ...     ELSE        backdrop

No button
    Wait until element is visible    ${no_button}
    click element       ${no_button}
    sleep   5s

Click on Monthly tab
   [Arguments]    ${template_id}
    Wait until element is visible    //button[@id='month_view_tab_${template_id}']
    click element       //button[@id='month_view_tab_${template_id}']
    sleep   2s

Click on Yearly tab
   [Arguments]    ${template_id}
    Wait until element is visible    //button[@id='year_view_tab_${template_id}']
    click element       //button[@id='year_view_tab_${template_id}']
    sleep   2s

Verify that Refresh Button prebudget is clicked
    wait until element is not visible    ${notify_after_upload}
    wait until element is visible   ${template_refresh}
    click element    ${template_refresh}
    sleep    2s



Verify that History Button is working
    wait until element is visible    ${history_button}
    click element    ${history_button}
    sleep   2s
    click element    ${click_latest_history}
    wait until element is visible    ${first_row_table_history}
    sleep    2s


Verify that Guideline Button is working
    wait until element is visible    ${guideline_button}
    click element    ${guideline_button}
    sleep    2s
#    backdrop
    #-- box of guideline
    #wait until element is visible    ${guideline_xpath}
    click button    ${close_guideline_button}
    #sleep    1s



Click on Simulation Button Template
    sleep    2s
    Wait Until Element Is Visible       ${simulation_button}
    click element   ${simulation_button}
    sleep    5s

Click rules simulation
   [Arguments]    ${rule}=fixedAsset
    RUN KEYWORD IF      '${rule}'=='fixedAsset'    Click FixedAsset
    ...      ELSE       Click NetProfit
    log to console    ${rule}
    sleep    2s
#-- Ok  button for before simulation
    WAIT UNTIL ELEMENT IS VISIBLE    ${yes_before_simulation_button}
    click element    ${yes_before_simulation_button}
    sleep   5s


# -- NO  button for before simulation
#    WAIT UNTIL ELEMENT IS VISIBLE    ${no_before_simulation_button}
#    click element    ${no_before_simulation_button}
#    sleep   2s
#

No simulation
    Wait Until Element Is Visible    ${no_simulation_button}}
    click element   ${no_simulation_button}

click Yes for simulation template
    Wait Until Element Is Visible    ${yes_simulation_button}
    click element    ${yes_simulation_button}
    sleep    2s


Click FixedAsset
    # -- Based on fixed assets
    WAIT UNTIL ELEMENT IS VISIBLE    ${radio_button_click_fixedAsset}
    click element    ${radio_button_click_fixedAsset}
    sleep   2s

Click NetProfit
    # -- Based on net profit
    WAIT UNTIL ELEMENT IS VISIBLE    ${radio_button_click_netProfit}
    click element    ${radio_button_click_netProfit}
    sleep   2s



Validate test Remarks to branch 1
    Click to View remarks and chat menu
    Type test messages in view remarks
    send button
    backdrop

#-- for  view  remarks
Click to View remarks and chat menu
    wait until element is visible   ${click_view_remarks}
    click element    ${click_view_remarks}
    sleep   2s
    click element    ${click_view_remarks_branch_1}

Type test messages in view remarks
    wait until element is visible    ${test_message_click}
    click element    ${test_message_click}
    sleep    2s
    input text    ${test_message_placeholder}     hello

send button
    wait until element is visible   ${send_remarks_button}
    click element    ${send_remarks_button}
    sleep    3s

backdrop
    Execute javascript  ${backdrop_click}
    sleep   1s


Template history drop down
    wait until element is not visible    xpath=//div[@class='ant-notification-notice-message']
    click element    xpath=//app-budget-treetable-income-expenses/div[1]/app-button-on-template/span/nz-dropdown[2]
    sleep   1s
#-- error    wait until element is not visible   xpath=//div[@class='cdk-overlay-container']//li[1]
#    click element   xpath=//div[@class='cdk-overlay-container']//li[1]
#    sleep    2s



Approve click simulation
# -- approve click
    wait until element is not visible   ${approve_button_unitl_complete_execution_log_xpath}
    click element    ${approve_click_execution_log}
    sleep   1s
Ok button to approve simualtion
#-- ok approve click
    wait until element is visible   ${ok_approve_button_click_xpath}
    click element        ${ok_approve_button_click_xpath}
    sleep   2s
Cancel approve simulation
# --  cancel click
    wait until element is visible   ${cancel_simulation_inside_execution_log_xpath}
    click button   ${cancel_simulation_inside_execution_log_xpath}
    sleep    2s

Download prebudget result
# -- download prebudget
    wait until element is visible    ${download_prebudget_result_xpath}
    click element    ${download_prebudget_result_xpath}
    sleep    2s




# =============== Quarterly Reports

toggle quarterlyReports
#    [Arguments]    ${menu_name}=quarterlyReports
    Wait Until Element Is Visible       xpath=//li[@id='${quarterly_menu_name}']//div
    click element    xpath=//li[@id='${quarterly_menu_name}']//div
    sleep   1s

#-- quarterlyReports_balance_sheet

Balance sheet quarterlyReports
    Wait Until Element Is Visible       xpath=//a[@id='${quarterlyreport}_1']
    click element    xpath=//a[@id='${quarterlyreport}_1']
    sleep   1s
    Download quarterlyReports
#    Click refresh quarterlyReports

PL quarterlyReports
    Wait Until Element Is Visible       xpath=//a[@id='${quarterlyreport}_2']
    click element    xpath=//a[@id='${quarterlyreport}_2']
    sleep   1s
    Download quarterlyReports

Capex quarterlyReports
    Wait Until Element Is Visible       xpath=//a[@id='${quarterlyreport}_3']
    click element    xpath=//a[@id='${quarterlyreport}_3']
    sleep   1s
    Download quarterlyReports

HR quarterlyReports
    Wait Until Element Is Visible       xpath=//a[@id='${quarterlyreport}_4']
    click element    xpath=//a[@id='${quarterlyreport}_4']
    sleep   1s
    Download quarterlyReports

Activity Based quarterlyReports
    Wait Until Element Is Visible       xpath=//a[@id='${quarterlyreport}_5']
    click element    xpath=//a[@id='${quarterlyreport}_5']
    sleep   1s
    Download quarterlyReports


Download quarterlyReports
# -- download special report
    Wait Until Element Is not Visible   xpath=//app-budget-quarterly-consolidation-report/div[2]/div/nz-table/nz-spin/div/div/div/div/div/table
    click element    xpath=//app-budget-quarterly-consolidation-report/div[1]/div/span/i[1]
    sleep   3s



# =========== Special Reports
toggle specialReports
    Wait Until Element Is Visible       xpath=//li[@id='${specialReports}']//div
    click element    xpath=//li[@id='${specialReports}']//div
    sleep   3s


#    Wait Until Element Is Visible       xpath=//a[@id='${specialReports}_1']
Balance sheet specialReports
    click element    xpath=//a[@id='${specialReports}_1']
    sleep   1s
    ${state_sp}=    get element count    xpath=//p[@class="ant-empty-description"]
    RUN KEYWORD IF    ${state_sp}>0         Date selection specialReports
    ...    ELSE     Download specialReports



Date selection specialReports
    click element    //app-root/nz-layout/nz-layout/nz-content/div/app-budget-special-report/div[1]/div/app-month/nz-select/div/div/div[2]
    click element    //li[starts-with(@class,'ant-select-dropdown-menu-item')][last()-1]
    sleep    3s
    Download specialReports

PL specialReports
    Wait Until Element Is Visible       xpath=//a[@id='${specialReports}_2']
    click element    xpath=//a[@id='${specialReports}_2']
    sleep   1s
    Download specialReports

Capex specialReports
    Wait Until Element Is Visible       xpath=//a[@id='${specialReports}_3']
    click element    xpath=//a[@id='${specialReports}_3']
    sleep   1s
    Download specialReports

Hr specialReports
    Wait Until Element Is Visible       xpath=//a[@id='${specialReports}_4']
    click element    xpath=//a[@id='${specialReports}_4']
    sleep   1s
    Download specialReports

Activity based specialReports
    Wait Until Element Is Visible       xpath=//a[@id='${specialReports}_5']
    click element    xpath=//a[@id='${specialReports}_5']
    sleep   1s
    Download specialReports


Download specialReports
# -- download special report
    wait until element is not visible   xpath=//app-budget-special-report/div[2]/div/nz-table/nz-spin/div/div/div/div/div/table/tbody/tr[1]/td[1]
    click element    xpath=//app-budget-special-report/div[1]/div/span/i[1]
    sleep   8s



#------------ Template Consolidation
Click template Consolidation
    click element    ${click_template_consolidate_xpath}
    sleep   2s


Download template Consolidation
# -- download special report
    click element    xpath=//app-budget-consolidated-treetable/div[1]/span[2]/span/nz-dropdown/span
    sleep    1s
    click element    //li[@class='ant-dropdown-menu-item']

#    wait until element is visible    xpath=//app-budget-consolidated-treetable/div[1]/span[2]/span/nz-dropdown
#    click element    xpath=//app-budget-consolidated-treetable/div[1]/span[2]/span/nz-dropdown
#    sleep   1s
#    click element    xpath=//i[@class='anticon anticon-file-excel']
#    sleep    1s

Click refresh template Consolidation
#-- refresh button
    click element    xpath=//app-budget-consolidated-treetable/div[1]/span[2]/span/i
    sleep   1s

Balance sheet Template Consolidation
#    Wait Until Element is not Visible      //app-budget-special-report/div[2]/nz-table
    click element    xpath=//a[@id='${template_consolidate}_1']
    sleep   1s


Profit Loss template Consolidation
    Wait Until Element Is Visible       xpath=//a[@id='${template_consolidate}_2']
    click element    xpath=//a[@id='${template_consolidate}_2']
    sleep   1s
    Download template Consolidation
    Click refresh template Consolidation
    sleep   1s

Capex template Consolidation
    Wait Until Element Is Visible       xpath=//a[@id='${template_consolidate}_3']
    click element    xpath=//a[@id='${template_consolidate}_3']
    sleep   1s
    Download template Consolidation
    Click refresh template Consolidation
    sleep   1s

Hr template Consolidation
    Wait Until Element Is Visible       xpath=//a[@id='${template_consolidate}_4']
    click element    xpath=//a[@id='${template_consolidate}_4']
    sleep   1s
    Download template Consolidation
    Click refresh template Consolidation
    sleep   1s


Activity Based template Consolidation
    Wait Until Element Is Visible       xpath=//a[@id='${template_consolidate}_5']
    click element    xpath=//a[@id='${template_consolidate}_5']
    sleep   1s
    Download template Consolidation
    Click refresh template Consolidation
    sleep   1s


Adhoc template Consolidation
    Wait Until Element Is Visible       xpath=//a[@id='${template_consolidate}_6']
    click element    xpath=//a[@id='${template_consolidate}_6']
    sleep   1s
    Download template Consolidation
    Click refresh template Consolidation
    sleep   1s

Pagination change
    click element    //div[@class='ant-select-selection__rendered']
    sleep   1s
    click element    //li[starts-with(@class,'ant-select-dropdown-menu-item')][last()]
    sleep    2s


#Confirmation dialogue for worksheet upload
#    ## ok button worksheet
#    wait until element is visible    xpath=//div[@id="cdk-overlay-3"]/div/div/div[2]/div/div/div[2]/button[2]
#    click button    xpath=//div[@id="cdk-overlay-3"]/div/div/div[2]/div/div/div[2]/button[2]
#    sleep    2s
#    ## cancel button click worksheet
##    wait until element is visible    xpath=//div[@id="cdk-overlay-3"]/div/div/div[2]/div/div/div[2]/button[1]
##    click button    xpath=//div[@id="cdk-overlay-3"]/div/div/div[2]/div/div/div[2]/button[1]
##    sleep    2s



# ===========  Reports
toggle Reports
    click element    xpath=//li[@id='${Reports}']//div
    sleep   3s


Balance sheet Reports
    click element    xpath=//a[@id='${Reports_consolidation}_1']
    sleep   1s
    sleep   1s

Click Dropdown Reports
    wait until element is visible    //app-budget-treetable-generic-report-consolidation/div[1]/span[2]/app-button-on-template/span/nz-dropdown/span/i
    click element    //app-budget-treetable-generic-report-consolidation/div[1]/span[2]/app-button-on-template/span/nz-dropdown/span/i
    sleep    3s
Click download Reports
    wait until element is visible    //li[@id='report_download_btn']
    click element    //li[@id='report_download_btn']
    sleep    1s

Refresh Reports
    click element    xpath=//i[@id='report_refresh_btn']
    sleep   1s


PL Reports
    click element    xpath=//a[@id='${Reports_consolidation}_2']
    sleep   1s
    Click Dropdown Reports
    Click download Reports
    Refresh Reports

Capex Reports
    click element    xpath=//a[@id='${Reports_consolidation}_3']
    sleep   1s
    Click Dropdown Reports
    Click download Reports
    Refresh Reports

Hr Reports
    click element    xpath=//a[@id='${Reports_consolidation}_4']
    sleep   1s
    Click Dropdown Reports
    Click download Reports
    Refresh Reports

Activity Based Reports
    click element    xpath=//a[@id='${Reports_consolidation}_5']
    sleep   1s
    Click Dropdown Reports
    Click download Reports
    Refresh Reports


Adhoc Reports
    click element    xpath=//a[@id='${Reports_consolidation}_6']
    sleep   1s
    Click Dropdown Reports
    Click download Reports
    Refresh Reports