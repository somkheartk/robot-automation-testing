# Quick Start Guide - เริ่มต้นใช้งานอย่างรวดเร็ว

## ขั้นตอนการเริ่มต้น 3 ขั้นตอน

### 1. ติดตั้ง Dependencies
```bash
pip install -r requirements.txt
```

### 2. เปิดเว็บไซต์ตัวอย่าง
เปิด Terminal แยก และรันคำสั่ง:
```bash
cd sample-website
python -m http.server 8080
```

หรือ Python 2:
```bash
cd sample-website
python -m SimpleHTTPServer 8080
```

เว็บไซต์จะเปิดที่: http://localhost:8080

### 3. รัน Tests
เปิด Terminal ใหม่ และรันคำสั่ง:
```bash
# รัน Test ทั้งหมด
robot tests/

# หรือใช้ script ที่เตรียมไว้
./run_tests.sh
```

## ดูผลการทดสอบ
เปิดไฟล์ `report.html` ใน browser:
```bash
# Linux
xdg-open report.html

# macOS
open report.html

# Windows
start report.html
```

## ทดสอบเว็บไซต์ด้วยตนเอง
เปิด browser และไปที่:
- หน้าแรก: http://localhost:8080/index.html
- Login: http://localhost:8080/login.html (user: admin, pass: admin123)
- สินค้า: http://localhost:8080/products.html
- ติดต่อเรา: http://localhost:8080/contact.html

## หากเกิดปัญหา

### Chrome Driver ไม่พบ
```bash
pip install --upgrade selenium webdriver-manager
```

### Port 8080 ถูกใช้งานอยู่
เปลี่ยน port ในการรันเว็บไซต์:
```bash
python -m http.server 8081
```

และแก้ไขไฟล์ `resources/common.robot`:
```robot
${BASE_URL}    http://localhost:8081
```

## คำสั่งที่มีประโยชน์

```bash
# รัน Test เฉพาะหน้าที่ต้องการ
robot tests/login_tests.robot
robot tests/product_tests.robot
robot tests/contact_tests.robot
robot tests/homepage_tests.robot

# รัน Test ตาม Tag
robot --include smoke tests/          # Smoke tests
robot --include ui tests/              # UI tests
robot --include positive tests/        # Positive tests

# รันโดยระบุ Browser
robot --variable BROWSER:Firefox tests/
robot --variable BROWSER:Edge tests/
```

ดูข้อมูลเพิ่มเติมใน [README.md](README.md)
