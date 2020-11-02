*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${Browser_Sauce} =              http://www.saucedemo.com
${User_Name} =                  id=user-name
${Password} =                   id=password
${Login} =                      id=login-button
${Add_to_Basket} =              xpath=//*[@id="inventory_item_container"]/div/div/div/button
${Back_Button} =                xpath=//*[@id="inventory_item_container"]/div/button
${Item1_PostOrder} =            xpath=//*[@id="item_4_title_link"]/div
${Item2_PostOrder} =            xpath=//*[@id="item_5_title_link"]/div

*** Keywords ***
Login as a standard user in saucedemo and complete checkout with 2 items
  [Documentation]  Open SauceDemo website and check out 2 orders providing all required information
    Open Browser                        ${Browser_Sauce}     Chrome
    Maximize Browser Window
    Wait Until Page Contains Element    ${Login}

  #  Login with valid standard id
    Input text                           ${User_Name}      standard_user
    Input Password                       ${Password}       secret_sauce
    Click Element                        ${Login}

  #  Get the item 1 info and add it to basket
    ${Item1} =	    Get Text	         id=item_4_title_link
    Click Element                        id=item_4_title_link
    Click Element                        ${Add_to_Basket}
    Click Element                        ${Back_Button}

  #  Get the item 2 info and add it to basket
    ${Item2} =	    Get Text	         id=item_5_title_link
    Click Element                        id=item_5_title_link
    Click Element                        ${Add_to_Basket}
    Click Element                        ${Back_Button}

  #  Verify whether 2 items have added to basket and proceed to checkout
    Element Text Should Be               xpath=//*[@id="shopping_cart_container"]/a/span       2
    Click Element                        id=shopping_cart_container

  #  Confirm the basket list with previously saved item info and verify the quantity
    Element Text Should Be               ${Item1_PostOrder}      ${Item1}
    Element Text Should be               xpath=//*[@id="cart_contents_container"]/div/div[1]/div[3]/div[1]     1
    Element Text Should Be               ${Item2_PostOrder}      ${Item2}
    Element Text Should be               xpath=//*[@id="cart_contents_container"]/div/div[1]/div[4]/div[1]     1
    Click Element                        xpath=//*[@id="cart_contents_container"]/div/div[2]/a[2]

  #  Provide Contact information for billing and continue
    Input Text                           id=first-name     test
    Input Text                           id=last-name     test
    Input Text                           id=postal-code     12345
    Click Element                        xpath=//*[@id="checkout_info_container"]/div/form/div[2]/input

  #  Reconfirm the Order list and get the Total price and then complete the order and verify the order confirmation
    Element Text Should Be               ${Item1_PostOrder}      ${Item1}
    Element Text Should Be               ${Item2_PostOrder}      ${Item2}
    ${Total Price} =	    Get Text	 xpath=//*[@id="checkout_summary_container"]/div/div[2]/div[7]
    Click Element                        xpath=//*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]
    Page Should Contain                  THANK YOU FOR YOUR ORDER

Login as a locked user in saucedemo and verify the error message
  [Documentation]  Open SauceDemo website and verify the error message
    Open Browser                         ${Browser_Sauce}     Chrome
    Maximize Browser Window
    Wait Until Page Contains Element     ${Login}

  #  Login with locked user and verify the error message
    Input text                           ${User_Name}      locked_out_user
    Input Password                       ${Password}       secret_sauce
    Click Element                        ${Login}
    Element Text Should be               xpath=//*[@id="login_button_container"]/div/form/h3      Epic sadface: Sorry, this user has been locked out.