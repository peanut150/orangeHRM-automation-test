*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections

*** Keywords ***
Save Employee Name to JSON
    [Arguments]    ${FirstName}    ${LastName}
    ${Fullname}=    Set Variable    ${FirstName} ${LastName}
    ${Path}=    Set Variable     ${OUTPUT DIR}${/}employee_data.json
    
    ${Exists}=    Run Keyword And Return Status    File Should Exist    ${Path}
    Run Keyword If    not ${Exists}    Create File    ${Path}    []
    
    ${Content}=    Get File    ${Path}
    ${List}=       Evaluate    json.loads('''${Content}''')    modules=json

    Append To List    ${List}    ${Fullname}
    ${Json}=    Evaluate    json.dumps(${List}, indent=2)    modules=json
    Create File    ${Path}    ${Json}

Get Random Employee Name from JSON
    ${Path}=    Set Variable    ${OUTPUT DIR}${/}employee_data.json
    ${Content}=    Get File    ${Path}
    ${Data}=    Evaluate    json.loads("""${Content}""")    modules=json
    ${Index}=    Evaluate    random.randint(0, len(${Data}) - 1)    modules=random
    ${RandomEmployee}=    Get From List    ${Data}    ${Index}
    RETURN    ${RandomEmployee}

Get Random Username from JSON
    ${Path}=    Set Variable    ${OUTPUT DIR}${/}employee_username.json
    ${Content}=    Get File    ${Path}
    ${Data}=    Evaluate    json.loads("""${Content}""")    modules=json
    ${Index}=    Evaluate    random.randint(0, len(${Data}) - 1)    modules=random
    ${RandomEmployee}=    Get From List    ${Data}    ${Index}
    RETURN    ${RandomEmployee}