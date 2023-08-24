*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
lauchBrowser
    [Documentation]     開啟瀏覽器並回傳網頁標題
    [Arguments]         ${appurl}   ${appbrowser}
    open browser        ${appurl}   ${appbrowser}
    maximize browser window
    ${title}=   get title
    [Return]    ${title}