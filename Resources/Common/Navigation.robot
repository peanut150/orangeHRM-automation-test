*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/Locators.py

*** Keywords ***
User Navigates to Admin Page
    [Arguments]    ${SiteUrl}    ${AdminNavbarTitle}
    Click Element    ${link_adminPage}
    Wait Until Location Is    ${SiteUrl}
    Wait Until Element Is Visible    ${txt_navTitle}
    Location Should Be    ${SiteUrl}
    Element Text Should Be    ${txt_navTitle}    ${AdminNavbarTitle}
    Sleep    2

User Navigates to PIM Page
    [Arguments]    ${SiteUrl}    ${NavbarTitle}
    Click Element    ${link_pimPage}
    Wait Until Location Is    ${SiteUrl}
    Wait Until Element Is Visible    ${txt_navTitle}
    Location Should Be    ${SiteUrl}
    Element Text Should Be    ${txt_navTitle}    ${NavbarTitle}
    Sleep    2

User Navigates to Leave Page
    [Arguments]    ${SiteUrl}    ${NavbarTitle}
    Click Element    ${link_leavePage}
    Wait Until Location Is    ${SiteUrl}
    Wait Until Element Is Visible    ${txt_navTitle}
    Location Should Be    ${SiteUrl}
    Element Text Should Be    ${txt_navTitle}    ${NavbarTitle}
    Sleep    2

User Navigates to Time Page
    [Arguments]    ${SiteUrl}    ${NavbarTitle}
    Click Element    ${link_timePage}
    Wait Until Location Is    ${SiteUrl}
    Wait Until Element Is Visible    ${txt_navTitle}
    Location Should Be    ${SiteUrl}
    Element Text Should Be    ${txt_navTitle}    ${NavbarTitle}
    Sleep    2

User Navigates to Recruitment Page
    [Arguments]    ${SiteUrl}    ${NavbarTitle}
    Click Element    ${link_recruitmentPage}
    Wait Until Location Is    ${SiteUrl}
    Wait Until Element Is Visible    ${txt_navTitle}
    Location Should Be    ${SiteUrl}
    Element Text Should Be    ${txt_navTitle}    ${NavbarTitle}
    Sleep    2

User Navigates to My Info Page
    [Arguments]    ${NavbarTitle}
    Click Element    ${link_myinfoPage}
    Wait Until Element Is Visible    ${txt_navTitle}
    Element Text Should Be    ${txt_navTitle}    ${NavbarTitle}
    Sleep    2

User Navigates to Performance Page
    [Arguments]    ${SiteUrl}    ${NavbarTitle}
    Click Element    ${link_performancePage}
    Wait Until Location Is    ${SiteUrl}
    Wait Until Element Is Visible    ${txt_navTitle}
    Location Should Be    ${SiteUrl}
    Element Text Should Be    ${txt_navTitle}    ${NavbarTitle}
    Sleep    2

User Navigates to Dashboard Page
    [Arguments]    ${SiteUrl}    ${NavbarTitle}
    Click Element    ${link_dashboardPage}
    Wait Until Location Is    ${SiteUrl}
    Wait Until Element Is Visible    ${txt_navTitle}
    Location Should Be    ${SiteUrl}
    Element Text Should Be    ${txt_navTitle}    ${NavbarTitle}
    Sleep    2

User Navigates to Directory Page
    [Arguments]    ${SiteUrl}    ${NavbarTitle}
    Click Element    ${link_directoryPage}
    Wait Until Location Is    ${SiteUrl}
    Wait Until Element Is Visible    ${txt_navTitle}
    Location Should Be    ${SiteUrl}
    Element Text Should Be    ${txt_navTitle}    ${NavbarTitle}
    Sleep    2

User Navigates to Maintenance Page
    [Arguments]    ${SiteUrl}    ${NavbarTitle}
    Click Element    ${link_maintenancePage}
    Wait Until Location Is    ${SiteUrl}
    Wait Until Element Is Visible    ${txt_navTitle}
    Location Should Be    ${SiteUrl}
    Element Text Should Be    ${txt_navTitle}    ${NavbarTitle}
    Sleep    2

User Navigates to Claim Page
    [Arguments]    ${SiteUrl}    ${NavbarTitle}
    Click Element    ${link_claimPage}
    Wait Until Location Is    ${SiteUrl}
    Wait Until Element Is Visible    ${txt_navTitle}
    Location Should Be    ${SiteUrl}
    Element Text Should Be    ${txt_navTitle}    ${NavbarTitle}
    Sleep    2

User Navigates to Buzz Page
    [Arguments]    ${SiteUrl}    ${NavbarTitle}
    Click Element    ${link_buzzPage}
    Wait Until Location Is    ${SiteUrl}
    Wait Until Element Is Visible    ${txt_navTitle}
    Location Should Be    ${SiteUrl}
    Element Text Should Be    ${txt_navTitle}    ${NavbarTitle}
    Sleep    2