*** Settings ***
Documentation   Automation of the cases specified in the Case Study

Resource        ../Actions/Amazon.robot
Resource        ../Actions/SauceDemo.robot
Resource        ../Actions/UltimateQa.robot

Test Teardown  Close All Browsers

*** Test Cases ***

1. Go to amazon and search for 'Amazon echo 4th generation', Select the item (Der neue Echo) and Change it’s color to white
    [Tags]      Amazon
    Amazon.Search amazon echo 4 gen in amazon website and change the color to white

2. Login as a standard user in saucedemo and complete checkout with 2 items. Go to http://www.saucedemo.com , Login as a standard user. Add 2 items to the shopping cart. Complete the checkout
    [Tags]      Saucedemo_std
    SauceDemo.Login as a standard user in saucedemo and complete checkout with 2 items

3. Go to http://www.saucedemo.com , Login as a locked out user. Assert the error message
    [Tags]      Saucedemo_locked
    SauceDemo.Login as a locked user in saucedemo and verify the error message

4. Go to https://ultimateqa.com/filling-out-forms/ and successfully fill both forms
    [Tags]      Ultimateqa_FillingForms
    UltimateQa.Successfully submit two forms in Ultimateqa website

5. Go to https://ultimateqa.com/filling-out-forms/ and try to submit the captcha form as blank. Assert the error messages
    [Tags]      Ultimateqa_CaptchaErrors
    UltimateQa.Assert Error message on captcha in Ultimateqa website