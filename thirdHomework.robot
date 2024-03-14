*** Settings ***
Library  Browser

*** Variables ***
${URL}      http://testovani.kitner.cz/courses

*** Test Cases ***
Prihlaseni bad login
    Login               dsadsad@sdas.cz                     dasdas
    Uzivatel neni prihlasen

Prihlaseni bad heslo
    Login               radek.tester@seznam.cz              dasdas
    Uzivatel neni prihlasen

Prihlaseni success
    Login               giyipem264@v1zw.com                 tajnenovak
    Uzivatel je prihlasen


*** Keywords ***
# Cílem úkolu je doplnit toto klíčové slovo tak aby všechny testy prošly
Login
    [Arguments]     ${email}      ${heslo}
    log             ${email}
    log             ${heslo}

    New Browser     chromium        headless=false
    New Page        http://testovani.kitner.cz/courses
    Get Title       *=      Testování

    Click           data-test=login_link
    Type Text       id=email_input              ${email}
    Type Text       css=#password_input         ${heslo}
    Click           data-test=login_button

Uzivatel je prihlasen
       Get Text   data-test=logout_button    ==    Odhlásit se       # AssertPoz1
       Get Url                               ==    ${URL}            # AssertPoz2
       Take Screenshot

Uzivatel neni prihlasen
       Get Text   data-test=login_link       ==    Přihlásit se       # AssertNeg1
       Get Url                               !=    ${URL}             # AssertNeg2
       Take Screenshot