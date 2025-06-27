*** Settings ***
Library        SeleniumLibrary
Variables      ../../Locators/Locators.py

*** Keywords ***
Scrolls the Whole Page
    Execute Javascript        window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth'})
    Sleep                     2
    Execute JavaScript        window.scrollTo({ top: 0, behavior: 'smooth' })
    Sleep                     2

Clicks the Contact Details
    [Arguments]    ${ContactFormTitle}
    Click Element    ${link_contactDetails}
    Wait Until Element Is Visible    ${txt_contactDetailsFormTitle}
    Element Text Should Be    ${txt_contactDetailsFormTitle}    ${ContactFormTitle}
    Sleep    2
    Scrolls the Whole Page

Clicks the Emergency Contacts
    [Arguments]    ${EmergencyFormTitle}
    Click Element    ${link_emergencyContacts}
    Wait Until Element Is Visible    ${txt_emergencyContactsFormTitle}
    Element Text Should Be    ${txt_emergencyContactsFormTitle}    ${EmergencyFormTitle}
    Sleep    2
    Scrolls the Whole Page

Clicks the Dependents
    [Arguments]    ${DependentsFormTitle}
    Click Element    ${link_dependents}
    Wait Until Element Is Visible    ${txt_dependentsFormTitle}
    Element Text Should Be    ${txt_dependentsFormTitle}    ${DependentsFormTitle}
    Sleep    2
    Scrolls the Whole Page

Clicks the Immigration
    [Arguments]    ${ImmigrationFormTitle}
    Click Element    ${link_immigration}
    Wait Until Element Is Visible    ${txt_immigrationFormTitle}
    Element Text Should Be    ${txt_immigrationFormTitle}    ${ImmigrationFormTitle}
    Sleep    2
    Scrolls the Whole Page

Clicks the Job
    [Arguments]    ${JobFormTitle}
    Click Element    ${link_myInfoJob}
    Wait Until Element Is Visible    ${txt_jobFormTitle}
    Element Text Should Be    ${txt_jobFormTitle}    ${JobFormTitle}
    Sleep    2
    Scrolls the Whole Page

Clicks the Salary
    [Arguments]    ${SalaryFormTitle}
    Click Element    ${link_salary}
    Wait Until Element Is Visible    ${txt_salaryFormTitle}
    Element Text Should Be    ${txt_salaryFormTitle}    ${SalaryFormTitle}
    Sleep    2
    Scrolls the Whole Page

Clicks the Report-To
    [Arguments]    ${ReportToFormTitle}
    Click Element    ${link_reportTo}
    Wait Until Element Is Visible    ${txt_reportToFormTitle}
    Element Text Should Be    ${txt_reportToFormTitle}    ${ReportToFormTitle}
    Sleep    2
    Scrolls the Whole Page

Clicks the Qualifications
    [Arguments]    ${QualificationsFormTitle}
    Click Element    ${link_myInfoQualifications}
    Wait Until Element Is Visible    ${txt_qualificationsFormTitle}
    Element Text Should Be    ${txt_qualificationsFormTitle}    ${QualificationsFormTitle}
    Sleep    2
    Scrolls the Whole Page

Clicks the Memberships
    [Arguments]    ${MembershipsFormTitle}
    Click Element    ${link_myInfoMemberships}
    Wait Until Element Is Visible    ${txt_membershipsFormTitle}
    Element Text Should Be    ${txt_membershipsFormTitle}    ${MembershipsFormTitle}
    Sleep    2
    Scrolls the Whole Page

User can View Personal Details
    [Arguments]    ${ContactFormTitle}    ${EmergencyFormTitle}    ${DependentsFormTitle}    ${ImmigrationFormTitle}    ${JobFormTitle}    ${SalaryFormTitle}    ${ReportToFormTitle}    ${QualificationsFormTitle}    ${MembershipsFormTitle}
    Scrolls The Whole Page
    Clicks the Contact Details    ${ContactFormTitle}
    Clicks the Emergency Contacts    ${EmergencyFormTitle}
    Clicks the Dependents    ${DependentsFormTitle}
    Clicks the Immigration    ${ImmigrationFormTitle}
    Clicks the Job    ${JobFormTitle}
    Clicks the Salary    ${SalaryFormTitle}
    Clicks the Report-To    ${ReportToFormTitle}
    Clicks the Qualifications    ${QualificationsFormTitle}
    Clicks the Memberships    ${MembershipsFormTitle}