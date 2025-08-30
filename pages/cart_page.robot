*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CART_ITEM}           css=.cart_item
${REMOVE_BUTTON}       css=.cart_item button
${CHECKOUT_BUTTON}     id=checkout
${FIRST_NAME_INPUT}    id=first-name
${LAST_NAME_INPUT}     id=last-name
${ZIP_CODE_INPUT}      id=postal-code
${CONTINUE_BUTTON}     id=continue
${FINISH_BUTTON}       id=finish
${ERROR_MESSAGE}       css=.error-message-container h3

*** Keywords ***
Cart Should Contain Items
    [Arguments]    ${expected_count}
    ${count}=    Get Element Count    ${CART_ITEM}
    Should Be Equal As Integers    ${count}    ${expected_count}

Remove First Item From Cart
    Wait Until Element Is Visible    ${REMOVE_BUTTON}    15s
    Click Button    ${REMOVE_BUTTON}

Proceed To Checkout
    Wait Until Element Is Visible    ${CHECKOUT_BUTTON}    15s
    Click Button    ${CHECKOUT_BUTTON}

Input Checkout Info
    [Arguments]    ${first}    ${last}    ${zip}
    Input Text    ${FIRST_NAME_INPUT}    ${first}
    Input Text    ${LAST_NAME_INPUT}    ${last}
    Input Text    ${ZIP_CODE_INPUT}     ${zip}

Continue Checkout
    Click Button    ${CONTINUE_BUTTON}

Finish Checkout
    Click Button    ${FINISH_BUTTON}

Get Checkout Error
    ${error}=    Get Text    ${ERROR_MESSAGE}
    [Return]    ${error}

Fill Checkout Form
    [Arguments]    ${first_name}    ${last_name}    ${zip_code}
    Wait Until Element Is Visible    ${FIRST_NAME_INPUT}    10s
    Scroll Element Into View         ${FIRST_NAME_INPUT}
    Wait Until Element Is Enabled    ${FIRST_NAME_INPUT}    10s
    Input Text    ${FIRST_NAME_INPUT}    ${first_name}

    Wait Until Element Is Visible    ${LAST_NAME_INPUT}    10s
    Scroll Element Into View         ${LAST_NAME_INPUT}
    Wait Until Element Is Enabled    ${LAST_NAME_INPUT}    10s
    Input Text    ${LAST_NAME_INPUT}     ${last_name}

    Wait Until Element Is Visible    ${ZIP_CODE_INPUT}    10s
    Scroll Element Into View         ${ZIP_CODE_INPUT}
    Wait Until Element Is Enabled    ${ZIP_CODE_INPUT}    10s
    Input Text    ${ZIP_CODE_INPUT}      ${zip_code}

    Wait Until Element Is Visible    ${CONTINUE_BUTTON}    10s
    Scroll Element Into View         ${CONTINUE_BUTTON}
    Click Button   ${CONTINUE_BUTTON}

Verify Checkout Successful
    Wait Until Element Is Visible    ${FINISH_BUTTON}    10s
    Click Button   ${FINISH_BUTTON}
    Page Should Contain    Thank you for your order!