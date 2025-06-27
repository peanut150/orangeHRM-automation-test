*** Settings ***
Library        SeleniumLibrary
Variables      ../../Resources/TestData/Testdata.py
Resource       ../../Resources/Pages/Login/LoginKeywords.robot
Resource       ../../Resources/Common/Navigation.robot
Resource       ../../Resources/Pages/Admin/ViewSystemUsersKeywords.robot
Test Setup     User Access The Site    ${SiteUrl}    ${Browser}
Test Teardown  Close Browser

*** Test Cases ***
User Successfully View System Users
    [Tags]    view-users    good-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    Then User can View System Users