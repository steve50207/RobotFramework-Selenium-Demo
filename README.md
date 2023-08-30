# RobotFramework-Selenium-Demo

###### tags: `Robot Framework`

## 專案動機
- 近期正在進行軟體測試面試，有鑑於在前公司負責專案有使用到Selenium網頁自動化測試，因此開立此專案進行複習與練習，亦作為面試Demo使用。

## 專案目標
- RegistTest:
     - 將Excel自定義的註冊資料自動填寫在註冊網站，並確認註冊資料如預期顯示在網頁尾端表格內，驗證網頁註冊系統功能正確運作。
- AllTestSuites:
     - 透過Jenkins進行自動建置(autobuild)，透過pabot可以執行多個網頁自動化測試套件(TestSuite)，達到一鍵執行完整網頁測試計畫(Test Plan)的效果。

## 測試工具 
- 本項網頁自動化測試專案使用以下測試工具:
    - RobotFramework: 
        - Python Based 自動化測試框架。
    - Selenium: 
        - 網頁自動化測試套件。
    - Jenkins: 
        - Java Based 持續整合工具(Continuous Integration Tool)，能提供自動建置(autobuild)服務。

## 測試環境
- 本項網頁自動化測試專案在下列測試環境中執行:
    - OS: Windows 10
    - Python: Python 3.11.0
    - PyCharm: Community 2023.2
    - Chrome Webdriver: 116.0.5845.96
        - 需要將Python311\Scripts設定為環境變數Path，再將webdriver放至Python311\Scripts資料夾。
    - Java JDK: 17.0.8 
    - Jenkins: 2.414.1 
        - 採用Generic Java package (.war)。
        - 需要先安裝Java JDK，在cmd輸入指令 java -jar jenkins.war啟動Jenkins網頁。
        - 預設網頁: [127.0.0.1:8080](http://localhost:8080/)。
    - Python 3rd Party Packages: 參考requirements.txt
        - 可按照下列Python pip指令完成Packages安裝:
            - pip install  robot framework
            - pip install  selenium
            - pip install  robotframework-seleniumlibrary
            - pip install  robotframework-databaselibrary
            - pip install  PyMySQL
            - pip install -U robotframework-datadriver[XLS]
            - pip install -U robotframework-pabot
    - RobotFramework架構圖:
        - ![image](https://github.com/steve50207/RobotFramework-Selenium-Demo/blob/main/png/1.png)
      
## 測試文件架構
- RegistTest:
    - PageObjects\locators.py
      - 定義註冊中需要操作的網頁元素位置，採用三種定位方式，如id、name、xpath。
    - Resources\regist_keywords.robot
      - SeleniumLirary定義的keyword(API)重新包裝成自定義keyword，將locators.py定義的locator代入使用，讓RegistTest.robot能呼叫使用。
    - TestData\RegistData.xlsx
      - 定義註冊資料，包含姓名、性別、興趣、任職單位、註冊帳號、註冊密碼、信箱、連絡電話、備註訊息。
    - TestCase\RegistTest.robot
      - 執行網頁註冊功能測試主程式，將自定義keyword再次包裝成測試範本(test template)並重複執行，每輪執行會自動帶入excel註冊資料，並驗證註冊資料有確實出現在網頁尾端表格內。
    - RegistTestCase_run.bat
      - windows shell script，包含python執行測試指令，可以透過Jenkins設定觸發完成RegistTest測試。
    - 備註: 採用Page Object Model(POM)的設計模式進行source code文件劃分，可避免出現變數重複定義或TestCase重複測試的情況。
        - ![image](https://github.com/steve50207/RobotFramework-Selenium-Demo/blob/main/png/2.png)
    
- AllTestSuites:
    - PageObjects
       - 定義網頁測試操作中的網頁元素位置。
    - TestData
       - 定義網頁測試操作中所需要測試資料。
    - TestCase
       - 定義各項網頁功能測試套件(TestSuite)，共有28個TestSuite，測試套件驗證功能可查看TestSuites_Results\report.html。
    - AllTestSuites_run.bat
       - windows shell script，包含python執行測試指令，可以透過Jenkins設定觸發完成AllTestSuites測試。

## 測試結果
- RegistTest:
     - DemoVideo\RegistTest.mp4
       - RegistTest測試展示影片。
     - RegistTest_Result\report.html
       - 執行RegistTestCase_run.bat後產生的測試結果報表。
           - ![image](https://github.com/steve50207/RobotFramework-Selenium-Demo/blob/main/png/3.png)
           - ![image](https://github.com/steve50207/RobotFramework-Selenium-Demo/blob/main/png/4.png)
           - ![image](https://github.com/steve50207/RobotFramework-Selenium-Demo/blob/main/png/5.png)
- AllTestSuites:
     - DemoVideo\AllTestSuites.mp4
       - AllTestSuites測試展示影片。
     - TestSuites_Results\report.html
       - 執行AllTestSuites_run.bat後產生的測試結果報表。 
           - ![image](https://github.com/steve50207/RobotFramework-Selenium-Demo/blob/main/png/6.png)
           - ![image](https://github.com/steve50207/RobotFramework-Selenium-Demo/blob/main/png/7.png)
           - ![image](https://github.com/steve50207/RobotFramework-Selenium-Demo/blob/main/png/8.png)
           - ![image](https://github.com/steve50207/RobotFramework-Selenium-Demo/blob/main/png/9.png)


## 相關連結
- [Web Automation using Robot Framework(Selenium with Python)](https://https://www.youtube.com/playlist?list=PLUDwpEzHYYLsCHiiihnwl3L0xPspL7BPG)
- [Robot Framework + Selenium YT影片練習筆記](https://hackmd.io/@MJUsbP-5S_-z1aM5n6NvlQ/HJ0tiRmh3)
