*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}          https://www.ptt.cc/bbs/index.html
${browser}      chrome

*** Test Cases ***
GetAllLinksTest
    [Documentation]     擷取網頁所有超連結
    open browser    ${url}      ${browser}
    maximize browser window
    sleep    5
    ${AllLinksCount}=   get element count    xpath://a[@href]
    log to console    ${AllLinksCount}

    FOR    ${i}     IN RANGE    1   ${AllLinksCount}+1      # left close right open
        ${textlink}=    get text    xpath:(//a[@href])[${i}]
        log to console    ${textlink}
    END
