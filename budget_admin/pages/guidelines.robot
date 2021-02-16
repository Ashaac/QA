*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${backdrop_click}       document.getElementsByClassName('cdk-overlay-backdrop')[0].click()

*** Keywords ***
Click guidelines
    click element    //a[@id="budget_guideline"]
    sleep    1s
    wait until element is visible        //mat-card[@class="card card-raised mat-elevation-z9 mat-card"]
Add guideline
    click button        //app-guideline/div/mat-card/mat-card-content/div/button[1]
#    click button        css=app-root.ng-star-inserted:nth-child(2) nz-layout.app-layout.ant-layout.ant-layout-has-sider nz-layout.ant-layout nz-content.ant-layout-content div.inner-content app-guideline.ng-star-inserted:nth-child(2) div:nth-child(1) mat-card.card.card-raised.mat-elevation-z9.mat-card mat-card-content.row.mat-card-content div:nth-child(1) > button.mat-raised-button.mat-button-base.mat-accent:nth-child(4)
    sleep    1s

#Input name and value
#    input text    //mat-dialog-container/app-guideline-parent/form/mat-card/div/mat-form-field/div/div[1]/div/label/input    test12
#    input text    //input[@id="mat-input-99"][@placeholder="Name"]      t1
#    input text    //input[@id="mat-input-100"][@placeholder="Value"]     12
#    sleep    1s

Input name and value
    input text    //mat-dialog-container/app-guideline-parent/form/mat-card/div/mat-form-field/div/div[1]/div/label/input    test12
    input text    //mat-card/mat-card-content/div/mat-form-field[1]/div/div[1]/div/label/input[@placeholder="Name"][1]      t1
    input text    //mat-card/mat-card-content/div[1]/mat-form-field[2]/div/div[1]/div/label/input[@placeholder="Value"][1]     12
    sleep    1s

click add items in guidelines
    #add button
    click button    //mat-dialog-container/app-guideline-parent/form/mat-card/mat-card-content/button
    input text    //mat-card/mat-card-content/div[2]/mat-form-field[1]/div/div[1]/div/label/input[@placeholder="Name"][1]     t2
    input text    //mat-card/mat-card-content/div[2]/mat-form-field[2]/div/div[1]/div/label/input[@placeholder="Value"][1]     10
    sleep    1s
click close guidelines button
    sleep    2s
    click button    //mat-dialog-container/app-guideline-parent/form/mat-card/div/button[2]

click save guidelines button
    sleep    2s
    wait until element is visible    //div[contains(@class, "cdk-overlay-container")]/descendant::app-guideline-parent/form/mat-card/div[1]/button[1]
    #log to console    clicking first time
    click element    //div[contains(@class, "cdk-overlay-container")]/descendant::app-guideline-parent/form/mat-card/div[1]/button[1]
    ${c}=   get element count    //div[contains(@class, "ant-notification-notice-message")]
    RUN KEYWORD IF  ${c}>0  wait until element is not visible    xpath=//div[contains(@class, "ant-notification-notice-message")]   timeout=5s
    ...     ELSE    click close guidelines button
    #wait until page does not contain      xpath=//div[contains(@class, "ant-notification-notice-message")]    timeout=10s
    sleep    3s
#    execute javascript      document.getElementsByClassName('cdk-overlay-container')[0].getElementsByTagName('app-guideline-parent')[0].getElementsByTagName('mat-card')[0].getElementsByTagName('button')[0].click()
#    click close guidelines button
    #log to console    clicking again


