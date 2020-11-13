*** Variables ***
${URL}    https://www.google.com
${BROWSER}    chrome
${KEYWORD}    USElection2020
${EXPECTED_RESULT}    US Election 2020 - BBC News


*** Keywords ***
พิมพ์ google.com
    Open Browser    ${URL}    ${BROWSER}

พิมพ์คำค้น
    Input Text    q    ${KEYWORD}

กด Enter
    Press Keys    q    RETURN

ตรวจสอบผลการค้นหา
    Page Should Contain    ${EXPECTED_RESULT}
    Close Browser
