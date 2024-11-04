<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- FontAwesome -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
<style type="text/css">
	footer {
	    background-color: #333;
	    color: #fff;
	    padding: 40px 0;
	    font-family: Arial, sans-serif;
	    margin-top: 500px;
	}
	
	.footer-container {
	    display: flex;
	    flex-wrap: wrap;
	    justify-content: space-around;
	    max-width: 1200px;
	    margin: 0 auto;
	}
	
	.footer-section {
	    width: 200px;
	    margin: 10px;
	}
	
	.footer-section h4 {
	    margin-bottom: 15px;
	    font-size: 16px;
	    color: #ffcc00;
	}
	
	.footer-section p, .footer-section ul {
	    font-size: 14px;
	    line-height: 1.6;
	}
	
	.footer-section ul {
	    list-style: none;
	    padding: 0;
	}
	
	.footer-section ul li {
	    margin-bottom: 8px;
	}
	
	.footer-section ul li a {
	    color: #fff;
	    text-decoration: none;
	}
	
	.footer-section ul li a:hover {
	    text-decoration: underline;
	}
	
	.social-icons a {
	    display: inline-block;
	    margin-right: 10px;
	}
	
	.social-icons img {
	    width: 20px;
	    height: 20px;
	}
	
	.footer-bottom {
	    text-align: center;
	    padding-top: 20px;
	    font-size: 12px;
	    color: #aaa;
	    border-top: 1px solid #444;
	    margin-top: 20px;
	}
	
</style>
</head>
<body>
	<footer>
	    <div class="footer-container">
	        <div class="footer-section">
	            <h4>Về Chúng Tôi</h4>
	            <p>Shop Quần Áo Cao Cấp. Chúng tôi cam kết mang đến cho bạn những sản phẩm thời trang chất lượng nhất, cập nhật theo xu hướng mới nhất.</p>
	        </div>
	        
	        <div class="footer-section">
	            <h4>Hỗ Trợ Khách Hàng</h4>
	            <ul>
	                <li><a href="#">Chính Sách Đổi Trả</a></li>
	                <li><a href="#">Chính Sách Bảo Mật</a></li>
	                <li><a href="#">Câu Hỏi Thường Gặp</a></li>
	                <li><a href="#">Hướng Dẫn Mua Hàng</a></li>
	            </ul>
	        </div>
	        
	        <div class="footer-section">
	            <h4>Liên Hệ</h4>
	            <p>Địa chỉ: 123 Đường Thời Trang, Quận 1, TP.HCM</p>
	            <p>Điện thoại: 0123 456 789</p>
	            <p>Email: support@shopquanao.com</p>
	        </div>
	        
	        <div class="footer-section">
	            <h4>Kết Nối Với Chúng Tôi</h4>
	            <div class="social-icons">
	                <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
	            </div>
	        </div>
	    </div>
	    <div class="footer-bottom">
	        <p>&copy; 2024 Shop Quần Áo. All rights reserved.</p>
	    </div>
	</footer>
	
</body>
</html>