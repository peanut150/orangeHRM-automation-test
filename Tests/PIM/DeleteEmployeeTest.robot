*** Settings ***
Documentation    DeleteEmployeeTest
Library          SeleniumLibrary
Variables        ../../Resources/TestData/Testdata.py
Resource         ../../Resources/Pages/PIM/DeleteEmployeeKeywords.robot
Resource         ../../Resources/Pages/Login/LoginKeywords.robot
Test Setup     User Access The Site    ${SiteUrl}    ${Browser}
Test Teardown  Close Browser

*** Test Cases ***
User Successfully Delete Employee
    [Tags]    delete-employee    good-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    And user navigates to PIM page    ${PimUrl}    ${PimNavbar}
    When user clicks the delete button
    And accepted alert confirmation
    Then employee is deleted