*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}          https://www.techlistic.com/p/selenium-practice-form.html


*** Test Cases ***
Testing Radio Buttons and Check Boxes
    [Documentation]     控制選擇單選鈕與選擇或取消核取方塊
    open browser        ${url}      ${browser}
    maximize browser window
    set selenium speed      1

    # scorll page to right place
    scroll element into view    xpath://span[contains(text(),'Selenium Commands')]

    # selecting radio buttons
    select radio button     sex     Female
    select radio button     exp     5

    # selecting checkbox buttons
    select checkbox     Automation Tester
    select checkbox     Selenium Webdriver

    unselect checkbox       Automation Tester
    unselect checkbox       Selenium Webdriver