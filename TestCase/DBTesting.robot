*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem

Suite Setup         Connect To DataBase     pymysql     ${DBName}       ${DBUserName}       ${DBPassWord}       ${DBHost}       ${DBPort}
Suite Teardown      Disconnect From DataBase

*** Variables ***
${DBName}           mydb
${DBUserName}       root
${DBPassWord}       zxc12345
${DBHost}           127.0.0.1
${DBPort}           3306

*** Test Cases ***
Drop Persons Table
    [Documentation]     刪除表格
    ${output}=  EXECUTE SQL STRING    DROP TABLE `persons`;
    log to console    ${output}
    should be equal as strings      ${output}       None

Create Persons Table
    [Documentation]     建立表格
    ${output}=  EXECUTE SQL STRING    CREATE TABLE `persons`(`ID` INT PRIMARY KEY,`FirstName` VARCHAR(20),`LastName` VARCHAR(20));
    log to console    ${output}
    should be equal as strings      ${output}       None

Inserting Data in Persons Table
    [Documentation]     表格插入資料
    #Single Record
    #${output}=  EXECUTE SQL STRING    INSERT INTO `persons` VALUES(101,'John','Kennedy');

    #Multiple Record
    ${output}=  execute sql script      ./TestData/mydb_person_insertData.sql    # start from automation
    log to console    ${output}
    should be equal as strings      ${output}       None

Check David record present in Persons Table
    [Documentation]     檢查表格存在指定資料
    check if exists in database     SELECT ID FROM mydb.persons WHERE `FirstName`='David';

Check Jio record Not present in Persons Table
    [Documentation]     檢查表格不存在指定資料
    check if not exists in database    SELECT ID FROM mydb.persons WHERE `FirstName`='Jio';

Check Person Table exists in mydb Database
    [Documentation]     檢查表格存在於資料庫
    table must exist    persons

Verify Row Count is Zero
    [Documentation]     確認搜尋結果筆數等於0
    row count is 0     SELECT * FROM mydb.persons WHERE `FirstName`='xyz';

Verify Row Count is Equal to Some Value
    [Documentation]     確認搜尋結果筆數等於某個數值
    row count is equal to x    SELECT * FROM mydb.persons WHERE `FirstName`='David';    1

Verify Row Count is Greater to Some Value
    [Documentation]     確認搜尋結果筆數大於某個數值
    row count is greater than x     SELECT * FROM mydb.persons WHERE `FirstName`='David';    0

Verify Row Count is Lesser to Some Value
    [Documentation]     確認搜尋結果筆數小於某個數值
    row count is less than x     SELECT * FROM mydb.persons WHERE `FirstName`='David';    2

Update Record in Table Persons
    [Documentation]     更新表格資料
    ${output}=  EXECUTE SQL STRING    UPDATE mydb.persons SET `FirstName`='Jio' WHERE ID=104;
    log to console    ${output}
    should be equal as strings      ${output}       None

Retrieve Record in Table Persons
    [Documentation]     讀取表格資料
    @{queryResult}=     query       SELECT * FROM mydb.persons;
    log to console      many @{queryResult}

Delete Records in Table
    [Documentation]     刪除表格全部資料
    ${output}=  EXECUTE SQL STRING    DELETE FROM `persons`;
    log to console    ${output}
    should be equal as strings      ${output}       None