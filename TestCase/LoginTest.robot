*** Settings ***
Library               SeleniumLibrary                     # python package
Resource              ../Resources/login_keywords.robot   # keyword is .robot file
Suite Setup           Open my Browser     ${Login_Url}    ${Browser}    ${Options}
Suite Teardown        Close my Browser

*** Variables ***
# Login Variable
${Login_Url}=         https://admin-demo.nopcommerce.com/login?ReturnUrl=%2Fadmin%2F
${Browser}=           chrome
#${Browser}=          headlesschrome
${Options}=           options=add_argument("--ignore-certificate-errors"); add_argument("--allow-running-insecure-content")
${Email}=             admin@yourstore.com
${Password}=          admin

*** Test Cases ***
LoginTest
    [Documentation]     進行登入測試,包含輸入Email&Password,點擊登入,確認進入登入畫面
    Enter Email         ${Email}
    Enter Password      ${Password}
    Click LogIn
    Verify Successful Login

