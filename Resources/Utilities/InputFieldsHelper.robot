*** Settings ***
Library        SeleniumLibrary

*** Keywords ***
Field Should Be Empty
    [Arguments]    ${locator}
    ${value}=      Get Value    ${locator}
    Should Be Empty    ${value}
