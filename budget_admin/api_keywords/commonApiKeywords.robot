*** Settings ***
Library     SeleniumLibrary
Library     RequestsLibrary
Library     DatabaseLibrary
Library     OperatingSystem

Resource        ../databases/capexdb.robot



*** Variables ***
${base_url}     https://10.13.189.56:8443/budget
#${cookies}              JSESSIONID=FFEAB896F77FB64B802A6CA0AD195CD3
${DBName}       budgetdb
${DBUser}       application
${DBPass}       Application@123
${DBHost}       10.13.189.56
${DBPort}       3306

#${cookies}=    get cookies
##        set global variable    ${cookies}   binaacd
#set global variable   ${cookies}    ${cookies}
#       # log to console    ${cookies}



*** Keywords ***

Connection to Db
    Connect to Database     pymysql  ${DBName}  ${DBUser}  ${DBpass}    ${DBHost}  ${DBPort}

#Compare capex Land data
#    create session    sessionstest     ${base_url}    verify=FALSE
#    &{headers}=  Create Dictionary      Cookie=JSESSIONID=FFEAB896F77FB64B802A6CA0AD195CD3
#    ${response}=    get request    sessionstest    /api/budgets/budgetbyBranch/999/1   data=None    headers=${headers}
#    ${responseJSON}=    to json  ${response.text}
#    [Return]    ${responseJSON}

Compare capex Land data
    create session    sessionstest     ${base_url}    verify=FALSE
    &{headers}=  Create Dictionary      Cookie=${cookies}
    ${response}=    get request    sessionstest    /api/budgets/budgetbyBranch/999/1   data=None    headers=${headers}
    ${responseJSON}=    to json  ${response.text}
    [Return]    ${responseJSON}


##    &{headers}=  Create Dictionary      Cookie=${cookies}
Compare capex Land month1
    ${capex}=   Compare capex Land data
    ${land_api_test}=   Set Variable    ${capex[2]['month_1']}
    ${land_api}=   CONVERT TO INTEGER    ${land_api_test}
    log to console    ${land_api}
    Connection to Db
    Test cpx land db   ${land_api}

Capex Land month2
    ${capex}=   Compare capex Land data
    ${land_api_test_month2}=   Set Variable    ${capex[2]['month_2']}
    ${land_api_month2}=   CONVERT TO INTEGER    ${land_api_test_month2}
    log to console    ${land_api_month2}
    Connection to Db
    Month2 cpx  ${land_api_month2}

#Compare capex Land data
#    create session    sessionstest     ${base_url}    verify=FALSE
#    &{headers}=  Create Dictionary      Cookie=JSESSIONID=CAFA84C3F3C8A6791443BBF895B51E27
#    ${response}=    get request    sessionstest    /api/budgets/budgetbyBranch/999/1   data=None    headers=${headers}
#    ${capex}=   to json     ${response.text}
#    ${land_api_test}=   Set Variable    ${capex[2]['month_1']}
#    ${land_api}=   CONVERT TO INTEGER    ${land_api_test}
#    log to console    ${land_api}
#    Connection to Db
#    Test cpx land db   ${land_api}



#    log to console    =======${EXECDIR}/databases/cpx.sql============
#    execute sql script    ${EXECDIR}/databases/cpx.sql



