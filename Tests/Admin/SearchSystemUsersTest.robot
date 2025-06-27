*** Settings ***
Library        SeleniumLibrary
Variables      ../../Resources/TestData/Testdata.py
Resource       ../../Resources/Pages/Login/LoginKeywords.robot
Resource       ../../Resources/Common/Navigation.robot
Resource       ../../Resources/Pages/Admin/SearchSystemUsersKeywords.robot
Test Setup     User Access The Site    ${SiteUrl}    ${Browser}
Test Teardown  Close Browser

*** Test Cases ***
Verify Successful System Users Search By Username
    [Tags]    search-user    good-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    And User Enters Username
    And Clicks Search Button
    Then Record should be Found    ${RecordFoundText}    ${NoRecordFoundText}

Verify Successful System Users Search By User Role
    [Tags]    search-user    good-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    And User Selects User Role
    And Clicks Search Button
    Then Record should be Found    ${RecordFoundText}    ${NoRecordFoundText}

Verify Successful System Users Search By Employee Name
    [Tags]    search-user    good-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    And Selects Existing Employee Name
    And Clicks Search Button
    Then Record should be Found    ${RecordFoundText}    ${NoRecordFoundText}

Verify Successful System Users Search By Status
    [Tags]    search-user    good-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    And User Selects Status
    And Clicks Search Button
    Then Record should be Found    ${RecordFoundText}    ${NoRecordFoundText}

Verify Successful System Users Search By Filling All Fields
    [Tags]    search-user    good-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    And User Filled All Fields
    And Clicks Search Button
    Then Record should be Found    ${RecordFoundText}    ${NoRecordFoundText}

Verify No Records Found By Username
    [Tags]    search-user    bad-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    And User Enters Username
    And Clicks Search Button
    Then No Records Found should be Displayed    ${RecordFoundText}    ${NoRecordFoundText}

Verify No Records Found By User Role
    [Tags]    search-user    bad-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    And User Selects User Role
    And Clicks Search Button
    Then No Records Found should be Displayed    ${RecordFoundText}    ${NoRecordFoundText}

Verify No Records Found By Employee Name
    [Tags]    search-user    bad-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    And Selects Existing Employee Name
    And Clicks Search Button
    Then No Records Found should be Displayed    ${RecordFoundText}    ${NoRecordFoundText}

Verify No Records Found By Status
    [Tags]    search-user    bad-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    And User Selects Status
    And Clicks Search Button
    Then No Records Found should be Displayed    ${RecordFoundText}    ${NoRecordFoundText}

Verify No Records Found By Filling All Fields
    [Tags]    search-user    bad-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    And User Filled All Fields
    And Clicks Search Button
    Then No Records Found should be Displayed    ${RecordFoundText}    ${NoRecordFoundText}