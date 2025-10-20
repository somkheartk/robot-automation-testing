// Cart functionality
let cart = [];

// Login Form Handler
const loginForm = document.getElementById('loginForm');
if (loginForm) {
    loginForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        const username = document.getElementById('username').value;
        const password = document.getElementById('password').value;
        const messageDiv = document.getElementById('loginMessage');
        
        // Simple validation
        if (username === 'admin' && password === 'admin123') {
            messageDiv.className = 'message success';
            messageDiv.textContent = 'เข้าสู่ระบบสำเร็จ! กำลังนำคุณไปยังหน้าหลัก...';
            
            // Simulate redirect
            setTimeout(() => {
                window.location.href = 'products.html';
            }, 1500);
        } else if (username === 'user' && password === 'user123') {
            messageDiv.className = 'message success';
            messageDiv.textContent = 'เข้าสู่ระบบสำเร็จ! ยินดีต้อนรับ';
            
            setTimeout(() => {
                window.location.href = 'products.html';
            }, 1500);
        } else {
            messageDiv.className = 'message error';
            messageDiv.textContent = 'ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง';
        }
    });
}

// Register and Forgot Password Links
const registerLink = document.getElementById('registerLink');
if (registerLink) {
    registerLink.addEventListener('click', function(e) {
        e.preventDefault();
        alert('ฟีเจอร์สมัครสมาชิกอยู่ระหว่างการพัฒนา');
    });
}

const forgotPassword = document.getElementById('forgotPassword');
if (forgotPassword) {
    forgotPassword.addEventListener('click', function(e) {
        e.preventDefault();
        alert('กรุณาติดต่อผู้ดูแลระบบเพื่อรีเซ็ตรหัสผ่าน');
    });
}

// Product Search
const searchBtn = document.getElementById('searchBtn');
const searchInput = document.getElementById('searchInput');

if (searchBtn && searchInput) {
    searchBtn.addEventListener('click', function() {
        const searchTerm = searchInput.value.toLowerCase();
        const productCards = document.querySelectorAll('.product-card');
        
        productCards.forEach(card => {
            const productName = card.querySelector('.product-name').textContent.toLowerCase();
            const productDesc = card.querySelector('.product-description').textContent.toLowerCase();
            
            if (productName.includes(searchTerm) || productDesc.includes(searchTerm)) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        });
    });
    
    // Search on Enter key
    searchInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            searchBtn.click();
        }
    });
}

// Add to Cart functionality
const addToCartBtns = document.querySelectorAll('.add-to-cart-btn');
const cartCount = document.getElementById('cartCount');

addToCartBtns.forEach(btn => {
    btn.addEventListener('click', function() {
        const productId = this.getAttribute('data-id');
        const productCard = this.closest('.product-card');
        const productName = productCard.querySelector('.product-name').textContent;
        
        cart.push({
            id: productId,
            name: productName
        });
        
        updateCartCount();
        alert(`เพิ่ม "${productName}" ลงในตะกร้าแล้ว`);
    });
});

// View Product Details
const viewBtns = document.querySelectorAll('.view-btn');
viewBtns.forEach(btn => {
    btn.addEventListener('click', function() {
        const productId = this.getAttribute('data-id');
        const productCard = this.closest('.product-card');
        const productName = productCard.querySelector('.product-name').textContent;
        const productDesc = productCard.querySelector('.product-description').textContent;
        const productPrice = productCard.querySelector('.product-price').textContent;
        
        alert(`รายละเอียดสินค้า:\n\nชื่อ: ${productName}\nรายละเอียด: ${productDesc}\nราคา: ${productPrice}`);
    });
});

// Add Product Button
const addProductBtn = document.getElementById('addProductBtn');
if (addProductBtn) {
    addProductBtn.addEventListener('click', function() {
        alert('ฟีเจอร์เพิ่มสินค้าใหม่อยู่ระหว่างการพัฒนา');
    });
}

// Update Cart Count
function updateCartCount() {
    if (cartCount) {
        cartCount.textContent = cart.length;
    }
}

// Contact Form Handler
const contactForm = document.getElementById('contactForm');
if (contactForm) {
    contactForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        const name = document.getElementById('name').value;
        const email = document.getElementById('email').value;
        const subject = document.getElementById('subject').value;
        const message = document.getElementById('message').value;
        const messageDiv = document.getElementById('contactMessage');
        
        // Simple validation
        if (name && email && subject && message) {
            messageDiv.className = 'message success';
            messageDiv.textContent = 'ส่งข้อความสำเร็จ! เราจะติดต่อกลับโดยเร็วที่สุด';
            
            // Reset form
            contactForm.reset();
        } else {
            messageDiv.className = 'message error';
            messageDiv.textContent = 'กรุณากรอกข้อมูลให้ครบถ้วน';
        }
    });
}

// Initialize cart count on page load
updateCartCount();
