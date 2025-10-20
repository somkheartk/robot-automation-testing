*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common.robot

Suite Setup       Open Browser To Products Page
Suite Teardown    Close Browser

*** Test Cases ***
Products Page Should Display Correctly
    [Documentation]    ตรวจสอบว่าหน้าสินค้าแสดงผลถูกต้อง
    [Tags]    products    ui
    Page Should Contain    รายการสินค้า
    Page Should Contain Element    id:productsGrid

All Product Cards Should Be Visible
    [Documentation]    ตรวจสอบว่าแสดงการ์ดสินค้าทั้งหมด
    [Tags]    products    ui
    ${product_count}=    Get Element Count    css:.product-card
    Should Be True    ${product_count} >= 4

Search Bar Should Be Present
    [Documentation]    ตรวจสอบว่ามีช่องค้นหาสินค้า
    [Tags]    products    ui
    Page Should Contain Element    id:searchInput
    Page Should Contain Element    id:searchBtn

Search For Product By Name
    [Documentation]    ทดสอบการค้นหาสินค้าด้วยชื่อ
    [Tags]    products    search
    Input Text    id:searchInput    แล็ปท็อป
    Click Button    id:searchBtn
    Wait Until Element Is Visible    css:.product-card:nth-child(1)
    Page Should Contain    แล็ปท็อป Dell XPS 13

Search With No Results
    [Documentation]    ทดสอบการค้นหาสินค้าที่ไม่พบ
    [Tags]    products    search
    Input Text    id:searchInput    สินค้าที่ไม่มี
    Click Button    id:searchBtn
    Sleep    0.5s
    ${visible_cards}=    Get Element Count    css:.product-card[style*="display: block"]
    Should Be Equal As Numbers    ${visible_cards}    0

Add Product To Cart
    [Documentation]    ทดสอบการเพิ่มสินค้าลงตะกร้า
    [Tags]    products    cart
    Reload Page
    ${initial_count}=    Get Text    id:cartCount
    Click Button    css:.add-to-cart-btn[data-id="1"]
    Handle Alert    ACCEPT
    ${new_count}=    Get Text    id:cartCount
    Should Be True    ${new_count} > ${initial_count}

Add Multiple Products To Cart
    [Documentation]    ทดสอบการเพิ่มสินค้าหลายรายการลงตะกร้า
    [Tags]    products    cart
    Reload Page
    Click Button    css:.add-to-cart-btn[data-id="1"]
    Handle Alert    ACCEPT
    Click Button    css:.add-to-cart-btn[data-id="2"]
    Handle Alert    ACCEPT
    ${count}=    Get Text    id:cartCount
    Should Be True    ${count} >= 2

View Product Details
    [Documentation]    ทดสอบการดูรายละเอียดสินค้า
    [Tags]    products    view
    Reload Page
    Click Button    css:.view-btn[data-id="1"]
    ${alert_text}=    Handle Alert    ACCEPT
    Should Contain    ${alert_text}    รายละเอียดสินค้า
    Should Contain    ${alert_text}    แล็ปท็อป Dell XPS 13

Product Card Should Show Price
    [Documentation]    ตรวจสอบว่าการ์ดสินค้าแสดงราคา
    [Tags]    products    ui
    Page Should Contain Element    css:.product-price
    ${price}=    Get Text    css:.product-card:nth-child(1) .product-price
    Should Match Regexp    ${price}    ฿\\d+

Product Card Should Have Product Name
    [Documentation]    ตรวจสอบว่าการ์ดสินค้ามีชื่อสินค้า
    [Tags]    products    ui
    Page Should Contain Element    css:.product-name
    Element Should Not Be Empty    css:.product-card:nth-child(1) .product-name

Product Card Should Have Description
    [Documentation]    ตรวจสอบว่าการ์ดสินค้ามีคำอธิบาย
    [Tags]    products    ui
    Page Should Contain Element    css:.product-description
    Element Should Not Be Empty    css:.product-card:nth-child(1) .product-description

Add Product Button Should Be Present
    [Documentation]    ตรวจสอบว่ามีปุ่มเพิ่มสินค้าใหม่
    [Tags]    products    ui
    Page Should Contain Element    id:addProductBtn

Cart Info Should Be Visible
    [Documentation]    ตรวจสอบว่าแสดงข้อมูลตะกร้าสินค้า
    [Tags]    products    cart    ui
    Page Should Contain Element    id:cartInfo
    Page Should Contain    สินค้าในตะกร้า
    Page Should Contain Element    id:cartCount

*** Keywords ***
Element Should Not Be Empty
    [Arguments]    ${locator}
    ${text}=    Get Text    ${locator}
    Should Not Be Empty    ${text}
