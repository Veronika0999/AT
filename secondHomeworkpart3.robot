*** Settings ***
Library     OperatingSystem

*** Variables ***
${help xcopy}       Copies files and directory trees.
${ping}             Reply from
${ipconfik}         'ipconfik' is not recognized as an internal or external command
${badcd}            The system cannot find the path specified.

*** Test Cases ***
First positive test

    ${res}          Run         help xcopy
    log             ${res}
    Should Contain  ${res}      ${help xcopy}

Second positive test

    ${res}          Run         ping www.google.com
    log             ${res}
    Should Contain  ${res}      ${ping}

First negative test
    ${res}            Run       ipconfik
    log               ${res}
    Should Contain    ${res}    ${ipconfik}

Second negative test
    ${res}            Run       cd ./soubor/
    log               ${res}
    Should Contain    ${res}    ${badcd}
