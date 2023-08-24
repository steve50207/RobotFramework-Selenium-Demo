*** Settings ***
Library         SeleniumLibrary                     # python package
Variables       ../PageObjects/locators.py          # variables is .py file

*** Keywords ***
Open my Browser
    [Documentation]     開啟瀏覽器
    [Arguments]     ${Siteurl}     ${Browser}     ${Options}
    open browser    ${Siteurl}     ${Browser}     ${Options}
    maximize browser window

Enter Email
    [Documentation]     輸入信箱
    [Arguments]     ${Email}
    input text      ${txt_login_Email}      ${Email}

Enter Password
    [Documentation]     輸入密碼
    [Arguments]     ${Password}
    input text      ${txt_login_Password}   ${Password}

Click LogIn
   [Documentation]     點擊登入按鈕
   click button    ${btn_logIn}

Verify Successful Login
    [Documentation]     驗證網頁登入成功
    page should contain    Dashboard

Close my Browser
    [Documentation]     關閉瀏覽器
    sleep    2
    close all browsers