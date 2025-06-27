*** Settings ***
Documentation    AddRecruitmentTest
Library          SeleniumLibrary
Variables        ../../Resources/TestData/Testdata.py
Resource         ../../Resources/Common/Navigation.robot
Resource         ../../Resources/Pages/Recruitment/DeleteCandidateKeywords.robot
Resource         ../../Resources/Pages/Login/LoginKeywords.robot
Test Setup     User Access The Site    ${SiteUrl}    ${Browser}
Test Teardown  Close Browser

*** Test Cases ***
User Successfully Delete Candidate
    [Tags]    delete-candidate    good-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Recruitment Page    ${RecruitmentUrl}    ${RecruitNavbar}
    And User Clicks the Delete Button
    And Confirms Deletion
    Then Candidate Should Be Deleted    ${ToastDeleteSuccess}

User Cancels Deletion
    [Tags]    delete-candidate    good-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Recruitment Page    ${RecruitmentUrl}    ${RecruitNavbar}
    And User Clicks the Delete Button
    And Cancels Deletion
    Then Candidate Should Not Be Deleted

User Closes the Confirmation Dialog
    [Tags]    delete-candidate    good-case
    Given User Successfully Logs In    ${UserName}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When User Navigates To Recruitment Page    ${RecruitmentUrl}    ${RecruitNavbar}
    And User Clicks the Delete Button
    And Clicks the Close Button
    Then Candidate Should Not Be Deleted