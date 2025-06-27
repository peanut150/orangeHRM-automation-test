*** Settings ***
Library        SeleniumLibrary
Library        FakerLibrary    locale=en_PH
Variables      ../../Locators/Locators.py
Resource       ../../Utilities/JsonDataHelper.robot
Resource       ../../Common/Common.robot

*** Keywords ***
User Clicks Add Button
    Click Element    ${btn_addUser}

Selects User Role
    Click Element    ${drp_userRoleAddUser}
    Sleep            0.5
    Wait Until Element Is Visible    ${selectOptionsContainer}
    ${Options}=    Get Webelements    ${selectIndividOptions}
    ${CountOptions}=    Get Length    ${Options}
    ${Index}=    Evaluate    random.randint(0, ${CountOptions} - 1)    modules=random
    ${RandomUserRole}=    Get Text    ${Options}[${Index}]
    Click Element    xpath://div[@role="option"]//span[normalize-space(.)="${RandomUserRole}"]
    Sleep    0.5

Enters Employee Name
    ${EmployeeName}=    Get Random Employee Name From JSON
    Set Test Variable        ${EmployeeName}
    Input Text          ${input_employeeNameAddUser}    ${EmployeeName}
    Sleep               0.5

Selects Existing Employee Name
    Enters Employee Name
    ${Firstname}=    Set Variable        ${EmployeeName.split()[0]}
    ${Lastname}=    Set Variable        ${EmployeeName.split()[-1]}
    Wait Until Element Is Not Visible    xpath://div[@role="option" and contains(@class, "oxd-autocomplete-option")][contains(., "Searching....")]
    Click Element    xpath://div[@role="option" and contains(@class, "oxd-autocomplete-option")][contains(., "${Firstname}") and contains(., "${Lastname}")]//span
    Sleep    0.5

Selects Status
    Click Element    ${drp_statusAddUser}
    Sleep            0.5
    Wait Until Element Is Visible    ${selectOptionsContainer}
    ${Options}=    Get Webelements    ${selectIndividOptions}
    ${CountOptions}=    Get Length    ${Options}
    ${Index}=    Evaluate    random.randint(0, ${CountOptions} - 1)    modules=random
    ${RandomUserRole}=    Get Text    ${Options}[${Index}]
    Click Element    xpath://div[@role="option"]//span[normalize-space(.)="${RandomUserRole}"]
    Sleep    0.5
    
Enters Username
    ${Username}=    FakerLibrary.Username
    ${ValidUsername}=   Evaluate    '''${Username}'''[:random.randint(5, 40)]    modules=random
    Input Text      ${input_usernameAddUser}    ${ValidUsername}
    Sleep           0.5

Enters Password
    ${Password}=         FakerLibrary.Password    length=10    special_chars=True    digits=True    upper_case=True    lower_case=True
    Set Test Variable    ${Password}
    Input Text           ${input_passwordAddUser}    '''${Password}'''
    Sleep                0.5
    
Enters Confirm Password
    Input Text      ${input_confirmPassAddUser}    '''${Password}'''
    Sleep    1
    Should Be Equal As Strings    '''${Password}'''    '''${Password}'''
    Sleep           0.5

Fills All Fields in the Form
    Selects User Role
    Selects Existing Employee Name
    Selects Status
    Enters Username
    Enters Password
    Enters Confirm Password

Clicks the Save Button
    Click Button    ${btn_saveAddUser}

User should be Added
    [Arguments]    ${ToastMessage}
    Toast Message Display    ${ToastMessage}