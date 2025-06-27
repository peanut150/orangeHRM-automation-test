*** Settings ***
Library        SeleniumLibrary
Library        FakerLibrary
Variables      ../../Resources/TestData/Testdata.py
Resource       ../../Resources/Pages/Login/LoginKeywords.robot
Resource       ../../Resources/Common/Navigation.robot
Resource       ../../Resources/Pages/Admin/UpdateUserKeywords.robot
Test Setup     User Access The Site    ${SiteUrl}    ${Browser}
Test Teardown  Close Browser

*** Test Cases ***
Verify Successful Update User By User Role
    [Tags]    update-user    good-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    And User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    When User Clicks the Edit Icon
    And User Selects User Role
    And User Clicks The Save Button
    Then User Information should be Updated    ${ToastSuccessUpdateMessage}
    And User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}

Verify Successful Update User By Employee Name
    [Tags]    update-user    good-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    And User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    When User Clicks the Edit Icon
    And Selects Existing Employee Name
    And User Clicks The Save Button
    Then User Information should be Updated    ${ToastSuccessUpdateMessage}
    And User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}

Verify Successful Update User By Status
    [Tags]    update-user    good-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    And User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    When User Clicks the Edit Icon
    And User Selects Status
    And User Clicks The Save Button
    Then User Information should be Updated    ${ToastSuccessUpdateMessage}
    And User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}

Verify Successful Update User By Username
    [Tags]    update-user    good-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    And User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    When User Clicks the Edit Icon
    And User Enters New Username
    And User Clicks The Save Button
    Then User Information should be Updated    ${ToastSuccessUpdateMessage}
    And User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}

Verify Successful Update User By Password
    [Tags]    update-user    good-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    And User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    When User Clicks the Edit Icon
    And User Updates the Password
    And User Clicks The Save Button With New Password
    Then User Information should be Updated    ${ToastSuccessUpdateMessage}
    And User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}

Verify Successful Update User By Filling All Fields
    [Tags]    update-user    good-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    And User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    When User Clicks the Edit Icon
    And User Updates All Fields
    Then User Information should be Updated    ${ToastSuccessUpdateMessage}
    And User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}

User Did Not Select the Employee Name
    [Tags]    update-user    bad-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    And User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    When User Clicks the Edit Icon
    And User Did Not Select an Existing Employee
    And User Clicks The Save Button
    Then Invalid Error should Display    ${InvalidErrorText}

Employee Name Does Not Exist
    [Tags]    update-user    bad-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    And User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    When User Clicks the Edit Icon
    And User Enters Employee Name
    But No Record Found Shows in Dropdown
    Then Invalid Error Should Display    ${InvalidErrorText}

Username is Empty
    [Tags]    update-user    bad-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    And User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    When User Clicks the Edit Icon
    And User Leaves the Username Empty
    And User Clicks The Save Button
    Then Required Error should Display    ${RequiredErrorText}

User Enters Password Less Than 7 Characters
    [Tags]    update-user    bad-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    And User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    When User Clicks the Edit Icon
    And User Enters Less Than 7 Characters Password
    And User Clicks The Save Button With New Password
    Then A Password Error Should Display    ${LessThan7CharacsErrorText}

User Enters Password with Only Texts
    [Tags]    update-user    bad-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    And User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    When User Clicks the Edit Icon
    And User Enters Only Texts Password
    And User Clicks The Save Button With New Password
    Then A Password Error Should Display    ${PassShouldContainNumError}

User Enters Password with No Lowercase Letter
    [Tags]    update-user    bad-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    And User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    When User Clicks the Edit Icon
    And User Enters No Lowercase Password
    And User Clicks The Save Button With New Password
    Then A Password Error Should Display    ${PassShouldContainLowercaseError}

Password and Confirm Password Fields Do Not Match
    [Tags]    update-user    bad-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    And User Navigates To Admin Page    ${AdminUrl}    ${AdminNavbarTitle}
    When User Clicks the Edit Icon
    And Password and Confirm Password does not Match
    And User Clicks The Save Button With New Password
    Then A confirm password error should display    ${ConfirmPassError}