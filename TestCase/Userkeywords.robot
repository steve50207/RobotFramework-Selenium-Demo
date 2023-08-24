*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/resources.robot     # start from automation and use relative path

*** Variables ***
${url}          https://demo.nopcommerce.com/
${browser}      chrome
${Email}        kcem104@gmail.com
${Password}     G#n3ik9Th54STN

*** Test Cases ***
UserkeywordTest
    [Documentation]    使用自定義keyword lauchBrowser取代open browser,並回傳網頁標題
    ${PageTitle}       lauchBrowser      ${url}        ${browser}
    log to console    ${PageTitle}      # console
    log               ${PageTitle}      # report
    click link      xpath://a[contains(text(),'Log in')]
    input text      id:Email      ${Email}
    input text      id:Password   ${Password}