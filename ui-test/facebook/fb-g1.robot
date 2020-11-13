*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
Test search keyword and verify result on Google
    พิมพ์ facebook.com
    ใส่ Email หรือ เบอร์โทร
    ใส่ Password
    กด Enter
    ตรวจสอบชื่อ User
    ไปที่หน้าแรก
    กดช่องโพสต์ข้อความ
    ใส่ข้อความ "สวัสดี Robot Framework"
    โพสต์ข้อความ

*** Keywords ***
พิมพ์ facebook.com
    ${options}=    Evaluate  sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method     ${options}    add_argument    --disable-notifications
    Open Browser    https://www.facebook.com    chrome    options=${options}

ใส่ Email หรือ เบอร์โทร
    Input Text    email    0814573606

ใส่ Password
    Input Text    pass    an

กด Enter
    Press Keys    pass    RETURN

ตรวจสอบชื่อ User
    Page Should Contain    Bokuno Shinzou

ไปที่หน้าแรก
    Wait Until Page Contains Element    xpath://*[@id="mount_0_0"]/div/div[1]/div[1]/div[2]/div[3]/div/div[1]/div[1]/ul/li[1]/span/div/a
    Click Element    xpath://*[@id="mount_0_0"]/div/div[1]/div[1]/div[2]/div[3]/div/div[1]/div[1]/ul/li[1]/span/div/a

กดช่องโพสต์ข้อความ
    Wait Until Page Contains Element    xpath://*[@id="mount_0_0"]/div/div[1]/div[1]/div[3]/div/div/div[1]/div[1]/div/div[2]/div/div/div[3]/div/div[2]/div/div/div/div[1]/div/div[1]/span
    Click Element    xpath://*[@id="mount_0_0"]/div/div[1]/div[1]/div[3]/div/div/div[1]/div[1]/div/div[2]/div/div/div[3]/div/div[2]/div/div/div/div[1]/div/div[1]/span

ใส่ข้อความ "สวัสดี Robot Framework"
    Wait Until Page Contains    เพิ่มลงในโพสต์ของคุณ
    Press Keys    None    สวัสดี Robot Framework

โพสต์ข้อความ
    Click Element    xpath://*[@id="mount_0_0"]/div/div[1]/div[1]/div[4]/div/div/div[1]/div/div[2]/div/div/div/form/div/div[1]/div/div/div[3]/div[2]/div