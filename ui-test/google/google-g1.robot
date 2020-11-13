*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
Test search keyword and verify result on Google
    พิมพ์ google.com
    พิมพ์ USElection2020
    กด Enter
    ตรวจสอบ Link US Election 2020 - BBC News

*** Keywords ***
พิมพ์ google.com
    Open Browser    https://www.google.com    chrome

พิมพ์ USElection2020
    Input Text    q    USElection2020

กด Enter
    Press Keys    q    RETURN

ตรวจสอบ Link US Election 2020 - BBC News
    Page Should Contain    US Election 2020 - BBC News

