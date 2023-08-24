*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Test Cases ***
ScreenShotTest
    [Documentation]     網頁畫面截圖
    open browser        ${url}      ${browser}
    maximize browser window
    sleep    10
    wait until page contains    OrangeHRM
    input text    name:username       Admin
    input text    name:password       admin123

    #capture element screenshot      xpath://*[@id="app"]/div[1]/div/div[1]/div/div[1]/img     C:/Users/user/PycharmProjects/automation/logo.png
    #capture page screenshot         C:/Users/user/PycharmProjects/automation/LoginTC.png

    capture element screenshot      xpath://*[@id="app"]/div[1]/div/div[1]/div/div[1]/img      logo.png
    capture page screenshot         LoginTC.png

*** Keywords ***





