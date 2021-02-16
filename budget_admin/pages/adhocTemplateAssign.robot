*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${adhoc_click}      //a[@id='budget_adhoc']
${adhoc_assign_button}      //button[@class='ant-btn-primary ant-btn ant-btn-default']

${select_region_adhoc}       //app-assign-template/div/form/span[1]/nz-form-item[1]/nz-form-control/div/span/app-region-branch/div/nz-select[1]/div/div



${unselect_region1_adhoc}       //li[starts-with(@class,'ant-select-dropdown-menu-item') and contains(text(),'Region 1')]
${click_unclick_region2_adhoc}       //li[starts-with(@class,'ant-select-dropdown-menu-item') and contains(text(),'Region 2')]
${background_click}         //div[@class='cdk-overlay-backdrop nz-overlay-transparent-backdrop cdk-overlay-backdrop-showing']

${dropdown_branch}       //app-assign-template/div/form/span[1]/nz-form-item[1]/nz-form-control/div/span/app-region-branch/div/nz-select[2]/div/span/i
${count_branches}       //div[contains(@class, "ant-select-dropdown")]/descendant::ul/li


${open_calender_adhoc}      //app-assign-template/div/form/span[1]/nz-form-item[2]/nz-form-control/div/span/div/nz-range-picker/nz-picker/span/span
${click_datepicker_adhoc}     //span[@class='ant-calendar-picker-input ant-input ng-star-inserted']
${click_left_month_datepicker}     //date-range-popup/div/div/div/div/div[1]/div/inner-popup/calendar-header/div/div/span/a[@title='Choose a month']
${year_datepicker}      //div[@class='ant-calendar-range-part ant-calendar-range-left ng-star-inserted']//div//inner-popup[@class='ng-star-inserted']//calendar-header//div[@class='ant-calendar-header']//div//a[@title='Choose a year'][normalize='2021']



${click_upto_month_datepicker}  //div[@id="cdk-overlay-4"]/div/date-range-popup/div/div/div/div/div[3]/div/inner-popup/calendar-header/div/div/span/a[1]

${year_upto_datepicker}     //div[@class='ant-calendar-range-part ant-calendar-range-right ng-star-inserted']//div//inner-popup[@class='ng-star-inserted']//calendar-header//div[@class='ant-calendar-header']//div//a[@title='Choose a year']


${close_adhoc_button}   //button[@class='ant-btn ng-star-inserted ant-btn-default']

${click_reset_button}   //app-assign-template/div/form/span[1]/nz-form-item[3]/button[2]
${click_save_Adhoc_button}  //app-assign-template/div/form/span[1]/nz-form-item[3]/button[1]
${cancel_button_Adhoc}  //div[@class='ant-popover-buttons']/button[1]
${ok_Adhoc_button}  //div[@class='ant-popover-buttons']/button[2]

${notify}   //div[@class='ant-message-notice-content']
*** Keywords ***


click to adhoc templates
    wait until element is visible    ${adhoc_click}
    click element    ${adhoc_click}
    sleep    2s

click on assign adhoc
    wait until element is visible    ${adhoc_assign_button}
    click element    ${adhoc_assign_button}
    sleep    1s

click assign adhoc region
    wait until element is visible    ${select_region_adhoc}
    click element    ${select_region_adhoc}
    #select region
    sleep    2s

#select region on adhoc
##     Alternative option
#    #reg 1
#    click element    ${unselect_region1_adhoc}
#    #reg 2
#    click element    ${click_unclick_region2_adhoc}
#    sleep    2s
#    #reg 2


select region on adhoc
    [Arguments]    ${regions}
#    unselect all regions
    click element    ${unselect_region1_adhoc}
    click element    ${click_unclick_region2_adhoc}
#select region
    sleep    1s
    click element    //li[starts-with(@class,'ant-select-dropdown-menu-item') and contains(text(),'${regions}')]
    sleep   1s
    click element    ${background_click}
    sleep   1s

select branch on adhoc except one
    [Arguments]    ${Branch}
    # select branch
    wait until element is visible    ${dropdown_branch}
    sleep    4s
    click element    ${dropdown_branch}
        ${length}=    get element count    ${count_branches}
    log to console      length=${length}
    FOR    ${index}    IN RANGE   4    ${length}+1
        wait until element is visible    //div[contains(@class, "ant-select-dropdown")]/descendant::ul/li[${index}]
        ${branch_name}=    Get Text    //div[contains(@class, "ant-select-dropdown")]/descendant::ul/li[${index}]
        ${trimmed_branchname}=    Replace String     ${branch_name}    ${SPACE}        ${EMPTY}
        run keyword unless    "${trimmed_branchname}"=="${Branch}"    click element    //div[contains(@class, "ant-select-dropdown")]/descendant::ul/li[${index}]
        sleep    0.5s
    END
    sleep    1s
    click element    ${background_click}

open calendar adhoc
    click element    ${open_calender_adhoc}
year click
   [Arguments]    ${containerClass}
    click element       //div[contains(@class, "${containerClass}")]/descendant::a[@title='Choose a year'][normalize-space()='2021']
    sleep    1s

month click
   [Arguments]    ${month}     ${containerClass}
   click element    //div[contains(@class, "${containerClass}")]/descendant::a[@title='Choose a month']
   click element    //div[contains(@class, "${containerClass}")]/descendant::a[normalize-space()='${month}']
   sleep    1s

date click
    [Arguments]    ${date}


Year filter calendra year selection change untill year is found
   [Arguments]    ${year}    ${containerClass}
    FOR    ${index}    IN RANGE    0    10
        ${year_exist_status}=    year filter selection    ${year}    ${containerClass}
        exit for loop if    ${year_exist_status}=="True"
        click element    //div[contains(@class, "${containerClass}")]/descendant::a[contains(@class, "ant-calendar-year-panel-prev-decade-btn")]
        #log to console    ====year claendra up clicked ${index} time====
    END
    click element        //div[contains(@class, "${containerClass}")]/descendant::a[@class="ant-calendar-year-panel-year"][normalize-space()='${year}']


year filter selection
    [Arguments]    ${year}    ${containerClass}
#    year filter     2011        Jan         9
    @{year_list}=    get webelements    //div[contains(@class, "${containerClass}")]/descendant::a[contains(@class, "ant-calendar-year-panel-year")]
    ${length_of_year_value_in_calendra_list} =    get length  ${year_list}
    ${length_of_year_value_in_calendra_list}=    evaluate    ${length_of_year_value_in_calendra_list} - 1
    ${status}=  set variable        "False"
    FOR   ${index}      IN RANGE  1    ${length_of_year_value_in_calendra_list}
        ${text}=    get text    ${year_list[${index}]}
        #log to console    ========== ${text}=========
        ${status}=  set variable if     ${text}==${year}     "True"
        ...    "False"
        exit for loop if    ${text}==${year}
    END
   [Return]    ${status}

select from date
    [Arguments]     ${year}    ${month}    ${day}
    run keyword and continue on failure    month click      ${month}    ant-calendar-range-left
    run keyword and continue on failure    year click    ant-calendar-range-left
    run keyword and continue on failure    Year filter calendra year selection change untill year is found    ${year}    ant-calendar-range-left
    run keyword and continue on failure    click day    ${day}  ant-calendar-range-left


select to date
    [Arguments]     ${year}    ${month}     ${day}
    run keyword and continue on failure    month click      ${month}    ant-calendar-range-right
    run keyword and continue on failure    year click    ant-calendar-range-right
    run keyword and continue on failure    Year filter calendra year selection change untill year is found    ${year}    ant-calendar-range-right
    run keyword and continue on failure    click day     ${day}  ant-calendar-range-right
    sleep    1.5s

click day
    [Arguments]    ${day}  ${containerClass}
    click element        //div[contains(@class, "${containerClass}")]//descendant::div[@class='ant-calendar-date ng-star-inserted'][normalize-space()='${day}']

Click Adhoc reset button
    click button    ${click_reset_button}

Click Adhoc save button
    ${count}=   get element count    ${click_save_Adhoc_button}
    RUN KEYWORD IF      ${count}>0      click button    ${click_save_Adhoc_button}
    ...   ELSE  Click Close Adhoc button
    sleep    1s

Click Assign Adhoc Cancel button
    click element   ${cancel_button_Adhoc}
    sleep    1s

Click Assign Adhoc Ok button
    wait until element is visible    ${ok_Adhoc_button}
    click element    ${ok_Adhoc_button}
    wait until element is not visible      ${notify}
    sleep    1s

Click Close Adhoc button
    click element    ${close_adhoc_button}
    sleep    1s

open category adhoc side dropdown
     [Arguments]    ${index}
     click element    //app-assign-template/div/form/span[2]/nz-form-item/nz-form-control/div/span/nz-tree/ul/nz-tree-node[${index}]/li/span[1]
     click element    //app-assign-template/div/form/span[2]/nz-form-item/nz-form-control/div/span/nz-tree/ul/nz-tree-node[${index}]/li//ul/nz-tree-node[1]/li/span[2]

select adhoc category
    @{randomIndex} =   create list      1
    FOR   ${item}    IN  @{randomIndex}
#        log to console    ${item}
        sleep    1s
        click element    //app-assign-template/div/form/span[2]/nz-form-item/nz-form-control/div/span/nz-tree/ul/nz-tree-node[${item}]/li/span[2]/span
        ${dropdowns}=  get element count    //app-assign-template/div/form/span[2]/nz-form-item/nz-form-control/div/span/nz-tree/ul/nz-tree-node[${item}]/li[contains(@class, 'ant-tree-treenode-switcher-close')]
        run keyword if    ${dropdowns}>0       open category adhoc side dropdown   ${item}
        sleep    1s
    END
    sleep    1s
