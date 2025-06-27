*** Settings ***
Library        SeleniumLibrary
Variables      ../../Resources/TestData/Testdata.py
Resource       ../../Resources/Pages/Login/LoginKeywords.robot
Resource       ../../Resources/Common/Navigation.robot
Resource       ../../Resources/Pages/Claim/ViewAssignClaimsKeywords.robot
Test Setup     User Access The Site    ${SiteUrl}    ${Browser}
Test Teardown  Close Browser

*** Test Cases ***
User Successfully View Assigned Claims
    [Tags]    view-claim    good-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Claim Page    ${ClaimUrl}    ${ClaimNavbarTitle}
    Then User Can View The Assigned Claims