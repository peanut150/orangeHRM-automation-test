*** Settings ***
Library              SeleniumLibrary
Library              FakerLibrary    locale=en_PH
Variables            ../../Locators/Locators.py
Resource             ../../Utilities/JsonDataHelper.robot

*** Keywords ***
User clicks add button
    Click Button    ${btn_addEmployee}
    Sleep           3
    
User enters valid first name
    ${FirstName}=      FakerLibrary.first_name
    Set Test Variable  ${FirstName}
    Input Text         ${txt_employeeFirstname}        ${FirstName}
    Sleep              0.5
    
User enters valid middle name
    ${MiddleName}=     FakerLibrary.Last Name
    Input Text         ${txt_employeeMiddlename}      ${MiddleName}
    Sleep              0.5
    
User enters valid last name
    ${LastName}=       FakerLibrary.Last Name
    Set Test Variable  ${LastName}
    Input Text         ${txt_employeeLastname}        ${LastName}
    Sleep              0.5
    
User uploads a profile picture
    Choose File    ${btn_uploadProfilePic}    ${CURDIR}\..\TestData\profile.jpg
    Sleep          0.5

Employee ID does not exist
    Element Should Not Be Visible    ${txt_idAlreadyExistsError}
    
User clicks save button
    Click Button    ${btn_saveEmployee}

Employee info is added
    [Arguments]               ${PersonalDetailsFormHeader}
    Element Text Should Be    ${txt_personalDetailsFormHeader}    ${PersonalDetailsFormHeader}
    Save Employee Name To JSON    ${FirstName}    ${LastName}
    Sleep                     3