*** Settings ***
Library    SeleniumLibrary
Library    helpers.custom_keywords
Library    helpers.ai_helper
Library    helpers.faker_helper
Resource   ../resources/variables.robot
Resource   ../pages/login_page.robot
Resource   ./pages/inventory_page.robot
Resource   ./pages/cart_page.robot

Test Setup    Open Browser To URL    ${BASE_URL}    ${BROWSER}
Test Teardown    Close All Browsers Safely

*** Test Cases ***
Add Item To Cart
    Login As Standard User
    Add First Item To Cart
    Go To Cart
    Cart Should Contain Items    1

Remove Item From Cart
    Login As Standard User
    Add First Item To Cart
    Go To Cart
    Remove First Item From Cart
    Cart Should Contain Items    0

Checkout With Fake User
    ${user}=    Generate Fake User
    Login As Standard User
    Add First Item To Cart
    Go To Cart
    Proceed To Checkout
    Fill Checkout Form    ${user["first_name"]}    ${user["last_name"]}    ${user["zip_code"]}
    Verify Checkout Successful