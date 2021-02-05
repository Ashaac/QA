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
${close_button}                     //button[@id='close_btn']
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
validate inputs of users name
    click element    ${input_name}
    input text  ${input_name}    testing1a1
    sleep   1s
validate inputs of users username
    click element    ${input_username}
    input text  ${input_username}    testing1a1
    sleep   1s
validate inputs of users password
    click element    ${input_password}
    input text  ${input_password}    testing1a1
    sleep   1s
validate inputs of users email
    click element    ${input_email}
    input text  ${input_email}   testing1a1@gmail.com
    sleep   1s
verify click in input roles
#for user -5 , regional 7 , admin -4    , manager -6
    click element    ${click_role_list}
    click element   ${input_role}

verify click list and input region
    click element    ${region_list}
    click element   ${unclick_input_region_all}
    click element   ${unclick_input_region_all}
    click element   ${click_input_region_1}
    click element    ${click_outside_role}

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
    ...     ELSE    click element    ${close_button}
    sleep   2s






