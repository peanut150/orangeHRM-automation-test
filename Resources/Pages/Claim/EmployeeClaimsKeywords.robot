*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary    locale=en_PH
Resource   ../../Common/Navigation.robot
Resource   ../../Utilities/JsonDataHelper.robot

*** Keywords ***
Clicks Assign Claim Button
    Click Button    ${btn_assignClaim}
    Sleep           2

Enters Employee Name
    ${EmployeeName}=    Get Random Employee Name From JSON
    Set Test Variable        ${EmployeeName}
    Input Text          ${txt_claimEmployeeName}    ${EmployeeName}
    Sleep               0.5
    
Selects Existing Employee Name
    Enters Employee Name
    ${Firstname}=    Set Variable        ${EmployeeName.split()[0]}
    ${Lastname}=    Set Variable        ${EmployeeName.split()[-1]}
    Wait Until Element Is Visible    ${drp_employeeOption}
    Wait Until Element Is Not Visible    xpath://div[@role="option" and contains(@class, "oxd-autocomplete-option")][contains(., "Searching....")]
    Click Element    xpath://div[@role="option" and contains(@class, "oxd-autocomplete-option")][contains(., "${Firstname}") and contains(., "${Lastname}")]//span
    Sleep    0.5

Selects Event
    Click Element      ${drp_claimEvent}
    Sleep              0.5
    Wait Until Element Is Visible    ${drp_claimEventOptions}
    ${Options}=    Get Webelements    ${selectIndividOptions}
    ${CountOptions}=    Get Length    ${Options}
    ${Index}=    Evaluate    random.randint(0, ${CountOptions} - 1)    modules=random
    ${RandomClaimEvent}=    Get Text    ${Options}[${Index}]
    Click Element    xpath://div[@role="option"]//span[normalize-space(.)="${RandomClaimEvent}"]
    Sleep              0.5

Selects Currency
    Click Element    ${drp_claimCurrency}
    Sleep            0.5
    Wait Until Element Is Visible    ${drp_claimCurrencyOptions}
    ${Options}=    Get Webelements    ${drp_claimCurrencyIndivOptions}
    ${CountOptions}=    Get Length    ${Options}
    ${Index}=    Evaluate    random.randint(0, ${CountOptions} - 1)    modules=random
    ${RandomCurrency}=    Get Text    ${Options}[${Index}]
    Click Element    xpath://div[@role="option"]//span[normalize-space(.)="${RandomCurrency}"]
    Sleep    0.5

Enters Remarks
    ${Sentences}=    FakerLibrary.Sentences
    ${Remarks}=      Evaluate                " ".join(${Sentences})    modules=builtins
    Input Text       ${txt_claimRemarks}     ${Remarks}
    Sleep            0.5

Clicks Create Button
    Click Button    ${btn_createClaim}
    Sleep           0.5

Assign Claim Information should Display
    [Arguments]    ${ClaimInfoTitle}
    Wait Until Element Is Visible    ${txt_claimInfoTitle}
    Element Text Should Be           ${txt_claimInfoTitle}         ${ClaimInfoTitle}
    Sleep                            2
    
Fills in All Required Fields in Claim Request Form
    [Arguments]    ${PageUrl}    ${FormTitle}
    Wait Until Location Is    ${PageUrl}
    Wait Until Element Is Visible    ${txt_claimFormTitle}
    Location Should Be    ${PageUrl}
    Element Text Should Be    ${txt_claimFormTitle}    ${FormTitle}
    Selects Existing Employee Name
    Selects Event
    Selects Currency
    Clicks Create Button
    Assign Claim Information Should Display

Fills in All Fields in Claim Request Form
    [Arguments]    ${PageUrl}    ${FormTitle}
    Wait Until Location Is    ${PageUrl}
    Wait Until Element Is Visible    ${txt_claimFormTitle}
    Location Should Be    ${PageUrl}
    Element Text Should Be    ${txt_claimFormTitle}    ${FormTitle}
    Selects Existing Employee Name
    Selects Event
    Selects Currency
    Enters Remarks
    Clicks Create Button
    Assign Claim Information Should Display