*** Settings ***
Library    SeleniumLibrary
Library    helpers.custom_keywords
Library    helpers.ai_helper
Library    helpers.faker_helper
Resource   ../resources/variables.robot
Resource   ../pages/login_page.robot

Test Setup    Open Browser To URL    ${BASE_URL}    ${BROWSER}
Test Teardown    Close All Browsers Safely

*** Test Cases ***
Valid Login With Standard User
    Input Username    ${STANDARD_USER}
    Input Password    ${PASSWORD}
    Click Login Button
    Verify Title Contains    Swag Labs

Locked Out User Cannot Login
    Input Username    ${LOCKED_USER}
    Input Password    ${PASSWORD}
    Click Login Button
    ${error}=    Get Login Error
    AI Validate Text    Epic sadface: Sorry, this user has been locked out.    ${error}

Invalid Password Should Fail
    Input Username    ${STANDARD_USER}
    Input Password    wrong_pass
    Click Login Button
    ${error}=    Get Login Error
    Should Contain    ${error}    Username and password do not match
