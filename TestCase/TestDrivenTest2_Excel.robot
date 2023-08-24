*** Settings ***
Library             SeleniumLibrary
Resource            ../Resources/login_resource.robot
Library             DataDriver      ../TestData/LoginData.xlsx      sheet_name=sheet1
Suite Setup         Open My Browser
Suite Teardown      Close Browsers
Test Template       Invalid Login

*** Test Cases ***
LoginTestWithExcel      using   ${username} and ${password}    # data from excel file, repete usernames would have warning

*** Keywords ***
Invalid Login
    [Documentation]     網頁登入失敗功能驗證,確認輸入錯誤帳號密碼,頁面會出現錯誤訊息
    [Arguments]         ${username}     ${password}
    Input Username      ${username}
    Input Password      ${password}
    Click Login Button
    ERROR MESSAGE SHOULD BE VISIBLE