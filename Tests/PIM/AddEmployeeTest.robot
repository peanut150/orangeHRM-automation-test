*** Settings ***
Documentation        AddEmployeeTest
Library              SeleniumLibrary
Variables            ../../Resources/TestData/Testdata.py
Resource             ../../Resources/Pages/PIM/AddEmployeeKeywords.robot
Resource             ../../Resources/Pages/Login/LoginKeywords.robot
Test Setup     User Access The Site    ${SiteUrl}    ${Browser}
Test Teardown  Close Browser

*** Test Cases ***
Verify Successful Adding Employee
    [Tags]    add-employee    good-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When user navigates to PIM page    ${PimUrl}    ${PimNavbar}
    And user clicks add button
    And user enters valid first name
    And user enters valid middle name
    And user enters valid last name
#    And user uploads a profile picture
    And employee ID does not exist
    And user clicks save button
    Then employee info is added    ${PersonalDetailsFormHeader}

