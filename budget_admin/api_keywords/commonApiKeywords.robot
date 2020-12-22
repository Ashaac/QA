*** Settings ***
Library     SeleniumLibrary
Library     RequestsLibrary
Library     DatabaseLibrary
Library     OperatingSystem

Resource        ../databases/capexdb.robot

*** Variables ***
${base_url}     https://10.13.189.8:8443/budget
${cookies}              JSESSIONID=E4A1F72F4CA58230FD2415E52739CCAB
${DBName}       budgetdb
${DBUser}       application
${DBPass}       Application@123
${DBHost}       10.13.189.8
${DBPort}       3306


*** Keywords ***

Connection to Db
    Connect to Database     pymysql  ${DBName}  ${DBUser}  ${DBpass}    ${DBHost}  ${DBPort}


Compare capex Land data
    create session    sessionstest     ${base_url}    verify=FALSE
    &{headers}=  Create Dictionary      Cookie=JSESSIONID=4CE0324E4F0D0E24C8A04E67A0DE2FD0
    ${response}=    get request    sessionstest    /api/budgets/budgetbyBranch/999/1   data=None    headers=${headers}
    ${capex}=   to json     ${response.text}
    ${land_api_test}=   Set Variable    ${capex[2]['month_1']}
    ${land_api}=   CONVERT TO INTEGER    ${land_api_test}
    log to console    ${land_api}
    Connection to Db
    Test cpx land db   ${land_api}
