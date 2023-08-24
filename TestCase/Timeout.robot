*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}          https://demowebshop.tricentis.com/register

*** Test Cases ***
RegTest
    [Documentation]     進行網頁註冊時,測試每個keyword執行之間的不同超時時間
    open browser        ${url}      ${browser}
    maximize browser window
    ${time}=    get selenium timeout
    log to console    ${time}

    set selenium timeout    10 seconds

    ${time}=    get selenium timeout
    log to console    ${time}

    wait until page contains    Register    # 5 seconds

    select radio button    Gender   M
    input text    name:FirstName    Kuan Yu
    input text    name:LastName     Chen
    input text    name:Email        kcem104@gmail.com
    input text    name:Password     G#n3ik9Th54STN
    input text    name:ConfirmPassword    G#n3ik9Th54STN

