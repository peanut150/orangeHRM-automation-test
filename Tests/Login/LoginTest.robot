*** Settings ***
Documentation        LoginTest
Library              SeleniumLibrary
Variables            ../../Resources/TestData/Testdata.py
Resource             ../../Resources/Pages/Login/LoginKeywords.robot
Test Teardown  Close Browser

*** Test Cases ***
Verify Successful Login
    [Tags]    login    good-case
    Given user access the site    ${SiteUrl}    ${Browser}
    When user enters correct username    ${Username}
    And user enters correct password    ${Password}
    And user clicks login button
    Then user should redirect to dashboard    ${DashboardUrl}    ${DashNavbarTitle}

Incorrect Username
    [Tags]    login    bad-case
    Given user access the site    ${SiteUrl}    ${Browser}
    When user enters incorrect username
    But user enters correct password    ${Password}
    And user clicks login button
    Then Invalid credentials error should show    ${InvalidCredentialsError}

Incorrect Password
    [Tags]    login    bad-case
    Given user access the site    ${SiteUrl}    ${Browser}
    When user enters correct username    ${Username}
    But user enters incorrect password
    And user clicks login button
    Then Invalid credentials error should show    ${InvalidCredentialsError}

Incorrect Username and Password
    [Tags]    login    bad-case
    Given user access the site    ${SiteUrl}    ${Browser}
    When user enters incorrect username and password
    And user clicks login button
    Then Invalid credentials error should show    ${InvalidCredentialsError}

Empty Username
    [Tags]    login    bad-case
    Given user access the site    ${SiteUrl}    ${Browser}
    When user leaves the username field empty
    But user enters correct password    ${Password}
    And user clicks login button
    Then username required error should show    ${RequiredErrorText}

Empty Password
    [Tags]    login    bad-case
    Given user access the site    ${SiteUrl}    ${Browser}
    When user enters correct username    ${Username}
    But user leaves the password field empty
    And user clicks login button
    Then password required error should show    ${RequiredErrorText}

Empty Username and Password
    [Tags]    login    bad-case
    Given user access the site    ${SiteUrl}    ${Browser}
    When user leaves username and password fields empty
    And user clicks login button
    Then both required error should show    ${RequiredErrorText}