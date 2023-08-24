*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${url_1}          https://www.google.com
${url_2}          https://www.bing.com

*** Test Cases ***
MutipleBrowsersTest
    [Documentation]     在多個瀏覽器中進行切換,並獲取個別網頁標題
    open browser        ${url_1}      ${browser}
    maximize browser window

    sleep   3

    open browser        ${url_2}      ${browser}
    maximize browser window

    switch browser    1     #google
    ${title}=   get title
    log to console    ${title}

    switch browser    2     #bing
    ${title}=   get title
    log to console    ${title}

    sleep   3
    close all browsers
