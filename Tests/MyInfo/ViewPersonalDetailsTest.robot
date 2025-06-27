*** Settings ***
Library        SeleniumLibrary
Variables      ../../Resources/TestData/Testdata.py
Resource       ../../Resources/Pages/Login/LoginKeywords.robot
Resource       ../../Resources/Common/Navigation.robot
Resource       ../../Resources/Pages/MyInfo/ViewPersonalDetailsKeywords.robot
Test Setup     User Access The Site    ${SiteUrl}    ${Browser}
Test Teardown  Close Browser

*** Test Cases ***
User Successfully View Personal Details
    [Tags]    view-myinfo    good-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To My Info Page    ${MyInfoNavbar}
    Then User Can View Personal Details    ${ContactFormTitle}    ${EmergencyFormTitle}    ${DependentsFormTitle}    ${ImmigrationFormTitle}    ${JobFormTitle}    ${SalaryFormTitle}    ${ReportToFormTitle}    ${QualificationsFormTitle}    ${MembershipsFormTitle}