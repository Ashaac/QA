*** Settings ***
Library    SeleniumLibrary


*** Keywords ***

click to adhoc templates
    wait until element is visible    //a[@id='budget_adhoc']
    click element    //a[@id='budget_adhoc']

click on assign adhoc
    wait until element is visible    //button[@class='ant-btn-primary ant-btn ant-btn-default']
    click element    //button[@class='ant-btn-primary ant-btn ant-btn-default']
# /html/body/app-root/div/app-root/nz-layout/nz-layout/nz-content/div/app-template/div/span/button[1]

click assign adhoc region
    wait until element is visible    //app-assign-template/div/form/span[1]/nz-form-item[1]/nz-form-control/div/span/app-region-branch/div/nz-select[1]/div/div
    #select region
    click element    //app-assign-template/div/form/span[1]/nz-form-item[1]/nz-form-control/div/span/app-region-branch/div/nz-select[1]/div/div
    sleep    2s
    # Alternative option
#    click element    //div[@id="cdk-overlay-3"]/div/div/ul/li[1]
#    click element    //div[@id="cdk-overlay-3"]/div/div/ul/li[2]
#    sleep    2s
#    input text    xpath=//app-assign-template/div/form/span[1]/nz-form-item[1]/nz-form-control/div/span/app-region-branch/div/nz-select[1]/div/div    region 2

    # -- error
    input text    xpath=//div[@id="cdk-overlay-2"]/nz-modal/div/div[2]/div/div/div[2]/app-assign-template/div/form/span[1]/nz-form-item[1]/nz-form-control/div/span/app-region-branch/div/nz-select[1]/div/div/div    region 2
    press keys    //div[@id="cdk-overlay-2"]    BACKSPACE

#    # select branch
#    click element   //div[@id="cdk-overlay-2"]/nz-modal/div/div[2]/div/div/div[2]/app-assign-template/div/form/span[1]/nz-form-item[1]/nz-form-control/div/span/app-region-branch/div/nz-select[2]/div
#    # date picker of adhoc
#    click element    //span[@class='ant-calendar-picker-input ant-input ng-star-inserted']
#    click element    //div[@id="cdk-overlay-3"]/div/date-range-popup/div/div/div/div/div[1]/div/inner-popup/div/date-table/table/tbody/tr[1]/td[6]/div
#    click element    //div[@id="cdk-overlay-3"]/div/date-range-popup/div/div/div/div/div[3]/div/inner-popup/div/date-table/table/tbody/tr[1]/td[7]/div
