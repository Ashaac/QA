*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${toggle_usermanagement_xpath}   //li[@id='user']//div
${click_users_xpath}             //li//a[@id='user_info']
${refresh_button_xpath}          //app-userdashboard/div/div/div/div/div[2]/div[1]/span/button[2]
${add_button}                    //app-userdashboard/div/div/div/div/div[2]/div[1]/span/button[1]
${input_name}                    //input[@id='name']
${input_username}                //input[@id='username']
${input_password}                //input[@id='password']
${input_email}                   //input[@id='email']
${click_role_list}               //mat-select[@id='mat-select-0']
${input_role}                   //mat-option[@id='role_2']
${region_list}                  //mat-select[@id='mat-select-1']
${unclick_input_region_all}       //mat-option[@id='region_0']
${click_input_region_1}         //mat-option[@id='region_0']
${backdrop_xpath}                //html/body/div[1]/div[3]
${click_outside_role}            //div[@class='cdk-overlay-backdrop cdk-overlay-transparent-backdrop cdk-overlay-backdrop-showing']

${click_branch_list}                //mat-select[@id='mat-select-2']
${click_branch}                     //perfect-scrollbar//mat-option[@id='branch_1']

${add_user_click_button_xpath}      //button[@id='add_user_btn']
${notify_xpath}                     //nz-notification/div/div/div/div/div[1]
${close_button}                     //button[@id='close_btn']/span

${click_regional_list}        //mat-select[@id='mat-select-5']


*** Keywords ***
Click on User Management
    wait until element is visible   ${toggle_usermanagement_xpath}
    click element    ${toggle_usermanagement_xpath}
    sleep    3s


Click Users
# --  click users
    wait until element is visible    ${click_users_xpath}
    click element    ${click_users_xpath}
    sleep   3s

Refresh User Button
    wait until element is visible    ${refresh_button_xpath}
    click element    ${refresh_button_xpath}
    sleep   1s

Click Add User
# -- add button
    wait until element is visible    ${add_button}
    click element    ${add_button}
    sleep    1s

validate inputs of name
    [Arguments]    ${user_name}
    click element    ${input_name}
    input text  ${input_name}   ${user_name}
    sleep   1s


validate inputs of users username
    [Arguments]    ${username}
    click element    ${input_username}
    input text  ${input_username}    ${username}
    sleep   1s
validate inputs of users password
    [Arguments]    ${password}
    click element    ${input_password}
    input text  ${input_password}      ${password}
    sleep   1s
validate inputs of users email
    [Arguments]    ${enter_email}
    click element    ${input_email}
    input text  ${input_email}   ${enter_email}
    sleep   1s
verify click in input roles
#for user -5 , regional 7 , admin -4    , manager -6
    sleep    1s
    click element    ${click_role_list}
    click element   ${input_role}
    sleep    1s

#verify click list and input region
#    click element    ${region_list}
#    click element   ${unclick_input_region_all}
#    click element   ${unclick_input_region_all}
#    click element   ${click_input_region_1}
#    click element    ${click_outside_role}

#-- inputs of branch
verify that click in branch list
    click element    ${click_branch_list}
    click element    ${click_branch}
    sleep   1s
    click element    ${click_outside_role}
    sleep   2s

# -- Add user button
Click User Add Button
    wait until element is visible    ${add_user_click_button_xpath}
    click button    ${add_user_click_button_xpath}
    ${count_notify}=     get element count    ${notify_xpath}
    run keyword if    ${count_notify}>0         wait until element is not visible    ${notify_xpath}
    ...     ELSE    Click close user add button
    sleep   2s

Click close user add button
    click element    ${close_button}

Yes delete user
#-- confirm delete user
    sleep    2s
    WAIT UNTIL ELEMENT IS VISIBLE    xpath=//html/body/div[2]/div[2]/button[1]
    click element   xpath=//html/body/div[2]/div[2]/button[1]
    sleep   2s
    click element   xpath=//html/body/div[2]/div[2]/button[1]
    sleep    2s

No delete user
#-- cancel delete user
    sleep    2s
    WAIT UNTIL ELEMENT IS VISIBLE    xpath=//html/body/div[2]/div[2]/button[2]
    click element   xpath=//html/body/div[2]/div[2]/button[2]
    sleep   2s


Click Edit user Button
    wait until element is visible    //button[@id="edit_user_btn"]
    click button     //button[@id="edit_user_btn"]
    ${count_notify}=     get element count    ${notify_xpath}
    run keyword if    ${count_notify}>0         wait until element is not visible    ${notify_xpath}
    ...     ELSE    Click close user add button
    sleep   2s


verify click list and input region
    [Arguments]    ${region_name}
    click element    ${region_list}
    ${id_region}=   defination of region  ${region_name}
    click element   //mat-option[@id='${id_region}']
    click element   ${unclick_input_region_all}
    click element   ${click_input_region_1}
    click element    ${click_outside_role}

defination of region
    [Arguments]  ${region}
    ${region_name} =  Set Variable If
            ...  "${region}"=="Region 1"  region_0
            ...  "${region}"=="Region 2"  region_1
            ...  "${region}"=="Region 3"  region_2
            ...  "${region}"=="Region 4"  region_3
            ...  "${region}"=="Region 5"  region_4
            ...  "${region}"=="Region 6"  region_5
            ...  "${region}"=="Region 7"  region_6
            ...  "${region}"=="Region 8"  region_7
            ...  "${region}"=="Region 9"  region_8
            ...  "${region}"=="Jhapa Region"   region_9
            ...  "${region}"=="Kathmandu Valley Region"  region_10
            ...  "${region}"=="Pokhara Valley Region"   region_11
            ...  "${region}"=="Unknown"   region_12
    [Return]    ${region_name}


verify that edit click in branch list
    click element    //app-adduser/div/div/mat-card/mat-card-content/form/div[6]/mat-form-field/div/div[1]/div/mat-select[@placeholder="Branch"]
    click element    //perfect-scrollbar//mat-option[@id='branch_0']
    sleep   1s
    click element    ${click_outside_role}
    sleep   2s




verify edit user click list and input region
    [Arguments]    ${region_name}
    click element    //app-adduser/div/div/mat-card/mat-card-content/form/div[5]/mat-form-field/div/div[1]/div/mat-select[@placeholder="Region"]
    ${id_region}=   defination of region  ${region_name}
    click element   //mat-option[@id='${id_region}']
    click element   ${unclick_input_region_all}
    click element   ${click_input_region_1}
    sleep    1s
    click element    ${click_outside_role}
    sleep    1s

#-- edit element
click edit button from user page
    wait until element is visible    //tr[starts-with(@class,'ant-table-row ng-star-inserted')][last()]//td[8]/button[1]
    click button     //tr[starts-with(@class,'ant-table-row ng-star-inserted')][last()]//td[8]/button[1]

click delete user button
    click button    //tr[starts-with(@class,'ant-table-row ng-star-inserted')][last()]//td[8]/button[2]