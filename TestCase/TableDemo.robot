*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}          https://testautomationpractice.blogspot.com/

*** Test Cases ***
TableValidations
    [Documentation]     網頁表格元素驗證,包含row,column,header,cell等表格元素
    open browser        ${url}      ${browser}
    maximize browser window
    ${rows}=    get element count    //table[@name="BookTable"]/tbody/tr        # rows of table
    ${cols}=    get element count    //table[@name="BookTable"]/tbody/tr[1]/th  # cols of table
    log to console    ${rows}       # 7 rows
    log to console    ${cols}       # 4 cols

    ${data}=    get text    //table[@name="BookTable"]/tbody/tr[5]/td[1]        # 5th row, 1th col
    log to console    ${data}       # Master In Selenium

    table column should contain    //table[@name="BookTable"]   3   Javascript  # 3th col contains Javascript
    table row should contain       //table[@name="BookTable"]   2   Amit        # 2th row contains Amit
    table cell should contain      //table[@name="BookTable"]   2   4   300	    # 2th row, 4 col contains 300
    table header should contain    //table[@name="BookTable"]   Price           # any header of table is ok

    close all browsers