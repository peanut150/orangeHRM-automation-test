*** Settings ***
Library        SeleniumLibrary
Variables      ../../Locators/Locators.py
Resource       ../../Common/Common.robot

*** Keywords ***
Get Random Row Elements
    ${Rows}=                 Get Webelements    ${rows_user}
    ${Count}=                Get Length         ${Rows}
    ${Index}=                Evaluate           random.randint(1, ${Count})    modules=random
    Set Test Variable        ${Index}
    ${Username}=             Get Text           xpath=(${rows_user})[${Index}]//div[@class="oxd-table-cell oxd-padding-cell"][1]
    Set Test Variable        ${Username}
    Scroll Element Into View    (${btn_deleteUser})[${Index}]

User Clicks the Delete Button
    Get Random Row Elements
    Click Element               (${btn_deleteUser})[${Index}]
    Sleep                       2
    
Confirms Deletion
    Wait Until Element Is Visible    ${dialog_userDeleteConfirm}
    Sleep                            1
    Click Element                    ${btn_userConfirmDeletion}

Cancels Deletion
    Wait Until Element Is Visible    ${dialog_userDeleteConfirm}
    Sleep                            1
    Click Element                    ${btn_userCancelDeletion}

Clicks the Close Button
    Wait Until Element Is Visible    ${dialog_userDeleteConfirm}
    Sleep                            1
    Click Element                    ${btn_closeDeleteDialog}
    
Deletes their Account
    ${EmployeeName}=            Get Text           ${txt_employeeNameColumn}
    ${ProfileName}=             Get Text           ${txt_profileName}
    Should Be Equal As Strings  ${ProfileName}     ${EmployeeName}
    Scroll Element Into View    ${btn_deleteOwnAcct}
    Click Element               ${btn_deleteOwnAcct}
    Sleep                       2

User should be Deleted
    [Arguments]    ${ToastMessage}
    Toast Message Display    ${ToastMessage}

User should not be Deleted
    Scroll Element Into View    xpath=//div[@role="row" and contains(., "${Username}")]
    Sleep                       2
    Element Should Contain      xpath=//div[@role="row"]    ${Username}
    Sleep                       2
    
Cannot be Deleted Error should Display
    [Arguments]    ${ToastMessage}
    Toast Message Display    ${ToastMessage}