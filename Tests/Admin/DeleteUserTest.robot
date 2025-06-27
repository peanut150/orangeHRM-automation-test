*** Settings ***
Library        SeleniumLibrary
Variables      ../../Resources/TestData/Testdata.py
Resource       ../../Resources/Pages/Login/LoginKeywords.robot
Resource       ../../Resources/Common/Navigation.robot
Resource       ../../Resources/Pages/Admin/DeleteUserKeywords.robot
Test Setup     User Access The Site    ${SiteUrl}    ${Browser}
Test Teardown  Close Browser

*** Test Cases ***
Verify Successful User Deletion
    [Tags]    delete-user    good-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    And User Clicks the Delete Button
    And Confirms Deletion
    Then User should be Deleted    ${ToastDeleteSuccess}

User Cancels Deletion
    [Tags]    delete-user    good-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    And User Clicks the Delete Button
    And Cancels Deletion
    Then User Should Not Be Deleted

User Closes the Confirmation Dialog
    [Tags]    delete-user    good-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    And User Clicks the Delete Button
    And Clicks the Close Button
    Then User Should Not Be Deleted

User Attempts to Delete their Own Account
    [Tags]    delete-user    bad-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    And Deletes their Account
    Then Cannot be Deleted Error should Display    ${ToastDeleteError}