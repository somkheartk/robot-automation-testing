*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Variables ***
${VALID_USERNAME}    admin
${VALID_PASSWORD}    admin123
${INVALID_USERNAME}  wronguser
${INVALID_PASSWORD}  wrongpass

*** Test Cases ***
Login With Valid Credentials
    [Documentation]    ทดสอบการเข้าสู่ระบบด้วยข้อมูลที่ถูกต้อง
    [Tags]    login    positive
    Input Username    ${VALID_USERNAME}
    Input User Password    ${VALID_PASSWORD}
    Submit Login Form
    Wait Until Login Success Message Is Visible
    Success Message Should Contain    เข้าสู่ระบบสำเร็จ

Login With Invalid Credentials
    [Documentation]    ทดสอบการเข้าสู่ระบบด้วยข้อมูลที่ไม่ถูกต้อง
    [Tags]    login    negative
    Go To    ${LOGIN_URL}
    Input Username    ${INVALID_USERNAME}
    Input User Password    ${INVALID_PASSWORD}
    Submit Login Form
    Wait Until Error Message Is Visible
    Error Message Should Contain    ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง

Login With Empty Username
    [Documentation]    ทดสอบการเข้าสู่ระบบโดยไม่กรอกชื่อผู้ใช้
    [Tags]    login    negative    validation
    Go To    ${LOGIN_URL}
    Input User Password    ${VALID_PASSWORD}
    Submit Login Form
    # HTML5 validation should prevent submission
    Page Should Contain Element    id:username

Login With Empty Password
    [Documentation]    ทดสอบการเข้าสู่ระบบโดยไม่กรอกรหัสผ่าน
    [Tags]    login    negative    validation
    Go To    ${LOGIN_URL}
    Input Username    ${VALID_USERNAME}
    Submit Login Form
    # HTML5 validation should prevent submission
    Page Should Contain Element    id:password

Remember Me Checkbox Should Be Present
    [Documentation]    ตรวจสอบว่ามีช่องจดจำฉันไว้
    [Tags]    login    ui
    Go To    ${LOGIN_URL}
    Page Should Contain Element    id:remember
    Checkbox Should Not Be Selected    id:remember

Remember Me Checkbox Can Be Checked
    [Documentation]    ทดสอบการเลือกช่องจดจำฉันไว้
    [Tags]    login    ui
    Go To    ${LOGIN_URL}
    Select Checkbox    id:remember
    Checkbox Should Be Selected    id:remember

Demo Credentials Should Be Visible
    [Documentation]    ตรวจสอบว่าแสดงข้อมูลสำหรับทดสอบ
    [Tags]    login    ui
    Go To    ${LOGIN_URL}
    Page Should Contain    ข้อมูลสำหรับทดสอบ
    Page Should Contain    Username: admin
    Page Should Contain    Password: admin123

Register Link Should Be Present
    [Documentation]    ตรวจสอบว่ามีลิงก์สมัครสมาชิก
    [Tags]    login    ui
    Go To    ${LOGIN_URL}
    Page Should Contain Element    id:registerLink

Forgot Password Link Should Be Present
    [Documentation]    ตรวจสอบว่ามีลิงก์ลืมรหัสผ่าน
    [Tags]    login    ui
    Go To    ${LOGIN_URL}
    Page Should Contain Element    id:forgotPassword
