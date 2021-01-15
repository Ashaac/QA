*** Settings ***
Library    SeleniumLibrary


Resource     ../pages/templateButtonPage.robot
*** Variables ***
${menu_name_xpath}                      prebudget
${click_outside_cell_xpath}             //table[@id='template_tree_grid_3_gridcontrol_content_table']//tbody
${count_of_capex_particulars_xpath}     //table[@id='template_tree_grid_3_gridcontrol_content_table']//tbody//tr
*** Keywords ***

Click Capex Prebudget Sidebar
    Wait Until Element Is Visible       xpath=//a[@id='${menu_name_xpath}_3']    timeout=10s
    click element    xpath=//a[@id='${menu_name_xpath}_3']
    sleep   2s

Verify to input values in Capex unit price prebudget
    ${count} =    get element count    ${count_of_capex_particulars_xpath}
#    log to console    ===================${count}===========================
    FOR    ${index}    IN RANGE    2    ${count}
        double click element    xpath=//table[@id='template_tree_grid_3_gridcontrol_content_table']//tbody//tr[${index}]/td[23]
        sleep       2s
        press keys    //table[@id='template_tree_grid_3_gridcontrol_content_table']//tbody//tr[${index}]/td[23]//span    CTRL+a
        press keys    //table[@id='template_tree_grid_3_gridcontrol_content_table']//tbody//tr[${index}]/td[23]//span    ESCAPE
        input text    //budget-treetable-capex/div[2]/ejs-treegrid/div[2]/div[5]/div/table/tbody/tr[${index}]/td[23]/form/span/input     1000
        sleep   1s
        click element       ${click_outside_cell_xpath}
        sleep    2s
    END




