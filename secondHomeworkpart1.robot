*** Settings ***
Documentation     Cvičení: práce s promennými

*** Variables ***
#Create a list of browsers
@{sezn1} =          Chrome       Edge     Firefox       Safari      Opera

*** Test Cases ***
All list items in the log
        Log Many          @{sezn1}

The second list item on the screen (in the console)
        Log To Console    ${sezn1}[1]

Verify that the item at position 0 in the list contains Chrome
        Should Contain    ${sezn1}[0]      Chrome
