*** Settings ***
Documentation     Exercise on key words
...               Prepare a keyword for the calculator


*** Test Cases ***

Addition
        ${result}          Calculate    20  15  +
        Should Be Equal    ${result}    ${35}

Subtraction
        ${result}           Calculate    20    15    -
        Should Be Equal     ${result}    ${5}

Multiplication
        ${result}           Calculate    20    15    *
        Should Be Equal     ${result}    ${300}

Division
        ${result}                     Calculate            20    15    /
        ${number}                     Convert To Number    ${1.333333333333333}
        Should Be Equal As Numbers    ${number}            ${result}


*** Keywords ***

Calculate
    [Arguments]    ${numberA}  ${numberB}  ${operators}
    ${res}         Evaluate     ${numberA} ${operators} ${numberB}
    [return]       ${res}
