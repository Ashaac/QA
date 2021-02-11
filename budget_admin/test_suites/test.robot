*** Settings ***
Library     SeleniumLibrary
Library     RequestsLibrary
Library     DatabaseLibrary
Library     OperatingSystem

Resource        ../databases/capexdb.robot
#Resource    ../databases/cpx.sql


*** Variables ***
${base_url}     https://10.13.189.56:8443/budget
${cookies}       JSESSIONID=3388648A676CDB26EFAE26707056EA55
${DBName}       budgetdb
${DBUser}       application
${DBPass}       Application@123
${DBHost}       10.13.189.56
${DBPort}       3306


*** Keywords ***

Connection to Db
    Connect to Database     pymysql  ${DBName}  ${DBUser}  ${DBpass}    ${DBHost}  ${DBPort}


*** Test Cases ***
db test
    connection to db
    execute sql script    ${EXECDIR}/databases/cpx.sql
#    ${db_cpx_land_month2} =    query    select * from qa.qa_yearly_sum;
#    log to console    *****db_cpx_land_month2**${db_cpx_land_month2}********