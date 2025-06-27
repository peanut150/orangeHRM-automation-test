*** Settings ***
Library        SeleniumLibrary
Variables      ../../Resources/TestData/Testdata.py
Resource       ../../Resources/Pages/Login/LoginKeywords.robot
Resource       ../../Resources/Common/Navigation.robot
Resource       ../../Resources/Pages/PIM/ViewEmployeeKeywords.robot
Test Setup     User Access The Site    ${SiteUrl}    ${Browser}
Test Teardown  Close Browser

*** Test Cases ***
User Successfully Views Candidates
    [Tags]    view-candidate    good-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Recruitment Page    ${RecruitmentUrl}    ${RecruitNavbar}
    Then User Can View The Employees