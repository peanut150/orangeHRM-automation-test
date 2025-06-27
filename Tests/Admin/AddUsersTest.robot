*** Settings ***
Library        SeleniumLibrary
Library        FakerLibrary    locale=en_PH
Variables      ../../Resources/TestData/Testdata.py
Resource       ../../Resources/Pages/Login/LoginKeywords.robot
Resource       ../../Resources/Common/Navigation.robot
Resource       ../../Resources/Pages/Admin/AddUserKeywords.robot
Test Setup     User Access The Site    ${SiteUrl}    ${Browser}
Test Teardown  Close Browser

*** Test Cases ***
Verify Successful User Creation
    [Tags]    create-user    good-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates to Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    And User Clicks Add Button
    And Fills All Fields in the Form
    And Clicks The Save Button
    Then User should be Added    ${ToastSuccessMessage}
    And User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}