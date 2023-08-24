*** Test Cases ***
#Forloop1               # in range
#   [Documentation]     FOR IN RANGE+頭尾邊界
#    FOR    ${i}     IN RANGE    1    10
#       log to console    ${i}
#    END

#Forloop2               # array
#   [Documentation]     FOR IN+一串數字
#    FOR    ${i}     IN  1 2 3 4 5 6 7 8                         # interval is single space->no change line
#    FOR    ${i}     IN  1    2    3    4    5    6    7    8    # interval is double spaces->change line
#        log to console    ${i}
#    END

#ForLoop3withList        # list
#   [Documentation]     FOR IN+List(數字)
#    @{item}     create list    1    2    3    4    5
#    FOR     ${i}     IN     @{item}
#        log to console    ${i}
#    END

#ForLoop4                # string
#   [Documentation]     FOR IN+一串字串
#    FOR    ${i}     IN      John David Smith Scott                      # interval is single space->no change line
#    #FOR    ${i}     IN      John        David       Smith       Scott  # interval is double spaces->change line
#        log to console    ${i}
#    END

#ForLoop5                # string
#   [Documentation]     FOR IN+List(字串)
#    @{nameList}     create list    John    David    Smith    Scott
#    FOR    ${name}     IN       @{nameList}
#        log to console    ${name}
#    END

ForLoop6withExit
   [Documentation]     FOR IN+List(數字)+Exit跳脫迴圈
    @{items}     create list    1    2    3    4    5
    FOR    ${i}     IN       @{items}
        log to console    ${i}
        EXIT FOR LOOP IF    ${i}==3
    END