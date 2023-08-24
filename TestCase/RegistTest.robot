*** Settings ***
Library             SeleniumLibrary                     # python package
Resource            ../Resources/regist_keywords.robot   # keyword is .robot file
Library             DataDriver      ../TestData/RegistData.xlsx      sheet_name=sheet1
Suite Setup         Open my Browser     ${Regist_Url}    ${Browser}    ${Options}
Suite Teardown      Close my Browser
Test Template       RegistTest

*** Variables ***
# Regist Variable
${Regist_Url}=        https://mytestingthoughts.com/Sample/home.html
${Browser}=           chrome
${Options}=           options=add_argument("--ignore-certificate-errors"); add_argument("--allow-running-insecure-content")

*** Test Cases ***
RegistTestWithExcel  using   ${FirstName}    ${LastName}    ${Gender}    ${Hobby}    ${Department}    ${Username}    ${Password}    ${Email}    ${ContactNo}    ${AdditionalInfo}

*** Keywords ***
RegistTest
    [Documentation]                 進行網頁註冊功能驗證,包含填寫姓名,性別,嗜好,任職單位,帳號,密碼,連絡電話,備註訊息,最後驗證註冊訊息是否出現在網頁尾端
    [Arguments]                     ${FirstName}    ${LastName}    ${Gender}    ${Hobby}    ${Department}    ${Username}    ${Password}    ${Email}    ${ContactNo}    ${AdditionalInfo}
    Enter First Name                ${FirstName}
    Enter Last Name                 ${LastName}
    Select Gender                   ${Gender}
    Select Hobby                    ${Hobby}
    Select Department / Office      ${Department}
    Enter Username                  ${Username}
    Enter Password                  ${Password}
    Enter Confirm Password          ${Password}
    Enter E-Mail                    ${Email}
    Enter Contact No                ${ContactNo}
    Enter Additional Info           ${AdditionalInfo}
    Press Submit
    Verify Successful Registion     ${FirstName}    ${LastName}    ${Department}    ${Email}    ${ContactNo}