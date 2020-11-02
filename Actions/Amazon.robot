*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${Browser_Amazon} =             https://www.amazon.de/
${Amazon_Echo} =                xpath=//*[contains(text(),'Der neue Echo (4. Generation) |')]


*** Keywords ***

Search amazon echo 4 gen in amazon website and change the color to white
  [Documentation]  Open ultimateqa website and complete both the forms by submitting and verfy whether the submittion was successfull
    Open Browser                         ${Browser_Amazon}     Chrome
    Wait Until Page Contains Element     id=nav-logo-sprites
    Maximize Browser Window

   #  Accepting the cookie
    Click Element                        id=sp-cc-accept

   #  Search the amazon echo device
    Input text                           id=twotabsearchtextbox      Amazon echo 4th generation
    Click Element                        id=nav-search-submit-text
    Click Element                        xpath=//*[contains(text(),'Amazon Echo')]

   #  Click the Neue Echo 4 Gen device
    Wait Until Page Contains Element     ${Amazon_Echo}
    Scroll Element Into View             ${Amazon_Echo}
    Click Element                        ${Amazon_Echo}
    Wait Until Page Contains             Der neue Echo (4. Generation)

   #  Change the color to White and Verify whether its changed successfully
    Click Button                         id=a-autoid-35-announce
    Element Text Should Be               xpath=//*[@id="variation_color_name"]/div/span     Weiß