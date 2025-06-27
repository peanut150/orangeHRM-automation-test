*** Settings ***
Library        SeleniumLibrary
Library        FakerLibrary    locale=en_PH
Variables      ../../Locators/Locators.py
Resource       ../../Common/Common.robot
Resource       ../../Utilities/JsonDataHelper.robot
Resource       ../../Utilities/InputFieldsHelper.robot

*** Keywords ***
User Clicks the Edit Icon
    ${EditButtons}=    Get Webelements    ${icon_Edit}
    ${Length}=         Get Length         ${EditButtons}
    Run Keyword If     ${Length} == 0     Fail            No records available to edit
    ${Index}=          Evaluate           random.randint(0, ${Length} - 1)    modules=random
    Scroll Element Into View    ${EditButtons}[${Index}]
    Sleep    1
    Click Element      ${EditButtons}[${Index}]

User Selects User Role
    Click Element    ${drp_userRoleEditUser}
    Sleep            0.5
    Wait Until Element Is Visible    ${selectOptionsContainer}
    ${Options}=    Get Webelements    ${selectIndividOptions}
    ${CountOptions}=    Get Length    ${Options}
    ${Index}=    Evaluate    random.randint(0, ${CountOptions} - 1)    modules=random
    ${RandomUserRole}=    Get Text    ${Options}[${Index}]
    Click Element    xpath://div[@role="option"]//span[normalize-space(.)="${RandomUserRole}"]
    Sleep    0.5
    
User Enters Employee Name
    Press Keys                ${input_employeeNameEditUser}    CTRL+a    BACKSPACE
    Wait Until Keyword Succeeds    5s    30s    Field Should Be Empty    ${input_employeeNameEditUser}
    ${EmployeeName}=          Get Random Employee Name From JSON
    Set Test Variable         ${EmployeeName}
    Input Text                ${input_employeeNameEditUser}    ${EmployeeName}
    Sleep                     1

Selects Existing Employee Name
    User Enters Employee Name
    ${Firstname}=    Set Variable        ${EmployeeName.split()[0]}
    ${Lastname}=    Set Variable        ${EmployeeName.split()[-1]}
    Wait Until Element Is Visible    ${drp_employeeOption}
    Wait Until Element Is Not Visible    xpath://div[@role="option" and contains(@class, "oxd-autocomplete-option")][contains(., "Searching....")]
    Click Element    xpath://div[@role="option" and contains(@class, "oxd-autocomplete-option")][contains(., "${Firstname}") and contains(., "${Lastname}")]//span
    Sleep    0.5

User Selects Status
    Click Element    ${drp_statusEditUser}
    Sleep            0.5
    Wait Until Element Is Visible    ${selectOptionsContainer}
    ${Options}=    Get Webelements    ${selectIndividOptions}
    ${CountOptions}=    Get Length    ${Options}
    ${Index}=    Evaluate    random.randint(0, ${CountOptions} - 1)    modules=random
    ${RandomUserRole}=    Get Text    ${Options}[${Index}]
    Click Element    xpath://div[@role="option"]//span[normalize-space(.)="${RandomUserRole}"]
    Sleep    0.5

User Enters New Username
    Press Keys                ${input_usernameEditUser}    CTRL+a    BACKSPACE
    Wait Until Keyword Succeeds    5s    30s    Field Should Be Empty    ${input_usernameEditUser}
    ${Username}=    FakerLibrary.Username
    ${ValidUsername}=   Evaluate    '''${Username}'''[:random.randint(5, 40)]    modules=random
    Input Text      ${input_usernameEditUser}    ${ValidUsername}
    Sleep           0.5

User Enters New Password
    Click Element        ${radio_changePassEditUser}
    Sleep                0.5
    Wait Until Element Is Visible    ${container_passConfirmPass}
    Sleep                0.5
    ${NewPass}=          FakerLibrary.Password    length=10    special_chars=True    digits=True    upper_case=True    lower_case=True
    Set Test Variable    ${NewPass}
    Input Text           ${input_passwordEditUser}    ${NewPass}
    Sleep                0.5
    
User Enters Confirm Password
    Input Text       ${input_confirmPassEditUser}    ${NewPass}
    Should Be Equal As Strings    ${NewPass}    ${NewPass}
    Sleep    0.5

User Updates the Password
    User Enters New Password
    User Enters Confirm Password

User Updates All Fields
    User Selects User Role
    Selects Existing Employee Name
    User Selects Status
    User Enters New Username
    User Updates the Password
    User Clicks the Save Button with New Password

User Did Not Select an Existing Employee
    User Enters Employee Name
    Wait Until Element Is Visible    ${drp_employeeOption}
    Wait Until Element Is Not Visible    xpath://div[@role="option" and contains(@class, "oxd-autocomplete-option")][contains(., "Searching....")]
    Click Element    ${container_form}
    Sleep    0.5
    
No Record Found Shows in Dropdown
    Wait Until Element Is Visible    ${drp_employeeOption}
    Wait Until Element Is Visible    xpath://div[@role="option" and contains(@class, "oxd-autocomplete-option")][contains(., "No Records Found")]
    Click Element                    xpath://div[@role="option" and contains(@class, "oxd-autocomplete-option")][contains(., "No Records Found")]
    Sleep                            0.5

User Leaves the Username Empty
    Press Keys                ${input_usernameEditUser}    CTRL+a    BACKSPACE
    Wait Until Keyword Succeeds    5s    30s    Field Should Be Empty    ${input_usernameEditUser}

User Enters Less Than 7 Characters Password
    Click Element        ${radio_changePassEditUser}
    Sleep                0.5
    Wait Until Element Is Visible    ${container_passConfirmPass}
    Sleep                0.5
    ${Length}=           Evaluate    random.randint(4, 6)    modules=random
    ${NewPass}=          FakerLibrary.Password    length=${Length}    special_chars=True    digits=True    upper_case=True    lower_case=True
    Input Text           ${input_passwordEditUser}    ${NewPass}
    Sleep                0.5

User Enters Number Only Password
    Click Element        ${radio_changePassEditUser}
    Sleep                0.5
    Wait Until Element Is Visible    ${container_passConfirmPass}
    Sleep                0.5
    ${TextPass}=          FakerLibrary.Password    length=10    special_chars=True    digits=False    upper_case=True    lower_case=True
    Set Test Variable    ${TextPass}
    Input Text           ${input_passwordEditUser}    ${TextPass}
    Sleep                0.5

User Enters Only Texts Confirm Password
    Input Text       ${input_confirmPassEditUser}    ${TextPass}
    Should Be Equal As Strings    ${TextPass}    ${TextPass}
    Sleep    0.5

User Enters Only Texts Password
    User Enters Number Only Password
    User Enters Only Texts Confirm Password

User Enters None Lowercase Password
    Click Element        ${radio_changePassEditUser}
    Sleep                0.5
    Wait Until Element Is Visible    ${container_passConfirmPass}
    Sleep                0.5
    ${NoLowercasePass}=          FakerLibrary.Password    length=10    special_chars=True    digits=True    upper_case=True    lower_case=False
    Set Test Variable    ${NoLowercasePass}
    Input Text           ${input_passwordEditUser}    ${NoLowercasePass}
    Sleep                0.5

User Enters No Lowercase Confirm Password
    Input Text       ${input_confirmPassEditUser}    ${NoLowercasePass}
    Should Be Equal As Strings    ${NoLowercasePass}    ${NoLowercasePass}
    Sleep    0.5

User Enters No Lowercase Password
    User Enters None Lowercase Password
    User Enters No Lowercase Confirm Password
    
User Enters New Confirm Password
    ${ConfirmPass}=    FakerLibrary.Password    length=10    special_chars=True    digits=True    upper_case=True    lower_case=True
    Input Text       ${input_confirmPassEditUser}    ${ConfirmPass}
    Should Not Be Equal As Strings    ${NewPass}    ${ConfirmPass}
    Sleep    0.5
    
Password and Confirm Password does not Match
    User Enters New Password
    User Enters New Confirm Password

User Clicks the Save Button
    Click Button    ${btn_saveEditUser}
    
User Clicks the Save Button with New Password
    Click Button    ${btn_saveEditUserWithPass}

User Information should be Updated
    [Arguments]    ${ToastMessage}
    Toast Message Display   ${ToastMessage}
    
Invalid Error should Display
    [Arguments]    ${InvalidErrorTxt}
    Wait Until Element Is Visible    ${txt_invalidEmployeeNameError}
    Element Text Should Be    ${txt_invalidEmployeeNameError}    ${InvalidErrorTxt}
    Sleep    3
    
Required Error should Display
    [Arguments]    ${RequiredErrorText}
    Wait Until Element Is Visible    ${txt_requiredUserError}
    Element Text Should Be    ${txt_requiredUserError}    ${RequiredErrorText}
    Sleep    3
    
A Password Error Should Display
    [Arguments]    ${ErrorText}
    Wait Until Element Is Visible    ${txt_passError}
    Element Text Should Be    ${txt_passError}    ${ErrorText}
    Sleep    3

A confirm password error should display
    [Arguments]    ${ErrorText}
    Wait Until Element Is Visible    ${txt_confirmPassError}
    Element Text Should Be    ${txt_confirmPassError}    ${ErrorText}
    Sleep    3