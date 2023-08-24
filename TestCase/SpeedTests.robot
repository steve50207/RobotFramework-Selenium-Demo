*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}          https://demowebshop.tricentis.com/register


*** Test Cases ***
RegSpeedTest
    [Documentation]     進行網頁註冊時,測試每個keyword執行之間的不同延遲時間
    #${speed}=   get selenium speed
    #log to console      ${speed}
    open browser        ${url}      ${browser}
    maximize browser window
    set selenium speed    2 seconds         # Sets the delay that is waited after each Selenium command

    select radio button    Gender   M
    input text    name:FirstName    Kuan Yu
    input text    name:LastName    Chen
    input text    name:Email    kcem104@gmail.com
    input text    name:Password    G#n3ik9Th54STN
    input text    name:ConfirmPassword    G#n3ik9Th54STN

    #${speed}=   get selenium speed
    #log to console      ${speed}
