*** Settings ***
Library    SeleniumLibrary

*** Variables ***


${username}         admin
${password}         admin
${rule}         fixedAsset

${invalid_username}     ashd
${invalid_password}     adfbfj
*** Keywords ***

Enter Username
    [Arguments]    ${username
    wait until element is visible    id=username
     input text      id=username     ${username}


Login user
    [Arguments]    ${username}=admin   ${password}=admin123  ${rule}=fixedAsset
    input text      id=username     ${username}
    password
    input text      id=password     ${password}
    press keys       name=submit     RETURN
    SLEEP    2s

Verify Invalid Login

    [Arguments]    ${invalid_username}=branch   ${invalid_password}=admin123
    input text      id=username     ${invalid_username}
    input text      id=password     ${invalid_password}
    press keys       name=submit     RETURN
