# Robot Framework Automation Testing - ตัวอย่างมืออาชีพ

โปรเจกต์ตัวอย่างการทดสอบอัตโนมัติด้วย Robot Framework แบบมืออาชีพ พร้อมเว็บไซต์ตัวอย่างสำหรับทดสอบ

## 📋 เนื้อหาในโปรเจกต์

โปรเจกต์นี้ประกอบด้วย:
- ✅ เว็บไซต์ตัวอย่าง (Sample Website) - ระบบจัดการสินค้า
- ✅ Test Cases ที่ครอบคลุมทุกหน้าของเว็บไซต์
- ✅ Resource Files สำหรับ Keywords ที่ใช้ร่วมกัน
- ✅ ตัวอย่างการทดสอบทั้ง Positive และ Negative Cases
- ✅ การจัดการ Test Tags เพื่อรัน Test แบบเลือกได้

## 🌐 เว็บไซต์ตัวอย่าง

เว็บไซต์ตัวอย่างอยู่ในโฟลเดอร์ `sample-website/` ประกอบด้วย:

### หน้าต่างๆ
1. **หน้าแรก (index.html)** - แสดงข้อมูลทั่วไปและคุณสมบัติของระบบ
2. **หน้าเข้าสู่ระบบ (login.html)** - ระบบ Login พร้อมการ validation
3. **หน้าสินค้า (products.html)** - แสดงรายการสินค้าพร้อมฟังก์ชันค้นหาและเพิ่มลงตะกร้า
4. **หน้าติดต่อเรา (contact.html)** - ฟอร์มติดต่อพร้อมข้อมูลติดต่อ

### ข้อมูลสำหรับทดสอบ
- **Username:** admin
- **Password:** admin123

หรือ
- **Username:** user
- **Password:** user123

## 🚀 การติดตั้งและใช้งาน

### ความต้องการของระบบ
- Python 3.7 หรือสูงกว่า
- Google Chrome Browser
- pip (Python package manager)

### ขั้นตอนการติดตั้ง

1. **Clone โปรเจกต์**
```bash
git clone https://github.com/somkheartk/robot-automation-testing.git
cd robot-automation-testing
```

2. **สร้าง Virtual Environment (แนะนำ)**
```bash
python -m venv venv

# Windows
venv\Scripts\activate

# Linux/Mac
source venv/bin/activate
```

3. **ติดตั้ง Dependencies**
```bash
pip install -r requirements.txt
```

4. **ตรวจสอบการติดตั้ง**
```bash
robot --version
```

## 📝 การรัน Test Cases

### รัน Test ทั้งหมด
```bash
robot tests/
```

### รัน Test แยกตามไฟล์
```bash
# ทดสอบหน้าแรก
robot tests/homepage_tests.robot

# ทดสอบ Login
robot tests/login_tests.robot

# ทดสอบสินค้า
robot tests/product_tests.robot

# ทดสอบติดต่อเรา
robot tests/contact_tests.robot
```

### รัน Test ตาม Tags
```bash
# รัน Smoke Tests
robot --include smoke tests/

# รัน Login Tests
robot --include login tests/

# รัน Positive Tests เท่านั้น
robot --include positive tests/

# รัน UI Tests
robot --include ui tests/

# รัน Test ยกเว้น Negative Cases
robot --exclude negative tests/
```

### รัน Test แบบกำหนดเอง
```bash
# รันด้วย Firefox
robot --variable BROWSER:Firefox tests/

# รันแบบไม่มี delay
robot --variable DELAY:0 tests/

# กำหนดไดเรกทอรีสำหรับ output
robot --outputdir results tests/
```

## 📊 โครงสร้างโปรเจกต์

```
robot-automation-testing/
├── sample-website/          # เว็บไซต์ตัวอย่างสำหรับทดสอบ
│   ├── index.html          # หน้าแรก
│   ├── login.html          # หน้า Login
│   ├── products.html       # หน้าสินค้า
│   ├── contact.html        # หน้าติดต่อเรา
│   ├── style.css           # CSS Styles
│   └── script.js           # JavaScript Functions
│
├── tests/                   # Test Suites
│   ├── homepage_tests.robot     # ทดสอบหน้าแรก
│   ├── login_tests.robot        # ทดสอบการ Login
│   ├── product_tests.robot      # ทดสอบหน้าสินค้า
│   └── contact_tests.robot      # ทดสอบหน้าติดต่อเรา
│
├── resources/               # Resource Files
│   └── common.robot        # Keywords และ Variables ที่ใช้ร่วมกัน
│
├── requirements.txt         # Python Dependencies
├── .gitignore              # Git Ignore File
└── README.md               # เอกสารนี้
```

## 🧪 Test Cases ที่มี

### Homepage Tests (11 Test Cases)
- ✅ ตรวจสอบการโหลดหน้าแรก
- ✅ ตรวจสอบเมนูนำทาง
- ✅ ตรวจสอบ Hero Section
- ✅ ทดสอบการนำทางไปหน้าต่างๆ
- ✅ ตรวจสอบคุณสมบัติเด่น
- ✅ ตรวจสอบสถิติ

### Login Tests (9 Test Cases)
- ✅ Login ด้วยข้อมูลถูกต้อง
- ✅ Login ด้วยข้อมูลผิด
- ✅ Login โดยไม่กรอก Username
- ✅ Login โดยไม่กรอก Password
- ✅ ทดสอบ Remember Me Checkbox
- ✅ ตรวจสอบข้อมูลสำหรับทดสอบ
- ✅ ตรวจสอบลิงก์สมัครสมาชิกและลืมรหัสผ่าน

### Product Tests (13 Test Cases)
- ✅ ตรวจสอบการแสดงผลหน้าสินค้า
- ✅ ทดสอบการค้นหาสินค้า
- ✅ ทดสอบการเพิ่มสินค้าลงตะกร้า
- ✅ ทดสอบการดูรายละเอียดสินค้า
- ✅ ตรวจสอบข้อมูลสินค้า (ชื่อ, ราคา, รายละเอียด)

### Contact Tests (8 Test Cases)
- ✅ ตรวจสอบการแสดงผลหน้าติดต่อเรา
- ✅ ทดสอบการส่งฟอร์มติดต่อ
- ✅ ทดสอบ Validation ของฟอร์ม
- ✅ ตรวจสอบข้อมูลติดต่อ

**รวมทั้งหมด: 41+ Test Cases**

## 📈 ดูผลการทดสอบ

หลังจากรัน Test เสร็จ จะมีไฟล์สำหรับดูผลการทดสอบ:

- **report.html** - รายงานสรุปผลการทดสอบ
- **log.html** - Log รายละเอียดของการทดสอบ
- **output.xml** - ข้อมูล XML สำหรับ integration

เปิดไฟล์ด้วย Browser:
```bash
# Windows
start report.html

# Linux
xdg-open report.html

# Mac
open report.html
```

## 🏷️ Test Tags ที่ใช้

| Tag | คำอธิบาย |
|-----|----------|
| smoke | Test Cases พื้นฐานที่สำคัญ |
| ui | Test Cases ที่เกี่ยวกับ User Interface |
| positive | Test Cases ที่ทดสอบด้วยข้อมูลถูกต้อง |
| negative | Test Cases ที่ทดสอบด้วยข้อมูลผิด |
| validation | Test Cases ที่ทดสอบการ validate ข้อมูล |
| login | Test Cases เกี่ยวกับการ Login |
| products | Test Cases เกี่ยวกับหน้าสินค้า |
| contact | Test Cases เกี่ยวกับหน้าติดต่อเรา |
| homepage | Test Cases เกี่ยวกับหน้าแรก |
| navigation | Test Cases เกี่ยวกับการนำทาง |
| cart | Test Cases เกี่ยวกับตะกร้าสินค้า |
| search | Test Cases เกี่ยวกับการค้นหา |

## 🎯 Best Practices ที่ใช้ในโปรเจกต์

1. **แยก Resource Files** - Keywords และ Variables ที่ใช้บ่อยอยู่ใน `resources/common.robot`
2. **ใช้ Tags** - จัดกลุ่ม Test Cases เพื่อรันได้ตามต้องการ
3. **Documentation** - ทุก Test Case มี Documentation อธิบาย
4. **Page Object Pattern** - แยก Keywords ตาม Page/ฟังก์ชัน
5. **Naming Convention** - ตั้งชื่อ Test Case และ Keywords ให้เข้าใจง่าย
6. **Test Organization** - แยก Test Suite ตามหน้าของ Application

## 🔧 การปรับแต่ง

### เปลี่ยน Browser
แก้ไขในไฟล์ `resources/common.robot`:
```robot
${BROWSER}    Chrome    # เปลี่ยนเป็น Firefox, Edge, Safari
```

หรือรันโดยใช้ command line:
```bash
robot --variable BROWSER:Firefox tests/
```

### เปลี่ยนความเร็วในการทดสอบ
แก้ไขในไฟล์ `resources/common.robot`:
```robot
${DELAY}    0.5    # เพิ่มหรือลดความเร็ว (วินาที)
```

## 🤝 การมีส่วนร่วม

หากต้องการเพิ่ม Test Cases หรือปรับปรุงโปรเจกต์:

1. Fork โปรเจกต์
2. สร้าง Branch ใหม่ (`git checkout -b feature/AmazingFeature`)
3. Commit การเปลี่ยนแปลง (`git commit -m 'Add some AmazingFeature'`)
4. Push ไป Branch (`git push origin feature/AmazingFeature`)
5. เปิด Pull Request

## 📚 เอกสารเพิ่มเติม

- [Robot Framework Official Documentation](https://robotframework.org/)
- [SeleniumLibrary Documentation](https://robotframework.org/SeleniumLibrary/)
- [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)

## 📄 License

โปรเจกต์นี้เป็น Open Source สามารถนำไปใช้เพื่อการศึกษาได้อย่างอิสระ

## 👨‍💻 ผู้พัฒนา

สร้างโดย: Robot Framework Automation Team

---

**หมายเหตุ:** โปรเจกต์นี้สร้างขึ้นเพื่อการศึกษาและเป็นตัวอย่างการใช้งาน Robot Framework ในการทดสอบอัตโนมัติ