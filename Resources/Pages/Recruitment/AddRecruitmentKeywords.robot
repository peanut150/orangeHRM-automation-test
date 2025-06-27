*** Settings ***
Library          SeleniumLibrary
Library          FakerLibrary    locale=en_PH
Variables        ../../Locators/Locators.py

*** Keywords ***
Clicks add button
    Click Button    ${btn_addCandidate}
    
Enters valid firstname
    ${Firstname}=    FakerLibrary.First Name
    Input Text       ${txt_candidateFirstname}    ${Firstname}
    Sleep            0.5

Enters valid middlename
    ${MiddleName}=    FakerLibrary.Last Name
    Input Text       ${txt_candidateMiddlename}    ${MiddleName}
    Sleep            0.5

Enters valid lastname
    ${Lastname}=     FakerLibrary.Last Name
    Input Text       ${txt_candidateLastname}     ${Lastname}
    Sleep            0.5

Enters valid email
    ${Email}=        FakerLibrary.Email
    Input Text       ${txt_email}                 ${Email}
    Sleep            0.5
    
Enters valid contact number
    ${ContactNumber}=    FakerLibrary.Mobile Number
    Input Text           ${txt_contactNumber}    ${ContactNumber}
    Sleep                0.5

Enters invalid contact number
    ${ContactNumber}=    FakerLibrary.Random Letters    length=10
    ${InvalidContact}=   Evaluate                       "".join(${ContactNumber})    modules=builtins
    Input Text           ${txt_contactNumber}           ${InvalidContact}
    Sleep                0.5

Uploads resume
    ${ResumeFilePath}=    Evaluate    os.path.normpath(r'${CURDIR}/../../TestData/resume.pdf')    modules=os
    Choose File    ${btn_browseResume}   ${ResumeFilePath}
    Sleep          0.5

Enters keywords
    ${GeneratedKeywords}=    FakerLibrary.Words    nb=10
    ${Keywords}=             Evaluate              ", ".join(${GeneratedKeywords})    modules=builtins
    Input Text      ${txt_keywords}    ${Keywords}
    Sleep           0.5

#Click Previous Month Calendar
#    Wait Until Element Is Visible    ${calendar_dateOfApplication}
#    Click Element                    ${btn_prevMonthCalendar}
#    Sleep                            0.5
#
#Click Next Month Calendar
#    Wait Until Element Is Visible    ${calendar_dateOfApplication}
#    Click Element                    ${btn_nextMonthCalendar}
#    Sleep                            0.5
    
Selects date of application
    [Arguments]    ${ExpectedDate}
    Click Element    ${btn_dateOfApplication}
    Sleep    0.5
    Wait Until Element Is Visible    ${calendar_dateOfApplication}
    Execute Javascript    window.scrollBy(0, 300)
#    Sleep    0.5
#    Click Previous Month Calendar
#    Sleep    0.5
#    Click Next Month Calendar
    Sleep    0.5
    Click Element    ${btn_pickDayCalendar}
    Wait Until Element Is Visible    ${btn_selectedDayCalendar}
    Sleep    1
    ${ChosenDate}=    Get Element Attribute     ${btn_afterDateSelectionCal}    value
    Should Be Equal As Strings    ${ChosenDate}    ${ExpectedDate}
    Sleep    0.5

Enters notes
    ${Sentences}=     FakerLibrary.Sentences
    ${Notes}    Evaluate    " ".join(${Sentences})    modules=builtins
    Input Text    ${txt_notes}    ${Notes}
    Sleep         0.5
    
Agrees to keep data
    Click Element    ${radio_dataConsent}
    Sleep            0.5

Enters invalid email
    ${InvalidEmail}=        FakerLibrary.Bothify    text=??????.??????
    Input Text              ${txt_email}    ${InvalidEmail}
    Sleep                   0.5
    
Leaves the firstname field empty
    Input Text    ${txt_candidateFirstname}    ${EMPTY}
    Sleep         0.5

Leaves the lastname field empty
    Input Text    ${txt_candidateLastname}    ${EMPTY}
    Sleep         0.5

Leaves the email field empty
    Input Text    ${txt_email}    ${EMPTY}
    Sleep         0.5

Selects vacancy
    Click Element    ${drp_vacancy}
    Sleep    0.5
    Wait Until Element Is Visible    ${selectOptionsContainer}
    ${Options}=    Get Webelements    ${selectIndividOptions}
    ${CountOptions}=    Get Length    ${Options}
    ${Index}=    Evaluate    random.randint(0, ${CountOptions} - 1)    modules=random
    ${RandomVacancy}=    Get Text    ${Options}[${Index}]
    Click Element    xpath://div[@role="option"]//span[normalize-space(.)="${RandomVacancy}"]
    Sleep    0.5

Clicks the save button
    Scroll Element Into View    ${btn_saveCandidate}
    Sleep                       0.5
    Click Button                ${btn_saveCandidate}

Clicks the cancel button
    Scroll Element Into View    ${btn_cancelAddCandidate}
    Sleep                       0.5
    Click Button                ${btn_cancelAddCandidate}

Candidate should be added
    [Arguments]    ${SuccessAddCandidateTxt}
    Element Text Should Be    ${txt_successCandidateAdding}    ${SuccessAddCandidateTxt}
    Sleep    3
    
Firstname required error should display
    [Arguments]    ${RequiredErrorTxt}
    Execute Javascript        window.scrollTo(0,-document.body.scrollHeight)
    Element Text Should Be    ${txt_firstnameRequiredError}    ${RequiredErrorTxt}
    Sleep    1

Lastname required error should display
    [Arguments]    ${RequiredErrorTxt}
    Execute Javascript        window.scrollTo(0,-document.body.scrollHeight)
    Element Text Should Be    ${txt_lastnameRequiredError}    ${RequiredErrorTxt}
    Sleep    1

Email required error should display
    [Arguments]    ${RequiredErrorTxt}
    Scroll Element Into View  ${txt_emailRequiredError}
    Element Text Should Be    ${txt_emailRequiredError}    ${RequiredErrorTxt}
    Sleep    1
    
All required errors should display
    [Arguments]    ${RequiredErrorTxt}
    Execute Javascript          window.scrollTo(0,-document.body.scrollHeight)
    Sleep                       3
    Scroll Element Into View    ${txt_emailRequiredError}
    Element Text Should Be      ${txt_firstnameRequiredError}    ${RequiredErrorTxt}
    Element Text Should Be      ${txt_lastnameRequiredError}     ${RequiredErrorTxt}
    Element Text Should Be      ${txt_emailRequiredError}        ${RequiredErrorTxt}  
    Sleep                       3

Expected format for email should display
    [Arguments]    ${ExpectedEmailFormatErrorTxt}
    Scroll Element Into View    ${txt_emailRequiredError}
    Element Text Should Be      ${txt_emailRequiredError}        ${ExpectedEmailFormatErrorTxt}
    Sleep                       3
    
Contact number error should display
    [Arguments]    ${ErrorText}
    Wait Until Element Is Visible    ${txt_contactNumberError}
    Scroll Element Into View         ${txt_contactNumberError}
    Element Text Should Be           ${txt_contactNumberError}    ${ErrorText}
    Sleep                            2