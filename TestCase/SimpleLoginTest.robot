*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}          https://demo.nopcommerce.com/
${Email}        kcem104@gmail.com
${Password}     G#n3ik9Th54STN

*** Test Cases ***
LoginTest
    [Documentation]     網站登入測試,包含開啟網頁,輸入帳號與密碼並點擊登入,關閉網頁
    open browser        ${url}      ${browser}
    LoginIntoApplication
    close browser

*** Keywords ***
LoginIntoApplication
    [Documentation]     輸入帳號與密碼並點擊登入
    click link      xpath://a[contains(text(),'Log in')]
    input text      id:Email      ${Email}
    input text      id:Password   ${Password}
    click element   xpath://button[contains(text(),'Log in')]
