*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}          https://demo.automationtesting.in/Windows.html

*** Test Cases ***
TabbedWindowsTest
    [Documentation]     瀏覽器分頁切換測試,包含點擊按鈕新增分頁,切換分頁後再點擊網頁連結
    open browser        ${url}      ${browser}
    maximize browser window
    click element   xpath://*[@id="Tabbed"]/a/button
    Switch Window   Selenium
    click element   xpath://*[@id="main_navbar"]/ul/li[3]/a/span
    sleep    3
    close all browsers