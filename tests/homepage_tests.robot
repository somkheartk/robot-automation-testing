*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common.robot

Suite Setup       Open Browser To Home Page
Suite Teardown    Close Browser

*** Test Cases ***
Home Page Should Load Successfully
    [Documentation]    ตรวจสอบว่าหน้าแรกโหลดสำเร็จ
    [Tags]    homepage    smoke
    Title Should Be    ระบบจัดการสินค้า - Demo Application
    Page Should Contain    ยินดีต้อนรับสู่ระบบจัดการสินค้า

Navigation Menu Should Be Present
    [Documentation]    ตรวจสอบว่ามีเมนูนำทาง
    [Tags]    homepage    ui
    Page Should Contain Link    หน้าแรก
    Page Should Contain Link    เข้าสู่ระบบ
    Page Should Contain Link    สินค้า
    Page Should Contain Link    ติดต่อเรา

Hero Section Should Be Visible
    [Documentation]    ตรวจสอบว่าแสดงส่วน Hero
    [Tags]    homepage    ui
    Page Should Contain    ยินดีต้อนรับสู่ระบบจัดการสินค้า
    Page Should Contain    ระบบจัดการสินค้าออนไลน์ที่ทันสมัย

Start Button Should Navigate To Login
    [Documentation]    ทดสอบปุ่มเริ่มต้นใช้งานนำไปหน้าเข้าสู่ระบบ
    [Tags]    homepage    navigation
    Click Link    เริ่มต้นใช้งาน
    Wait Until Location Contains    login.html
    Title Should Be    เข้าสู่ระบบ - Demo Application

Features Section Should Display 4 Features
    [Documentation]    ตรวจสอบว่าแสดง 4 คุณสมบัติเด่น
    [Tags]    homepage    ui
    Go To    ${HOME_URL}
    Page Should Contain    คุณสมบัติเด่น
    ${feature_count}=    Get Element Count    css:.feature-card
    Should Be Equal As Numbers    ${feature_count}    4

Features Should Have Icons
    [Documentation]    ตรวจสอบว่าคุณสมบัติมีไอคอน
    [Tags]    homepage    ui
    ${icon_count}=    Get Element Count    css:.feature-card .icon
    Should Be Equal As Numbers    ${icon_count}    4

Stats Section Should Display Numbers
    [Documentation]    ตรวจสอบว่าแสดงสถิติ
    [Tags]    homepage    ui
    Page Should Contain Element    id:total-products
    Page Should Contain Element    id:total-users
    Page Should Contain Element    id:total-orders

Navigate To Login Page From Menu
    [Documentation]    ทดสอบการนำทางไปหน้าเข้าสู่ระบบจากเมนู
    [Tags]    homepage    navigation
    Click Link    เข้าสู่ระบบ
    Wait Until Location Contains    login.html
    Page Should Contain    เข้าสู่ระบบ

Navigate To Products Page From Menu
    [Documentation]    ทดสอบการนำทางไปหน้าสินค้าจากเมนู
    [Tags]    homepage    navigation
    Go To    ${HOME_URL}
    Click Link    สินค้า
    Wait Until Location Contains    products.html
    Page Should Contain    รายการสินค้า

Navigate To Contact Page From Menu
    [Documentation]    ทดสอบการนำทางไปหน้าติดต่อเราจากเมนู
    [Tags]    homepage    navigation
    Go To    ${HOME_URL}
    Click Link    ติดต่อเรา
    Wait Until Location Contains    contact.html
    Page Should Contain    ติดต่อเรา

Footer Should Be Present
    [Documentation]    ตรวจสอบว่ามีส่วนท้าย
    [Tags]    homepage    ui
    Page Should Contain    © 2024 ระบบจัดการสินค้า
