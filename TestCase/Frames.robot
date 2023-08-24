*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}          https://www.selenium.dev/selenium/docs/api/java/index.html?org/openqa/selenium/package-summary.html

*** Test Cases ***
TestingFrames
    [Documentation]     控制選取多個表框選項,顯示對應頁面
    open browser        ${url}      ${browser}
    maximize browser window

    select frame        packageListFrame
    click link          org.openqa.selenium
    unselect frame
    sleep   3

    select frame        packageFrame
    click link          WebDriver
    unselect frame
    sleep   3

    select frame        classFrame
    click link          Index
    unselect frame
    sleep   3

    close browser
