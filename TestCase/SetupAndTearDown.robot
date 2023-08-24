*** Settings ***

Suite Setup         Log to console      Opening Browser
Suite Teardown      Log to console      Closing Browser

Test Setup          Log to console      Login to application
Test Teardown       Log to console      Logout from application

*** Test Cases ***

# Opening Browser

TC1 Prepaid Recharge
    # Login to application
    log to console    This is prepaid recharge testcase
    # Logout from application
TC2 Postpaid Recharge
    # Login to application
    log to console    This is postpaid recharge testcase
    # Logout from application
TC3 Search
    # Login to application
    log to console    This is search test case
    # Logout from application
TC4 Anvance Search
    # Login to application
    log to console    This is advance search test case
    # Logout from application

# Closing Browser