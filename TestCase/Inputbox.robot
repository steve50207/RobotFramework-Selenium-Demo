*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}          https://demo.nopcommerce.com/

*** Test Cases ***
TestingInputBox
    [Documentation]    測試輸入欄位是否能正常運作,包含欄位可看到,欄位可以輸入資料,欄位輸入資料後可以清除
    open browser    ${url}  ${browser}
    maximize browser window
    title should be    nopCommerce demo store
    click link      xpath://a[contains(text(),'Log in')]
    ${"email_txt"}      set variable        id:Email
    element should be visible       ${"email_txt"}
    element should be enabled       ${"email_txt"}

    input text      ${"email_txt"}      kcem104@gmail.com
    sleep    5
    clear element text      ${"email_txt"}
    sleep   3
    close browser

