*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}          https://demowebshop.tricentis.com/register


*** Test Cases ***
CloseBroswerTest
    [Documentation]     關閉多個瀏覽器
    open browser        ${url}      ${browser}
    sleep    5
    maximize browser window

    open browser        ${url}      ${browser}
    sleep    5
    maximize browser window

    sleep    5
    close all browsers

