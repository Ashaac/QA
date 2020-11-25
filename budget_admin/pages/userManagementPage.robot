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
${click_role_list}               //mat-select[@id='mat-select-1']
${input_role}                   //mat-option[@id='role_2']
${region_list}                  //mat-select[@id='mat-select-2']
${input_region}                 //mat-option[@id='region_0']
${backdrop_xpath}                //html/body/div[1]/div[3]
${click_outside_role}            //div[@class='cdk-overlay-backdrop cdk-overlay-transparent-backdrop cdk-overlay-backdrop-showing']
${click_branch_list}                //mat-select[@id='mat-select-3']
${click_branch}                     //mat-option[@id='branch_1']
${add_user_click_button_xpath}      //button[@id='add_user_btn']
${notify_xpath}                     //nz-notification/div/div/div/div/div[1]
${close_button}                     //button[@id='close_btn']
*** Keywords ***

Verify User Add
    Toggle User Management
    Click Users
    Refresh User Button
    Click Add User
    run keyword and continue on failure    Click User Add Button

Toggle User Management
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
#-- inputs of users name
    click element    ${input_name}
    input text  ${input_name}    testing1a
    sleep   1s
#-- inputs of users username
    click element    ${input_username}
    input text  ${input_username}    testing1a
    sleep   1s
#-- inputs of users password
    click element    ${input_password}
    input text  ${input_password}    testing1a
    sleep   1s
#-- inputs of users email
    click element    ${input_email}
    input text  ${input_email}   testing1a@gmail.com
    sleep   1s
#-- input role for user -5 , regional 7 , admin -4    , manager -6
    click element    ${click_role_list}
    click element   ${input_role}
#-- list region
    click element    ${region_list}
    click element   ${input_region}
    click element    ${click_outside_role}
#-- inputs of branch
    click element    ${click_branch_list}
    click element    ${click_branch}
    sleep   1s
    click element    ${click_outside_role}
    sleep   2s
# -- Add user button
Click User Add Button
    wait until element is visible    ${add_user_click_button_xpath}
    click button    ${add_user_click_button_xpath}
    wait until element is visible    ${notify_xpath}
    sleep   3s
    ${Result} =   Get Element Count   ${close_button}
 #   log to console    ${Result}
    RUN KEYWORD IF    ${Result}>0   click element    ${close_button}
    sleep    1s

