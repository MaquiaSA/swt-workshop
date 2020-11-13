*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close All Browsers

*** Variables ***


*** Test Cases ***
user ซื้อของเล่นให้ลูกสาว เลือกวิธีการจัดส่งเป็น kerry ชำระเงินด้วยบัตรเครดิต visa และชำระเงินสำเร็จ
    แสดงสินค้า
    แสดงรายละเอียดสินค้า
    ระบุจำนวนสินค้าที่จะซื้อ
    นำใส่ในตะกร้า
    ยืนยันการสั่งซื้อและชำระเงินด้วยบัตรเครดิตวีซ่าคาร์ด
    ขอบคุณ

*** Keywords ***
แสดงสินค้า
    Open Browser    https://dminer.in.th/Product-list.html    chrome
    Element Should Contain    id=productName-1    expected=43 Piece Dinner Set
    Element Should Contain    id=productPrice-1    expected=12.95 USD

แสดงรายละเอียดสินค้า
    Click Button    viewMore-1
    Wait Until Page Contains    43 Piece dinner Set
    Element Should Contain    id=productName    expected=43 Piece dinner Set
    Element Should Contain    id=productBrand    expected=CoolKidz

ระบุจำนวนสินค้าที่จะซื้อ
    Input Text    id=productQuantity    1

นำใส่ในตะกร้า
    Click Button    addToCart

ยืนยันการสั่งซื้อและชำระเงินด้วยบัตรเครดิตวีซ่าคาร์ด
    Wait Until Page Contains    ยืนยันคำสั่งซื้อ
    Element Should Contain    id=receiverName    expected=ณัฐญา ชุติบุตร
    Element Should Contain    id=recevierAddress    expected=405/37 ถ.มหิดล ต.ท่าศาลา อ.เมือง จ.เชียงใหม่ 50000
    Element Should Contain    id=recevierPhonenumber    expected=0970809292
    Element Should Contain    id=totalProductPrice    expected=12.95 USD
    Element Should Contain    id=totalShippingCharge    expected=2.00 USD
    Element Should Contain    id=totalAmount    expected=14.95 USD
    Element Should Contain    id=productName-1    expected=43 Piece dinner Set
    Element Attribute Value Should Be    id=productQuantity-1    value    1
    Element Should Contain    id=productPrice-1    expected=12.95
    Click Button    confirmPayment

    Wait Until Page Contains    ยืนยันการชำระเงิน
    Input Text    cardNumber    4719700591590995
    Input Text    expiredMonth    7
    Input Text    expiredYear    20
    Input Text    cvv    752
    Input Text    cardName    Karnwat Wongudom
    Click Button    Payment

ขอบคุณ
    Wait Until Page Contains    ชำระเงินสำเร็จ
    Element Should Contain    id=title    expected=ชำระเงินสำเร็จ
    Element Should Contain    id=notify    expected=วันเวลาที่ชำระเงิน 1/3/2563 13:30:00 หมายเลขคำสั่งซื้อ 8004359103 คุณสามารถติดตามสินค้าผ่านช่องทาง Kerry ด้วยหมายเลข 1785261900
