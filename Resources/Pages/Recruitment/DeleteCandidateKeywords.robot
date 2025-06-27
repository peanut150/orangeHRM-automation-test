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
    ${Candidate}=             Get Text           xpath=(${rows_user})[${Index}]//div[@class="oxd-table-cell oxd-padding-cell"][1]
    Set Test Variable        ${Candidate}
    Scroll Element Into View    (${btn_deleteUser})[${Index}]

User Clicks the Delete Button
    Get Random Row Elements
    Click Element               (${btn_deleteUser})[${Index}]
    Sleep                       2

Confirms Deletion
    Wait Until Element Is Visible    ${dialog_candidateDelete}
    Sleep                            1
    Click Element                    ${btn_candidateDeleteConfirm}

Cancels Deletion
    Wait Until Element Is Visible    ${dialog_candidateDelete}
    Sleep                            1
    Click Element                    ${btn_candidateDeleteCancel}

Clicks the Close Button
    Wait Until Element Is Visible    ${dialog_candidateDelete}
    Sleep                            1
    Click Element                    ${btn_candidateCloseDialog}

Candidate should be Deleted
    [Arguments]    ${ToastMessage}
    Toast Message Display    ${ToastMessage}

Candidate should not be Deleted
    Scroll Element Into View    xpath=//div[@role="row" and contains(., "${Candidate}")]
    Sleep                       2
    Element Should Contain      xpath=//div[@role="row"]    ${Candidate}
    Sleep                       2