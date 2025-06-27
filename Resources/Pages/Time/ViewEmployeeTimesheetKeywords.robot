*** Settings ***
Library        SeleniumLibrary

*** Keywords ***
User can View Employee Timesheet
    Execute Javascript        window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth'})
    Sleep                     2
    Execute JavaScript        window.scrollTo({ top: 0, behavior: 'smooth' })
    Sleep                     2