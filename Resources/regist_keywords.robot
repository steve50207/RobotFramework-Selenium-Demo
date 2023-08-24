*** Settings ***
Library         SeleniumLibrary                     # python package
Variables       ../PageObjects/locators.py          # variables is .py file

*** Keywords ***
Open my Browser
    [Documentation]     開啟瀏覽器並略過網頁驗證過期問題
    [Arguments]     ${Siteurl}     ${Browser}     ${Options}
    open browser    ${Siteurl}     ${Browser}     ${Options}
    maximize browser window
    click button    ${button_detail}
    click link      ${link_GoToUrl}

Close my Browser
    [Documentation]     關閉瀏覽器
    sleep    8
    close all browsers

Enter First Name
    [Documentation]     輸入名子
    [Arguments]     ${FirstName}
    input text      ${txt_First_Name}      ${FirstName}
    sleep    0.5

Enter Last Name
    [Documentation]     輸入姓氏
    [Arguments]     ${LastName}
    input text      ${txt_Last_Name}      ${LastName}
    sleep    0.5

Select Gender
    [Documentation]     選擇性別(單選紐)
    [Arguments]     ${Gender}
    select radio button     ${radio_button_Gender}      ${Gender}
    sleep    0.5

Select Hobby
    [Documentation]     選擇興趣(列表框)
    [Arguments]     ${Hobby}
    select from list by label   ${list_box_Hobbies}     ${Hobby}
    sleep    0.5

Select Department / Office
    [Documentation]     選擇興趣(下拉式選單)
    [Arguments]     ${Department}
    select from list by label   ${drop_down_Department_Office}      ${Department}
    sleep    0.5

Enter Username
    [Documentation]     輸入帳號
    [Arguments]     ${Username}
    input text      ${txt_Username}      ${Username}
    sleep    0.5

Enter Password
    [Documentation]     輸入密碼
    [Arguments]     ${Password}
    input text      ${txt_Password}      ${Password}
    sleep    0.5

Enter Confirm Password
    [Documentation]     輸入確認密碼
    [Arguments]     ${Password}
    input text      ${txt_Confirm_Password}      ${Password}
    sleep    0.5

Enter E-Mail
    [Documentation]     輸入信箱
    [Arguments]     ${Email}
    input text      ${txt_Email}      ${Email}
    sleep    0.5

Enter Contact No
    [Documentation]     輸入連絡電話
    [Arguments]     ${ContactNo}
    input text      ${txt_Contact_No}      ${ContactNo}
    sleep    0.5

Enter Additional Info
    [Documentation]     輸入額外資訊
    [Arguments]     ${AdditionalInfo}
    input text      ${txt_Additional_Info}      ${AdditionalInfo}
    sleep    0.5

Press Submit
    [Documentation]     點擊註冊按鈕
    click button    ${button_Submit}
    sleep    0.5

Verify Successful Registion
    [Documentation]     驗證註冊成功,先將網頁捲動置尾端,驗證出現註冊成功訊息,並且網頁尾端表格出現姓名,任職單位,信箱,連絡電話等對應註冊訊息
    [Arguments]     ${FirstName}    ${LastName}    ${Department}    ${Email}    ${ContactNo}
    execute javascript     window.scrollTo(0,document.body.scrollHeight)
    page should contain    Success!.
    page should contain    ${FirstName}
    page should contain    ${LastName}
    page should contain    ${Department}
    page should contain    ${Email}
    page should contain    ${ContactNo}
    sleep    3
