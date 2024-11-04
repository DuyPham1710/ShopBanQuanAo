<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout Form</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Google Fonts -->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/styleThanhToan.css"> 
</head>
<body>
  <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <div class="justify-content-between d-flex align-items-center">
                <div class="d-flex align-items-center">
                    <a class="navbar-brand" href="/project_web/views/home.jsp">
                        <img src="./images/logo.jpg" alt="Logo">
                    </a>
                    <form class="d-flex">
		                <input class="form-control me-2 mr-2" type="search" placeholder="Search Products" aria-label="Search">
		                <button class="btn btn-outline-secondary" type="submit">
		                    <i class="fas fa-search"></i>
		                </button>
		            </form>
                </div>
                <div class="navbar-nav">
                    <a class="nav-link" href="/project_web/views/home.jsp">TRANG CHỦ</a>
                    <a class="nav-link" href="/project_web/SanPhamController">SẢN PHẨM</a>
                    <span class="nav-icon"><a href="/project_web/views/GioHang.jsp"><i class="fas fa-shopping-bag"></i></a></span>
                    <span class="nav-icon"><a href="./TaiKhoan.html"><i class="fas fa-user"></i></a></span>
                </div>
            </div>
        </div>
    </nav>
    <div class="container">
    	<div class="checkout-container">
        <!-- Shipping Information -->
        <div class="section shipping-info">
            <h3>Thông tin nhận hàng</h3>
            <div class="info-row">
                <span class="label">Người nhận:</span>
                <span class="detail">Nguyễn Văn A</span>
            </div>
            <div class="info-row">
                <span class="label">Điện thoại:</span>
                <span class="detail">0123456789</span>
            </div>
            <div class="info-row">
                <span class="label">Email:</span>
                <span class="detail">nguyenvana@example.com</span>
            </div>
            <div class="info-row">
                <span class="label">Địa chỉ:</span>
                <div class="address-container">
                    <select class="detail" id="addressSelect" onchange="checkOtherOption()">
                        <option value="268 Lý Thường Kiệt, Phường 14, Quận 10, Thành phố Hồ Chí Minh">268 Lý Thường Kiệt, Phường 14, Quận 10, Thành phố Hồ Chí Minh</option>
                        <option value="123 Nguyễn Thị Minh Khai, Quận 3, Thành phố Hồ Chí Minh">123 Nguyễn Thị Minh Khai, Quận 3, Thành phố Hồ Chí Minh</option>
                        <option value="456 Lê Văn Sỹ, Quận Phú Nhuận, Thành phố Hồ Chí Minh">456 Lê Văn Sỹ, Quận Phú Nhuận, Thành phố Hồ Chí Minh</option>
                        <option value="other">Khác (Nhập địa chỉ mới)</option>
                    </select>
                    
                    <input type="text" id="otherAddress" placeholder="Nhập địa chỉ mới" style="display:none; margin-top: 10px;">
                </div>
                
                
            </div>
            
        </div>
        

        <!-- Payment Method -->
        <div class="section payment-method">
            <h3>Phương thức thanh toán</h3>
            <button class="payment-option" onclick="selectPaymentOption(this, 'cod')">
                <div class="icon-container">
                    <i class="fas fa-money-bill-wave"></i>
                </div>
                <div class="text-content">
                    Thanh toán khi nhận hàng
                </div>
                <div class="tick" style="display:none;">
                    <i class="fas fa-check-circle"></i>
                </div>
            </button>
            <button class="payment-option selected" onclick="selectPaymentOption(this, 'paypal')">
                <div class="icon-container">
                    <i class="fab fa-paypal"></i>
                </div>
                <div class="text-content">
                    Thanh toán bằng Paypal
                </div>
                <div class="tick" style="display:none;">
                    <i class="fas fa-check-circle"></i>
                </div>
            </button>
        </div>
        
        
        

        <!-- Order Details -->
        <div class="section order-details">
            <h3>Đơn hàng</h3>
            <div class="order-header">
                <span>Sản phẩm</span>
                <span>Số lượng</span>
                <span>Giá</span>
            </div>
            <div class="product-item">
                <img src="https://dbros.vn/wp-content/uploads/2023/08/ao-thun-trang-nam-T102.jpg" alt="Summer Shirt">
                <div class="product-info">
                    <h4>Summer Shirt</h4>
                    <p class="brand">Golden Accessories</p>
                    <p class="details">Size: M, Màu: Vàng</p>
                </div>
                <div class="product-quantity">
                    <p>1</p>
                </div>
                <div class="product-price">
                    <p class="price">40.000đ</p>
                </div>
            </div>
            
            
        </div>
        

        <!-- Order Summary -->
        <div class="section order-summary">
            <h3>Thông tin đơn hàng</h3>
            <div class="order-row">
                <span class="label">Tạm tính</span>
                <span >40.000đ</span>
            </div>
            <div class="order-row">
                <span class="label">Phí vận chuyển</span> 
                <span >30.000đ</span>
            </div>
            <hr>
            <div class="order-row total-row">
                <span class="label-total">Tổng tiền</span>
                <span class="price total">70.000đ</span>
            </div>
            <button class="paypal-button" id="payButton">PayPal</button>
        </div>
    </div>

    <script>
        function checkOtherOption() {
            const addressSelect = document.getElementById('addressSelect');
            const otherAddressInput = document.getElementById('otherAddress');
            
            if (addressSelect.value === 'other') {
                otherAddressInput.style.display = 'block'; // Hiện trường nhập
                otherAddressInput.focus(); // Đặt con trỏ vào trường nhập
            } else {
                otherAddressInput.style.display = 'none'; // Ẩn trường nhập
                otherAddressInput.value = ''; // Xóa giá trị nếu không chọn 'Khác'
            }
        }

        function selectPaymentOption(button, method) {
            // Xóa lớp 'selected' và ẩn tick của tất cả các nút
            document.querySelectorAll('.payment-option').forEach(option => {
                option.classList.remove('selected');
                option.querySelector('.tick').style.display = 'none';
            });

            // Thêm lớp 'selected' và hiển thị tick cho nút đã chọn
            button.classList.add('selected');
            button.querySelector('.tick').style.display = 'block';

            // Lấy nút thanh toán và thay đổi nội dung theo phương thức
            const payButton = document.getElementById('payButton');
            if (method === 'cod') {
                payButton.textContent = 'Đặt hàng';
            } else if (method === 'paypal') {
                payButton.textContent = 'PayPal';
            }
        }


        </script>
    </div>
	 <jsp:include page="footer.jsp" />
</body>
</html>