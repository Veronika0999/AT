*** Settings ***
Library     Browser

*** Variables ***
${URL}          http://testovani.kitner.cz/courses
${email}        kikavo1452@darkse.com
${password}     vercaTestuje

*** Test Cases ***
Register a new user
    Registration    ${email}        ${password}

Successful login
     Login          ${email}        ${password}       yes

Unsuccessful login
     Login          ${email}        badPassword        no

*** Keywords ***
Registration
    [Arguments]     ${email}    ${password}
    New Browser     chromium        headless=false
    New Page        ${URL}
    Click           data-testid=login_link
    Click           data-testid=register_link
    Type Text       data-testid=name_input              Verca
    Type Text       data-testid=email_input             ${email}
    Type Text       data-testid=password_input          ${password}
    Type Text       data-testid=password_again_input    ${password}
    Click           data-testid=register_button
    Take Screenshot

Login
    [Arguments]     ${email}    ${password}     ${shouldBeLogin}
    New Browser     chromium        headless=false
    New Page        ${URL}
    Click           data-testid=login_link
    Type Text       data-testid=email_input         ${email}
    Type Text       data-testid=password_input      ${password}
    Click           data-testid=login_button

    IF  "${shouldBeLogin}" == "yes"
        Log To Console     User is logged in
        Get Text           data-testid=logout_button    ==     Odhlásit se
    ELSE
         Log To Console    User is not logged in
         Get Text    data-testid=login_link        ==      Přihlásit se
    END

