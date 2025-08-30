*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FIRST_ITEM_ADD}       css=.inventory_item:first-child button
${CART_ICON}            css=.shopping_cart_link

*** Keywords ***
Add First Item To Cart
    Click Button    ${FIRST_ITEM_ADD}

Go To Cart
    Click Element    ${CART_ICON}
