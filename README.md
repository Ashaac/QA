# Budget Application Test
Test of Budget Application Admin <BR>
This application allows to estimate and prepare budget of bank admin side. 

## Table of Contents
1. [Pre-requisites](#preReq)
2. [Requirements and Installation](#req)
3. [Reporting](#Report)
4. [Test suites and their test cases](#testsutes&testcase)


## Pre-requisites <a name="preReq"></a>
To Run and Contribute in the project,
You need to install git( [How to install git??](https://www.stanleyulili.com/git/how-to-install-git-bash-on-windows/)) and clone this project in your local computer.
```
git clone https://github.com/ashaac7/Budget-Automation.git
```
1. Need to install  Selenium and  robotframework <br>
```
pip install robotframework
pip install selenium
```
## Requirements and Installation <a name="req"></a>
* Install python. Follow the steps to [install python and setup as environment variable](https://www.liquidweb.com/kb/install-pip-windows/).
* Install requirements using Pip command below:
```
pip install -r requirements.txt
```
* download drivers (chrome) and set environment variable. Follow the steps provided in the link.
    * [chrome driver setup steps](https://zwbetz.com/download-chromedriver-binary-and-add-to-your-path-for-automated-functional-testing/)
 and Pycharm IDE. You can follow [installation pycharm ide steps](https://www.guru99.com/how-to-install-python.html).
* Also see Requirement present in [requirement.txt](requirement.txt) file 
## Run project <a name="run project"></a> 
To run the test suites, Navigate to `Budget Application Login` and run the below command as mentioned:

By default, tests are run on Chrome browser (by default fixedAssets rule is run):
```
robot test_suites\*.robot
```
To run the specific rule like `Fixed Assets` or `Net profit`
```
robot --variable rule:fixedAssets  test_suites\*.robot
robot --variable rule:Netprofit test_suites\*.robot
```
To run and send email to users change in the section 
```
sender_address = sender@gmail.com'
sender_pass = 'passwordxxx'

message['To'] = "xyz@extensodata.com','abc@gmail.com"
```
use command
```
$ ./run.bat
```

For upload in worksheet
```
Need to place the worksheet of templates like: capex,Activity base ,BalanceSheet, Profitloss 
in location and place that location in  test case named:
Verify that Upload Worksheet button is working     [location]//ab.xlsx - for activity based | [location]//cpx.xlsx - for capex
 
```
## Reporting<a name="report"></a>
After we run test result can be seen in html file in chrome browser.
  
## Test suites and their test cases <a name="testsutes&testcase"></a>
1. Budget Application for admin:
    <p>This test suite is created to verify of Budget application for admin.</p>
    TestCases:
  *  go through [Test cases](https://scrum.f1soft.com/browse/EV-382)
    