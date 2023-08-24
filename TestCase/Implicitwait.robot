*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}          https://demowebshop.tricentis.com/register


*** Test Cases ***
RegTest
    [Documentation]     測試不同搜尋網頁元素時間
    open browser        ${url}      ${browser}
    maximize browser window

    ${implicittime}=    get selenium implicit wait  # The default value is 0
    log to console    ${implicittime}

    set selenium implicit wait  10 seconds      # maximum time how long Selenium waits when searching for elements

    ${implicittime}=    get selenium implicit wait
    log to console    ${implicittime}

    select radio button    Gender   M
    input text    name:FirstName    Kuan Yu
    input text    name:LastName    Chen
    input text    name:Email    kcem104@gmail.com
    input text    name:Password    G#n3ik9Th54STN
    input text    name:ConfirmPassword    G#n3ik9Th54STN

