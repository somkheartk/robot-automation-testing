*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem

*** Variables ***
${BROWSER}          Chrome
${BASE_URL}         file://${EXECDIR}/sample-website
${HOME_URL}         ${BASE_URL}/index.html
${LOGIN_URL}        ${BASE_URL}/login.html
${PRODUCTS_URL}     ${BASE_URL}/products.html
${CONTACT_URL}      ${BASE_URL}/contact.html
${DELAY}            0.5

*** Keywords ***
Open Browser To Home Page
    [Documentation]    เปิดเบราว์เซอร์ไปที่หน้าแรก
    Open Browser    ${HOME_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Open Browser To Login Page
    [Documentation]    เปิดเบราว์เซอร์ไปที่หน้าเข้าสู่ระบบ
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Open Browser To Products Page
    [Documentation]    เปิดเบราว์เซอร์ไปที่หน้าสินค้า
    Open Browser    ${PRODUCTS_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Open Browser To Contact Page
    [Documentation]    เปิดเบราว์เซอร์ไปที่หน้าติดต่อเรา
    Open Browser    ${CONTACT_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Input Username
    [Arguments]    ${username}
    [Documentation]    กรอกชื่อผู้ใช้
    Input Text    id:username    ${username}

Input Password
    [Arguments]    ${password}
    [Documentation]    กรอกรหัสผ่าน
    Input Password    id:password    ${password}

Submit Login Form
    [Documentation]    ส่งฟอร์มเข้าสู่ระบบ
    Click Button    css:button[type="submit"]

Wait Until Login Success Message Is Visible
    [Documentation]    รอจนกว่าจะแสดงข้อความเข้าสู่ระบบสำเร็จ
    Wait Until Element Is Visible    id:loginMessage    timeout=5s

Wait Until Error Message Is Visible
    [Documentation]    รอจนกว่าจะแสดงข้อความข้อผิดพลาด
    Wait Until Element Is Visible    id:loginMessage    timeout=5s

Success Message Should Contain
    [Arguments]    ${expected_text}
    [Documentation]    ตรวจสอบว่าข้อความสำเร็จมีข้อความที่คาดหวัง
    Element Should Contain    id:loginMessage    ${expected_text}
    Element Should Have Class    id:loginMessage    success

Error Message Should Contain
    [Arguments]    ${expected_text}
    [Documentation]    ตรวจสอบว่าข้อความข้อผิดพลาดมีข้อความที่คาดหวัง
    Element Should Contain    id:loginMessage    ${expected_text}
    Element Should Have Class    id:loginMessage    error

Element Should Have Class
    [Arguments]    ${locator}    ${class_name}
    [Documentation]    ตรวจสอบว่า element มี class ที่ระบุ
    ${classes}=    Get Element Attribute    ${locator}    class
    Should Contain    ${classes}    ${class_name}

Take Screenshot On Failure
    [Documentation]    ถ่ายภาพหน้าจอเมื่อเกิดข้อผิดพลาด
    Capture Page Screenshot
