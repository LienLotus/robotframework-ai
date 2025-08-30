*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USERNAME_INPUT}    id=user-name
${PASSWORD_INPUT}    id=password
${LOGIN_BUTTON}      id=login-button
${ERROR_MESSAGE}     css=.error-message-container h3

*** Keywords ***
Input Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_INPUT}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_INPUT}    ${password}

Click Login Button
    Click Button    ${LOGIN_BUTTON}

Get Login Error
    ${error}=    Get Text    ${ERROR_MESSAGE}
    [Return]    ${error}

Login As Standard User
    Input Username    standard_user
    Input Password    secret_sauce
    Click Login Button
