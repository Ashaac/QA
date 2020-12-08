*** Settings ***
Library     SeleniumLibrary

*** Variables ***

${invalid_username}     ashd
${invalid_password}     adfbfj
${page_logo}    //body/main[1]/a[1]/span[1]

${url}    https://10.13.189.8:8443/cas/login?service=https%3A%2F%2F10.13.189.8%3A8443%2Fbudget%2Flogin%2Fcas



*** Keywords ***
Enter Username
    [Arguments]     ${username}
    wait until element is visible    id=username
    input text      id=username     ${username}

Logo
   element should be visible    ${page_logo}     message= Extensodata Logo is visible
   title should be    Login - CAS – Central Authentication Service

Enter Password
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
    Click Submit


Verify Login Page is successful
    Enter Username    admin
    Enter Password    admin123
    run keyword and continue on failure    Logo
    Click Submit
#    run keyword and continue on failure    Verify Invalid Login
