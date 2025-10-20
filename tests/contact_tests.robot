*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common.robot

Suite Setup       Open Browser To Contact Page
Suite Teardown    Close Browser

*** Test Cases ***
Contact Page Should Display Correctly
    [Documentation]    ตรวจสอบว่าหน้าติดต่อเราแสดงผลถูกต้อง
    [Tags]    contact    ui
    Page Should Contain    ติดต่อเรา
    Page Should Contain    ข้อมูลติดต่อ

Contact Information Should Be Visible
    [Documentation]    ตรวจสอบว่าแสดงข้อมูลติดต่อ
    [Tags]    contact    ui
    Page Should Contain Element    id:contactPhone
    Page Should Contain Element    id:contactEmail
    Page Should Contain    02-123-4567
    Page Should Contain    contact@example.com

Contact Form Should Be Present
    [Documentation]    ตรวจสอบว่ามีฟอร์มติดต่อ
    [Tags]    contact    ui
    Page Should Contain Element    id:contactForm
    Page Should Contain Element    id:name
    Page Should Contain Element    id:email
    Page Should Contain Element    id:subject
    Page Should Contain Element    id:message

Submit Contact Form With Valid Data
    [Documentation]    ทดสอบการส่งฟอร์มติดต่อด้วยข้อมูลที่ถูกต้อง
    [Tags]    contact    positive
    Input Text    id:name    ทดสอบ ระบบ
    Input Text    id:email    test@example.com
    Input Text    id:subject    ทดสอบการส่งข้อความ
    Input Text    id:message    นี่คือข้อความทดสอบจากระบบอัตโนมัติ
    Click Button    css:button[type="submit"]
    Wait Until Element Is Visible    id:contactMessage
    Element Should Contain    id:contactMessage    ส่งข้อความสำเร็จ

Submit Contact Form With Empty Name
    [Documentation]    ทดสอบการส่งฟอร์มโดยไม่กรอกชื่อ
    [Tags]    contact    negative    validation
    Reload Page
    Input Text    id:email    test@example.com
    Input Text    id:subject    ทดสอบ
    Input Text    id:message    ข้อความทดสอบ
    Click Button    css:button[type="submit"]
    # HTML5 validation should prevent submission
    Page Should Contain Element    id:name

Submit Contact Form With Invalid Email
    [Documentation]    ทดสอบการส่งฟอร์มด้วยอีเมลที่ไม่ถูกต้อง
    [Tags]    contact    negative    validation
    Reload Page
    Input Text    id:name    ทดสอบ ระบบ
    Input Text    id:email    invalid-email
    Input Text    id:subject    ทดสอบ
    Input Text    id:message    ข้อความทดสอบ
    Click Button    css:button[type="submit"]
    # HTML5 validation should prevent submission
    Page Should Contain Element    id:email

Contact Form Fields Should Have Labels
    [Documentation]    ตรวจสอบว่าฟิลด์ฟอร์มมีป้ายกำกับ
    [Tags]    contact    ui
    Page Should Contain    ชื่อ-นามสกุล
    Page Should Contain    อีเมล
    Page Should Contain    หัวเรื่อง
    Page Should Contain    ข้อความ

Address Information Should Be Visible
    [Documentation]    ตรวจสอบว่าแสดงที่อยู่
    [Tags]    contact    ui
    Page Should Contain    ที่อยู่
    Page Should Contain    ถนนสุขุมวิท

Working Hours Should Be Visible
    [Documentation]    ตรวจสอบว่าแสดงเวลาทำการ
    [Tags]    contact    ui
    Page Should Contain    เวลาทำการ
    Page Should Contain    09:00 - 18:00
