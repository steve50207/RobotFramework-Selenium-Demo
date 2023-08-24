*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}          https://www.techlistic.com/p/selenium-practice-form.html


*** Test Cases ***
Handling DropDowns and Lists
    [Documentation]     控制選取下拉式選單與列表框
    open browser        ${url}      ${browser}
    maximize browser window
    set selenium speed      0.5

    # selecting dropdowns
    select from list by label       continents      Asia
    sleep   2
    select from list by index       continents      5

    # list box
    select from list by label       selenium_commands      Switch Commands
    select from list by label       selenium_commands      WebElement Commands
    sleep   2
    unselect from list by label     selenium_commands      Switch Commands


