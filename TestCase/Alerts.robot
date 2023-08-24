*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}          https://testautomationpractice.blogspot.com/    #use this to test

*** Test Cases ***
HandlingAlerts
    [Documentation]     處理網頁警告通知
    open browser        ${url}      ${browser}
    click element    xpath://*[@id="HTML9"]/div[1]/button[2]    # open alert
    sleep   3
    handle alert    accept      # press ok
    click element    xpath://*[@id="HTML9"]/div[1]/button[2]    # open alert
    sleep   3
    handle alert    dismiss     # press cancel
    click element    xpath://*[@id="HTML9"]/div[1]/button[2]    # open alert
    sleep   3
    handle alert    leave     # do nothing
    alert should be present    Press a button!
    #alert should not be present     Press a button!
