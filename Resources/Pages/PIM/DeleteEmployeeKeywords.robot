*** Settings ***
Library          SeleniumLibrary
Variables        ../../Locators/Locators.py

*** Keywords ***
User clicks the delete button
    Click Element    ${btn_deleteEmployee}
    Sleep           2

Accepted alert confirmation
    Set Focus To Element    ${dialog_deleteConfirmation}
    Click Element           ${btn_confirmDelete}

Employee is deleted
    Wait Until Element Is Not Visible    ${spinner_afterDeletion}
    Sleep                                5
