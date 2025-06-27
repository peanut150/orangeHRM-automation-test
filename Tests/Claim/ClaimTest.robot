*** Settings ***
Library        SeleniumLibrary
Variables      ../../Resources/TestData/Testdata.py
Resource       ../../Resources/Common/Navigation.robot
Resource       ../../Resources/Pages/Login/LoginKeywords.robot
Resource       ../../Resources/Pages/Claim/EmployeeClaimsKeywords.robot
Test Setup     User Access The Site    ${SiteUrl}    ${Browser}
Test Teardown  Close Browser

*** Test Cases ***
Create Claim Successfully with Mandatory Details
    [Tags]    create-claim    good-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Claim Page    ${ClaimUrl}    ${ClaimNavbarTitle}    ${ShowTimer}
    And Clicks Assign Claim Button    ${ShowTimer}
    And Fills in all required fields in claim request form    ${AssignClaimUrl}    ${AssignClaimFormTitle}

Create Claim Successfully including Remarks
    [Tags]    create-claim    good-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Claim Page    ${ClaimUrl}    ${ClaimNavbarTitle}    ${ShowTimer}
    And Clicks Assign Claim Button    ${ShowTimer}
    And Fills in all fields in claim request form    ${AssignClaimUrl}    ${AssignClaimFormTitle}