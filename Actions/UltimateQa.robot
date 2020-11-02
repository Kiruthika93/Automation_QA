*** Settings ***
Library  SeleniumLibrary
Library  Dialogs

*** Variables ***
${Browser_Ultimateqa} =         https://ultimateqa.com/filling-out-forms/
${Form2_Name} =                 id=et_pb_contact_name_1
${Form2_Message} =              id=et_pb_contact_message_1
${Form2_Submit} =               xpath=//*[@id="et_pb_contact_form_1"]/div[2]/form/div/button

*** Keywords ***

Successfully submit two forms in Ultimateqa website
  [Documentation]  Open ultimateqa website and complete both the forms by submitting and verfy whether the submittion was successfull
    Open Browser                         ${Browser_Ultimateqa}     Chrome
    Maximize Browser Window

  #  Form 1 data entry
    Input Text                           id=et_pb_contact_name_0           Test1
    Input Text                           id=et_pb_contact_message_0        Test Message1
    Click Element                        xpath=//*[@id="et_pb_contact_form_0"]/div[2]/form/div/button
    Wait Until Page Contains             Form filled out successfully

  #  Form 2 data entry
    Input Text                           ${Form2_Name}           Test2
    Input Text                           ${Form2_Message}        Test Message2
    ${Captcha Value}        Get Value From User    Enter Captcha value
    Input Text                           xpath=//*[@id="et_pb_contact_form_1"]/div[2]/form/div/div/p/input    ${Captcha Value}
    Click Element                        ${Form2_Submit}
    Wait Until Page Contains             Success

Assert Error message on captcha in Ultimateqa website
  [Documentation]  Open ultimateqa website and submit the form 2 by not filling the captcha value and add a assertion to the error message
    Open Browser                         ${Browser_Ultimateqa}     Chrome
    Maximize Browser Window

  # Form 2 data entry without passing captcha
    Input Text                           ${Form2_Name}           Test
    Input Text                           ${Form2_Message}        Test Message
    Click Element                        ${Form2_Submit}
    Element Text Should be               xpath=//*[@id="et_pb_contact_form_1"]/div[1]       Please, fill in the following fields:\nCaptcha