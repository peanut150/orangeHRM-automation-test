*** Settings ***
Library        SeleniumLibrary
Variables      ../../Resources/TestData/Testdata.py
Resource       ../../Resources/Pages/Login/LoginKeywords.robot
Resource       ../../Resources/Common/Navigation.robot
Resource       ../../Resources/Pages/Dashboard/ViewDashboardKeywords.robot
Test Teardown  Close Browser

*** Test Cases ***
User Successfully Explore Dashboard
    [Tags]    view-dashboard    good-case
    Given user access the site    ${SiteUrl}    ${Browser}
    And user enters correct username    ${Username}
    And user enters correct password    ${Password}
    And user clicks login button
    When User Navigates To Dashboard Page    ${DashboardUrl}    ${DashNavbarTitle}
    Then User Can Explore The Dashboard