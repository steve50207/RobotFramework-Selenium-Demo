*** Settings ***
Library             SeleniumLibrary
Resource            ../Resources/login_resource.robot
Suite Setup         Open My Browser     # before all test cases, operate this keyword
Suite Teardown      Close Browsers      # after all test cases, operate this keyword
Test Template       Invalid Login       # all test cases would be applied to this keyword

*** Test Cases ***
Right Username Empty Password       admin@yourstore.com     ${Empty}
Right Username Wrong Password       admin@yourstore.com     xyz
Wrong Username Right Password       adm@yourstore.com       admin
Wrong Username Empty Password       adm@yourstore.com       ${Empty}
Wrong Username Wrong Password       adm@yourstore.com       xyz

*** Keywords ***
Invalid Login
    [Documentation]     網頁登入失敗功能驗證,確認輸入錯誤帳號密碼,頁面會出現錯誤訊息
    [Arguments]         ${username}     ${password}
    Input Username      ${username}
    Input Password      ${password}
    Click Login Button
    ERROR MESSAGE SHOULD BE VISIBLE