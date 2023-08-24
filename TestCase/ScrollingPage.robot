*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}          https://www.countries-ofthe-world.com/flags-of-the-world.html
${browser}      chrome

*** Test Cases ***
ScorllingTest
    [Documentation]     捲動網頁測試,包含捲動固定像素,捲動到可是特定網頁元素,捲動到頂或捲動到底
    open browser    ${url}      ${browser}
    maximize browser window
    sleep   3
    execute javascript    window.scrollTo(0,2500)   # scroll certain pixels
    sleep   3
    scroll element into view    xpath://*[@id="content"]/div[2]/div[2]/table[2]/tbody/tr[79]/td[1]/img
    sleep   3
    execute javascript    window.scrollTo(0,document.body.scrollHeight)     # end of page
    sleep   3
    execute javascript    window.scrollTo(0,-document.body.scrollHeight)    # start of page
    sleep   3
    close browser

