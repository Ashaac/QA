*** Settings ***
Library     SeleniumLibrary

*** Variables ***

${invalid_username}     ashd
${invalid_password}     adfbfj
${page_logo}            //body/main[1]/a[1]/span[1]

#${url}                  https://10.13.189.56:8443/cas/login?service=https%3A%2F%2F10.13.189.56%3A8443%2Fbudget%2Flogin%2Fcas
${url}                 https://10.13.189.8:8443/cas/login?service=https%3A%2F%2F10.13.189.8%3A8443%2Fbudget%2Flogin%2Fcas

${header_text}          id=servicedesc
${message_invalid_password}     //*[@id="fm1"]/div/span

*** Keywords ***
Enter valid Username
    [Arguments]     ${username}
    wait until element is visible    id=username
    input text      id=username     ${username}

Title should be login
#   element should be visible    ${page_logo}     message= Extensodata Logo is visible
   title should be    Login - CAS – Central Authentication Service

Enter valid Password
    [Arguments]    ${password}
    wait until element is visible    id=password
    input text      id=password     ${password}

Click Submit
    press keys       name=submit     RETURN
    sleep      2s


Enter Invalid Username
    [Arguments]     ${invalid_username}
    wait until element is visible    id=username
    input text      id=username     ${invalid_username}

Enter Invalid Password
    [Arguments]    ${invalid_password}
    wait until element is visible    id=password
    input text      id=password     ${invalid_password}


Open Budget Application
    open browser    ${url}    Chrome     add_argument("--disable-popup-blocking"); add_argument("--ignore-certificate-errors") error
    MAXIMIZE BROWSER WINDOW
    click button    details-button
    click element    proceed-link
    sleep    2S


Verify Invalid Login
    Enter Invalid Username  asds
    Enter Invalid Password  sdfds
    run keyword and continue on failure    title should be login
    run keyword and continue on failure    page should contain header text
    Click Submit
    Message after invalid username or password

Verify Login Page is successful
    run keyword and continue on failure    title should be login
    run keyword and continue on failure    page should contain header text
    Enter valid Username    admin
    Enter valid Password    admin123
    Click Submit


page should contain header text
    run keyword and continue on failure    element should be visible    ${header_text}     message=Extenso Data Budget Operation Secured Login

Message after invalid username or password
    run keyword and continue on failure   element should be visible    ${message_invalid_password}     message=Your account is not recognized and cannot login at this time.

