*** Settings ***
Library          SeleniumLibrary
Library          FakerLibrary    locale=en_PH
Variables        ../../Locators/Locators.py
Resource         ../../Common/Navigation.robot

*** Keywords ***
User access the site
    [Arguments]        ${SiteUrl}        ${Browser}
    Open Browser       ${SiteUrl}        ${Browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    5

User enters correct username
    [Arguments]        ${Username}
    Input Text         ${txt_loginUsername}        ${Username}
    Sleep              0.5
    
User enters correct password
    [Arguments]        ${Password}
    Input Text         ${txt_loginPassword}        ${Password}
    Sleep              0.5
    
User clicks login button
    Click Button       ${btn_login}

User should redirect to dashboard
    [Arguments]               ${DashboardUrl}       ${DashNavbar}
    User Navigates To Dashboard Page    ${DashboardUrl}    ${DashNavbar}
    
User enters incorrect username
    ${Username}=       FakerLibrary.Username
    ${IncorrectUsername}=   Evaluate    '''${Username}'''[:random.randint(5, 40)]    modules=random
    Input Text         ${txt_loginUsername}        ${IncorrectUsername}
    Sleep              0.5
    
User enters incorrect password
    ${Password}=       FakerLibrary.Password       length=10    special_chars=True    digits=True    upper_case=True    lower_case=True
    Input Text         ${txt_loginPassword}        ${Password}
    Sleep              0.5
    
User enters incorrect username and password
    User Enters Incorrect Username
    User Enters Incorrect Password

Invalid credentials error should show
    [Arguments]               ${InvalidCredsErr}
    Element Text Should Be    ${txt_invalidCredentials}    ${InvalidCredsErr}
    Sleep                     3

User leaves the username field empty
    Input Text         ${txt_loginUsername}        ${EMPTY}
    Sleep              0.5
    
User leaves the password field empty
    Input Text         ${txt_loginPassword}        ${EMPTY}
    Sleep              0.5
    
User leaves username and password fields empty
    User Leaves The Username Field Empty
    User Leaves The Password Field Empty

Username required error should show
    [Arguments]    ${TxtRequiredErr}
    Element Text Should Be    ${txt_requiredUser}    ${TxtRequiredErr}

Password required error should show
    [Arguments]    ${TxtRequiredErr}
    Element Text Should Be    ${txt_requiredPass}    ${TxtRequiredErr}

Both required error should show
    [Arguments]    ${TxtRequiredErr}
    Username Required Error Should Show    ${TxtRequiredErr}
    Password Required Error Should Show    ${TxtRequiredErr}
    Sleep                     3
    
User Successfully Logs In
    [Arguments]    ${Username}    ${Password}    ${PageUrl}    ${NavbarTitle}
    User Enters Correct Username    ${Username}
    User Enters Correct Password    ${Password}
    User Clicks Login Button
    User Should Redirect To Dashboard    ${PageUrl}    ${NavbarTitle}