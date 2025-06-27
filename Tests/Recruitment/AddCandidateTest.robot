*** Settings ***
Documentation    AddRecruitmentTest
Library          SeleniumLibrary
Variables        ../../Resources/TestData/Testdata.py
Resource         ../../Resources/Common/Navigation.robot
Resource         ../../Resources/Pages/Recruitment/AddRecruitmentKeywords.robot
Resource         ../../Resources/Pages/Login/LoginKeywords.robot
Test Setup     User Access The Site    ${SiteUrl}    ${Browser}
Test Teardown  Close Browser

*** Test Cases ***
Add candidate successfully with only mandatory fields
    [Tags]    add-candidate    good-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When user navigates to recruitment page    ${RecruitmentUrl}    ${RecruitNavbar}
    And clicks add button
    And enters valid firstname
    And enters valid lastname
    And enters valid email
    And clicks the save button
    Then candidate should be added    ${SuccessAddCandidateTxt}

Add candidate successfully including middle name
    [Tags]    add-candidate    good-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When user navigates to recruitment page    ${RecruitmentUrl}    ${RecruitNavbar}
    And clicks add button
    And enters valid firstname
    And enters valid middlename
    And enters valid lastname
    And enters valid email
    And clicks the save button
    Then candidate should be added    ${SuccessAddCandidateTxt}

Add candidate successfully including vacancy
    [Tags]    add-candidate    good-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When user navigates to recruitment page    ${RecruitmentUrl}    ${RecruitNavbar}
    And clicks add button
    And enters valid firstname
    And enters valid lastname
    And selects vacancy
    And enters valid email
    And clicks the save button
    Then candidate should be added    ${SuccessAddCandidateTxt}

Add candidate successfully including contact number
    [Tags]    add-candidate    good-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When user navigates to recruitment page    ${RecruitmentUrl}    ${RecruitNavbar}
    And clicks add button
    And enters valid firstname
    And enters valid lastname
    And enters valid email
    And enters valid contact number
    And clicks the save button
    Then candidate should be added    ${SuccessAddCandidateTxt}

Add candidate successfully including resume
    [Tags]    add-candidate    good-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When user navigates to recruitment page    ${RecruitmentUrl}    ${RecruitNavbar}
    And clicks add button
    And enters valid firstname
    And enters valid lastname
    And enters valid email
    And uploads resume
    And clicks the save button
    Then candidate should be added    ${SuccessAddCandidateTxt}

Add candidate successfully including keywords
    [Tags]    add-candidate    good-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When user navigates to recruitment page    ${RecruitmentUrl}    ${RecruitNavbar}
    And clicks add button
    And enters valid firstname
    And enters valid lastname
    And enters valid email
    And enters keywords
    And clicks the save button
    Then candidate should be added    ${SuccessAddCandidateTxt}

Add candidate successfully including date of application
    [Tags]    add-candidate    good-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When user navigates to recruitment page    ${RecruitmentUrl}    ${RecruitNavbar}
    And clicks add button
    And enters valid firstname
    And enters valid lastname
    And enters valid email
    And selects date of application    ${ExpectedDate}
    And clicks the save button
    Then candidate should be added    ${SuccessAddCandidateTxt}

Add candidate successfully including notes
    [Tags]    add-candidate    good-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When user navigates to recruitment page    ${RecruitmentUrl}    ${RecruitNavbar}
    And clicks add button
    And enters valid firstname
    And enters valid lastname
    And enters valid email
    And enters notes
    And clicks the save button
    Then candidate should be added    ${SuccessAddCandidateTxt}

Add candidate successfully including consenting to keep data
    [Tags]    add-candidate    good-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When user navigates to recruitment page    ${RecruitmentUrl}    ${RecruitNavbar}
    And clicks add button
    And enters valid firstname
    And enters valid lastname
    And enters valid email
    And agrees to keep data
    And clicks the save button
    Then candidate should be added    ${SuccessAddCandidateTxt}

Add candidate successfully by filling in all fields
    [Tags]    add-candidate    good-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When user navigates to recruitment page    ${RecruitmentUrl}    ${RecruitNavbar}
    And clicks add button
    And enters valid firstname
    And enters valid middlename
    And enters valid lastname
    And selects vacancy
    And enters valid email
    And enters valid contact number
    And uploads resume
    And enters keywords
    And selects date of application    ${ExpectedDate}
    And enters notes
    And agrees to keep data
    And clicks the save button
    Then candidate should be added    ${SuccessAddCandidateTxt}
    
Cancelled adding the candidate
    [Tags]    add-candidate    good-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When user navigates to recruitment page    ${RecruitmentUrl}    ${RecruitNavbar}
    And clicks add button
    And enters valid firstname
    And enters valid middlename
    And enters valid lastname
    And selects vacancy
    And enters valid email
    And enters valid contact number
    And uploads resume
    And enters keywords
    And selects date of application    ${ExpectedDate}
    And enters notes
    And agrees to keep data
    And clicks the cancel button
    Then User Navigates To Recruitment Page    ${RecruitmentUrl}    ${RecruitNavbar}

Add candidate with invalid contact number
    [Tags]    add-candidate    bad-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When user navigates to recruitment page    ${RecruitmentUrl}    ${RecruitNavbar}
    And clicks add button
    And enters valid firstname
    And enters valid lastname
    And enters valid email
    And enters invalid contact number
    And clicks the save button
    Then contact number error should display    ${ContactNumberError}

Add candidate without firstname
    [Tags]    add-candidate    bad-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When user navigates to recruitment page    ${RecruitmentUrl}    ${RecruitNavbar}
    And clicks add button
    And leaves the firstname field empty
    And enters valid lastname
    And enters valid email
    And clicks the save button
    Then firstname required error should display    ${RequiredErrorText}

Add candidate without lastname
    [Tags]    add-candidate    bad-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When user navigates to recruitment page    ${RecruitmentUrl}    ${RecruitNavbar}
    And clicks add button
    And enters valid firstname
    And leaves the lastname field empty
    And enters valid email
    And clicks the save button
    Then lastname required error should display    ${RequiredErrorText}

Add candidate without email
    [Tags]    add-candidate    bad-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When user navigates to recruitment page    ${RecruitmentUrl}    ${RecruitNavbar}
    And clicks add button
    And enters valid firstname
    And enters valid lastname
    And leaves the email field empty
    And clicks the save button
    Then email required error should display    ${RequiredErrorText}

Add candidate without firstname, lastname, and email
    [Tags]    add-candidate    bad-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When user navigates to recruitment page    ${RecruitmentUrl}    ${RecruitNavbar}
    And clicks add button
    And leaves the firstname field empty
    And leaves the lastname field empty
    And leaves the email field empty
    And clicks the save button
    Then all required errors should display    ${RequiredErrorText}

Add candidate with invalid email
    [Tags]    add-candidate    bad-case
    Given User Successfully Logs In    ${Username}    ${Password}    ${DashboardUrl}    ${DashNavbarTitle}
    When user navigates to recruitment page    ${RecruitmentUrl}    ${RecruitNavbar}
    And clicks add button
    And enters valid firstname
    And enters valid lastname
    And enters invalid email
    And clicks the save button
    Then expected format for email should display    ${ExpectedEmailFormatErrorTxt}