*** Settings ***
Library        SeleniumLibrary

*** Keywords ***
Toast Message Display
    [Arguments]    ${ToastMessage}
    Wait Until Page Contains    ${ToastMessage}
    Page Should Contain         ${ToastMessage}
    Sleep                       2