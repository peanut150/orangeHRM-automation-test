*** Settings ***
Library        SeleniumLibrary
Variables      ../../Locators/Locators.py
Resource       ../../Utilities/JsonDataHelper.robot

*** Keywords ***
User Enters Username
    ${RandomUsername}=    Get Random Username from JSON
    Input Text            ${input_systemUsername}    ${RandomUsername}
    Sleep                 0.5

User Selects User Role
    Click Element    ${drp_userRole}
    Sleep            0.5
    Wait Until Element Is Visible    ${selectOptionsContainer}
    ${Options}=    Get Webelements    ${selectIndividOptions}
    ${CountOptions}=    Get Length    ${Options}
    ${Index}=    Evaluate    random.randint(0, ${CountOptions} - 1)    modules=random
    ${RandomUserRole}=    Get Text    ${Options}[${Index}]
    Click Element    xpath://div[@role="option"]//span[normalize-space(.)="${RandomUserRole}"]
    Sleep    0.5

User Enters Employee Name
    ${RandomEmployeeName}=    Get Random Employee Name From JSON
    Set Test Variable         ${RandomEmployeeName}
    Input Text                ${input_systemEmployeeName}    ${RandomEmployeeName}
    Sleep                     0.5

Selects Existing Employee Name
    User Enters Employee Name
    ${Firstname}=    Set Variable        ${RandomEmployeeName.split()[0]}
    ${Lastname}=    Set Variable        ${RandomEmployeeName.split()[-1]}
    Wait Until Element Is Visible    ${drp_employeeOption}
    Wait Until Element Is Not Visible    xpath://div[@role="option" and contains(@class, "oxd-autocomplete-option")][contains(., "Searching....")]
    Click Element    xpath://div[@role="option" and contains(@class, "oxd-autocomplete-option")][contains(., "${Firstname}") and contains(., "${Lastname}")]//span
    Sleep    0.5

User Selects Status
    Click Element    ${drp_status}
    Sleep            0.5
    Wait Until Element Is Visible    ${selectOptionsContainer}
    ${Options}=    Get Webelements    ${selectIndividOptions}
    ${CountOptions}=    Get Length    ${Options}
    ${Index}=    Evaluate    random.randint(0, ${CountOptions} - 1)    modules=random
    ${RandomUserRole}=    Get Text    ${Options}[${Index}]
    Click Element    xpath://div[@role="option"]//span[normalize-space(.)="${RandomUserRole}"]
    Sleep    0.5

User Filled All Fields
    User Enters Username
    User Selects User Role
    Selects Existing Employee Name
    User Selects Status

Clicks Search Button
    Click Button    ${btn_searchSystemUser}

Record should be Found
    [Arguments]    ${RecordFoundText}    ${NoRecordFoundText}
    Wait Until Element Is Visible    ${txt_searchResultHeader}
    ${ActualText}=    Get Text    ${txt_searchResultHeader}
    Should Match Regexp    ${ActualText}    ${RecordFoundText}
    Element Should Not Contain    ${txt_searchResultHeader}    ${NoRecordFoundText}
    Sleep    2

No Records Found should be Displayed
    [Arguments]    ${RecordFoundText}    ${NoRecordFoundText}
    Wait Until Element Is Visible    ${txt_searchResultHeader}
    ${ActualText}=    Get Text    ${txt_searchResultHeader}
    Should Match Regexp    ${ActualText}    ${NoRecordFoundText}
    Element Should Not Contain    ${txt_searchResultHeader}    ${RecordFoundText}
    Sleep    2