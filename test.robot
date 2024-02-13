*** Settings ***
Library     OperatingSystem

*** Test Cases ***

První pozitivní test

    ${result} =     Run         help xcopy
    log             ${result}
    Should Contain  ${result}   Copies files and directory trees.

Druhý pozitivní test

    ${res} =        run     ping www.google.com
    log             ${res}
    Should Contain  ${res}  Reply from

První negativní test
    ${res} =          Run       ipconfik
    log               ${res}
    Should Contain    ${res}    'ipconfik' is not recognized as an internal or external command

Druhý negativní test
    ${res} =          Run     cd ./soubor/
    log               ${res}
    Should Contain    ${res}  The system cannot find the path specified.

