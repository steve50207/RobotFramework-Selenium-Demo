*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${url_1}        https://swisnl.github.io/jQuery-contextMenu/demo.html
${url_2}        https://testautomationpractice.blogspot.com/
${url_3}        http://www.dhtmlgoodies.com/scripts/drag-drop-custom/demo-drag-drop-3.html
*** Test Cases ***
MouseActions
    [Documentation]     控制滑鼠點擊操作,包含右鍵點擊按鈕,左鍵雙擊按鈕,拖曳可移動網頁元素
    #Right click/open context menu
    open browser        ${url_1}      ${browser}
    maximize browser window
    open context menu       xpath://span[contains(text(),'right click me')]
    sleep    5

    #Double click action
    go to       ${url_2}
    maximize browser window
    double click element    xpath://button[contains(text(),'Copy Text')]
    sleep    5

    #Drag and drop
    go to       ${url_3}
    maximize browser window
    sleep    5
    drag and drop       id:box6     id:box106
    sleep    5
    close browser





