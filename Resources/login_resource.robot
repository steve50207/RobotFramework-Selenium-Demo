*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${LOGIN URL}        https://admin-demo.nopcommerce.com/
${BROWSER}          chrome

*** Keywords ***
Open My Browser
    [Documentation]     開啟瀏覽器
    open browser    ${LOGIN URL}    ${BROWSER}
    maximize browser window
    sleep    2

Close Browsers
    [Documentation]     關閉瀏覽器
    close all browsers

Open Login Page
    [Documentation]     將當前網頁轉向登入頁面
    go to    ${LOGIN URL}

Input Username
    [Documentation]     輸入帳號
    [Arguments]     ${username}
    input text      id:Email    ${username}

Input Password
    [Documentation]     輸入密碼
    [Arguments]     ${password}
    input text      id:Password    ${password}

Click Login Button
    [Documentation]     點擊登入按鈕
    click element   xpath://button[contains(text(),'Log in')]

Click Logout Link
    [Documentation]     點擊登出按鈕
    click link      logout

Error Message Should Be Visible     # fail to login
    [Documentation]     驗證網頁登入失敗
    page should contain    Login was unsuccessful

Dash Board Should Be Visible        # success to login
    [Documentation]     驗證網頁登入成功
    page should contain    Dashboard

