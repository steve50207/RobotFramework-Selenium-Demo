*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${url_1}          https://www.google.com
${url_2}          https://www.bing.com

*** Test Cases ***
NavigationTest
    [Documentation]     控制網頁跳軟與返回
    open browser        ${url_1}      ${browser}
    maximize browser window
    ${loc}=     get location
    log to console      ${loc}

    go to       ${url_2}
    ${loc}=     get location
    log to console      ${loc}

    sleep   3

    go back
    ${loc}=     get location
    log to console      ${loc}
    sleep   3

    close browser

*** Keywords ***

