<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
   
    <title>Hồ Sơ Của Tôi</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
	<link rel="stylesheet" href="./views/css/style.css">
    <link rel="stylesheet" href="./views/css/styleTaiKhoan.css">
    <link rel="stylesheet" href="./views/css/styleDonHang.css">
</head>
<body>
	<!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light navbar1">
        <div class="container-fluid">
            <div class="justify-content-between d-flex align-items-center">
                <div class="d-flex align-items-center">
                    <a class="navbar-brand" href="/project_web/views/home.jsp">
                        <img src="./views/images/logo.jpg" alt="Logo">
                    </a>
                     <form action="/project_web/SanPhamController" method="get" class="d-flex">
		                <input class="form-control me-2" type="search" name="searchText" placeholder="Search Products" aria-label="Search">
		                <button class="btn btn-outline-secondary" type="submit">
		                    <i class="fas fa-search"></i>
		                </button>
		            </form>
                </div>
                <div class="navbar-nav">
                    <a class="nav-link font-weight-bold" href="/project_web/views/home.jsp">TRANG CHỦ</a>
                    <a class="nav-link font-weight-bold" href="SanPhamController">SẢN PHẨM</a>
                    <span class="nav-icon"><a href="/project_web/GioHangController"><i class="fas fa-shopping-bag"></i></a></span>
                    <span class="nav-icon-primary" id="account-icon">
                        <a href="/project_web/TaiKhoanController">
                            <i class="fas fa-user"></i>
                        </a>
                    </span>

                    <div class="account-info" id="account-info">
                        <ul>
                            <li class="account-info-item"><a href="/project_web/TaiKhoanController">Tài khoản của tôi</a></li>
                            <li class="account-info-item"><a href="/project_web/DonHang">Đơn mua</a></li>
                            <li class="account-info-item"><a href="/project_web">Đăng xuất</a></li>
                        </ul>
                        
                    </div>
                </div>
            </div>
        </div>
    </nav>
    
    <div class="container1">
    	<div class="container1 mt">
    		<div class="col-md-12">
			    <nav aria-label="breadcrumb">
			        <ol class="breadcrumb">
			            <li class="breadcrumb-item" id="home-item">
				            <a href="/project_web/views/home.jsp">
				            	<i class="fas fa-home"></i>
				            </a>
			            </li>
			            <li class="breadcrumb-item active" id="product-item"> Tài khoản / Đơn hàng</li>
			        </ol>
			    </nav>
			</div>
	        <div class="row">
	            <!-- Sidebar -->
	            <div class="col-md-3 sidebar bg-light py-3">
	                <div class="list-group">
	                    <a href="/project_web/TaiKhoanController" class="list-group-item acti ve">
	                        <i class="fas fa-user me-2"></i> Thông tin cá nhân
	                    </a>
	                    <a href="#orderDropdown" class="list-group-item" data-bs-toggle="collapse" aria-expanded="false" aria-controls="orderDropdown">
	                        <i class="fas fa-box me-2"></i> Đơn hàng
	                    </a>
	                    <div class="collapse" id="orderDropdown">
		                    <a href="#" class="list-group-item ps-4">
                                <i class="fas fa-clock me-2"></i> Chờ xác nhận
                            </a>
	                       
	                        <a href="#" class="list-group-item ps-4">
	                            <i class="fas fa-truck me-2"></i> Đang giao
	                        </a>
                            
                             <a href="#" class="list-group-item ps-4">
	                            <i class="fas fa-check me-2"></i> Đã giao
	                        </a>
	                    </div>
	                    <a href="#" class="list-group-item">
	                        <i class="fas fa-bell me-2"></i> Thông báo
	                    </a>
	                    <a href="#" class="list-group-item">
	                        <i class="fas fa-file-alt me-2"></i> Chính sách
	                    </a>
	                    <a href="#" class="list-group-item">
	                        <i class="fas fa-headset me-2"></i> Chăm sóc khách hàng
	                    </a>
	                </div>
	            </div>
	            
	            <!-- Main Profile Form -->
	            <div class="col-md-9 bg-white py-4 px-5">
                    <div class="container mt-4">
                        <h3 class="font-weight-bold mb-3 text-center" style="font-size: 24px; color: #343a40; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">Đơn Hàng</h3>
                        <p class="mb-3 text-center" style="font-size: 16px; color: #6c757d; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">Kiểm tra và theo dõi trạng thái đơn hàng của bạn</p>                        
                    
                        <!-- Danh sách đơn hàng -->
                        <div class="card mb-3 order-card">
                            <div class="card-body">
                                <div class="d-flex w-100 justify-content-between">
                                    <h5 class="font-weight-bold mb-3" style="background-color: #f1f1f1; padding: 8px 20px; border-radius: 5px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); color: #343a40; font-size: 16px; border: 1px solid #ced4da;">
                                        <i class="fas fa-box"></i> Đơn Hàng #12345
                                    </h5>
                                    <small class="text-muted">Ngày đặt: 2024-11-25</small>
                                </div>
                    
                                <div class="d-flex align-items-center">
                                    <!-- Hình ảnh sản phẩm đầu tiên -->
                                    <img src="https://quanjeandep.com/images/thumbs/quan-jean-nam-dang-slim-fit-mau-den-tuyen-10930.jpeg" alt="Sản phẩm" class="rounded" style="width: 80px; height: 80px; object-fit: cover; margin-right: 20px;">
            
                                    <!-- Thông tin đơn hàng -->
                                    <div class="ms-3 flex-grow-1">
                                        <h4>Áo khoác hoodie</h4>
                                        <p class="mb-1">Size: S, Màu: Xám</p>
                                        <small class="text-muted">x1</small>
                                        <p class="mb-1">Trạng thái: <span class="badge bg-warning text-dark"><i class="fas fa-clock me-2"></i>Đang chờ xác nhận</span></p>
                                        <small class="text-muted">Giao đến: 123 Đường ABC, Quận 1, TP.HCM</small>
                                        <p class="mb-1 text-muted">Còn: 3 sản phẩm khác</p>
                                        
                                    </div>
                                    <!-- Đơn giá - cho qua bên phải -->
                                    <div class="ms-auto">
                                        <p class="mb-1 text-end product-price"><strong>1.000.000 VND</strong></p>
                                    </div>
                                    <!-- Nút "Chi tiết" -->
                                    <button class="toggle-details" type="button" data-bs-toggle="collapse" data-bs-target="#orderDetails1" aria-expanded="false" aria-controls="orderDetails1">
                                        <i class="fa-solid fa-chevron-left"></i>
                                    </button>
                                </div>
                                 <!-- Thành tiền và Nút "Xem Chi Tiết" bên phải -->
                                <div class="ms-auto text-end" style="border-top: 1px solid #ccc; padding: 10px; margin-top: 30px;">
                                    <p class="mb-1 text-end product-price">Tổng tiền: <strong>2.500.000 VND</strong></p>
                                    <a href="javascript:void(0);" class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#orderDetailModal" onclick="loadOrderDetails('orderDetails1')">
                                        <span class="font-weight-bold">Xem Chi Tiết</span>
                                    </a>
                                </div>
                            </div>
                            <!-- Danh sách sản phẩm mở rộng -->
                            <div class="collapse" id="orderDetails1">
                                <div class="card-body">
                                    <div class="d-flex align-items-center mb-3">
                                        <img src="https://quanjeandep.com/images/thumbs/quan-jean-nam-dang-slim-fit-mau-den-tuyen-10930.jpeg" alt="Sản phẩm" class="rounded" style="width: 60px; height: 60px; object-fit: cover;">
                                        <div class="ms-3 flex-grow-1"> <!-- Thêm flex-grow-1 để chiếm không gian còn lại -->
                                            <h6 class="mb-1">áo thể thao</h6>
                                            <p class="mb-1 text-muted">Size: S, Màu: Xám</p>
                                            <p class="mb-0 text-muted">x2</p>
                                        </div>
                                        <!-- Đơn giá sản phẩm -->
                                        <div class="ms-auto">
                                            <p class="mb-1 text-end product-price" style="font-size: 15px; margin-right: 20px;">
                                                <span style="display: block; text-align: center;">Đơn giá</span> 
                                                <strong>500.000 VND</strong>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center mb-3">
                                        <img src="https://cdn.kkfashion.vn/28393-large_default/ao-kieu-nu-co-so-mi-hoa-tiet-caro-asm16-18.jpg" alt="Sản phẩm" class="rounded" style="width: 60px; height: 60px; object-fit: cover">
                                        <div class="ms-3 flex-grow-1">
                                            <h6 class="mb-1">quần 3 lỗ</h6>
                                            <p class="mb-1 text-muted">Size: S, Màu: Xám</p>
                                            <p class="mb-0 text-muted">x1</p>
                                            
                                        </div>
                                        <div class="ms-auto">
                                            <p class="mb-1 text-end product-price" style="font-size: 15px; margin-right: 20px;">
                                                <span style="display: block; text-align: center;">Đơn giá</span> 
                                                <strong>500.000 VND</strong>
                                            </p>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    
                        <!-- Thêm các đơn hàng khác -->
                        <div class="card mb-3 order-card">
                            <div class="card-body">
                                <div class="d-flex w-100 justify-content-between">
                                    <h5 class="font-weight-bold mb-3" style="background-color: #f1f1f1; padding: 8px 20px; border-radius: 5px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); color: #343a40; font-size: 16px; border: 1px solid #ced4da;">
                                        <i class="fas fa-box"></i> Đơn Hàng #12345
                                    </h5>
                                    <small class="text-muted">Ngày đặt: 2024-11-25</small>
                                </div>
                    
                                <div class="d-flex align-items-center">
                                    <img src="https://maxi.vn/wp-content/uploads/2022/08/z3630250901829_582cbfc8a4ea5ddbb063bd8b2ec6903e-scaled.jpg" alt="Sản phẩm" class="rounded" style="width: 80px; height: 80px; object-fit: cover; margin-right: 20px;">
                                    <div class="ms-3 flex-grow-1">
                                        <h5 class="mb-1">Đầm dạ hội</h5>
                                        <p class="mb-1">Size: S, Màu: Xám</p>
                                        <small class="text-muted">x1</small>
                                        <p class="mb-1">Trạng thái: <span class="badge bg-warning text-dark"><i class="fas fa-clock me-2"></i>Đang chờ xác nhận</span></p>
                                        <small class="text-muted">Giao đến: 123 Đường ABC, Quận 1, TP.HCM</small>
                                        <p class="mb-1 text-muted">Còn lại: 2 sản phẩm khác</p>
                                        
                                    </div>
                                    <button class="toggle-details" type="button" data-bs-toggle="collapse" data-bs-target="#orderDetails2" aria-expanded="false" aria-controls="orderDetails1">
                                        <i class="fa-solid fa-chevron-left"></i>
                                    </button>
                                    
                                </div>
                                <div class="ms-auto text-end" style="border-top: 1px solid #ccc; padding: 10px; margin-top: 30px;">
                                    <!-- Thêm thông tin còn lại cho đơn hàng -->
                                    <p class="mb-1">Tổng tiền: <strong>1.500.000 VND</strong></p>
                                    <a href="javascript:void(0);" class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#orderDetailModal" onclick="loadOrderDetails('orderDetails1')">
                                        Xem Chi Tiết
                                    </a>
                                </div>
                                
                            </div>
                            <div class="collapse" id="orderDetails2">
                                <div class="card-body">
                                    <!-- Các sản phẩm trong đơn hàng -->
                                    <div class="d-flex align-items-center mb-3">
                                        <img src="https://cdn.vortexs.io/api/images/57594672-cf3f-4d37-8678-4cd0ceefb19d/1920/w/giay-mlb-chunky-liner-basic-la-white-navy-3asxclb3n-07nyd.jpeg" alt="Sản phẩm" class="rounded" style="width: 60px; height: 60px; object-fit: cover;">
                                        <div class="ms-3">
                                            <h6 class="mb-1">áo len</h6>
                                            <p class="mb-1 text-muted">Size: S, Màu: Xám</p>
                                            <p class="mb-0 text-muted">x3</p>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    
                    
	            </div>
	        </div>
    </div>
    
   <!-- Modal -->
	<div class="modal fade" id="orderDetailModal" tabindex="-1" aria-labelledby="orderDetailModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="orderDetailModalLabel">Chi Tiết Đơn Hàng</h5>
	          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	        </div>
	        <div class="modal-body">
	          <!-- Nội dung chi tiết đơn hàng sẽ được chèn vào đây bằng JavaScript -->
	          <div class="order-details-content">
	            <!-- Nội dung sẽ được thêm vào từ JavaScript -->
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
  
    
    <jsp:include page="footer.jsp" />
    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById('uploadButton').addEventListener('click', function() {
            document.getElementById('profilePic').click(); // Kích hoạt input file khi bấm nút
        });
    
        document.getElementById('profilePic').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.querySelector('.profile-pic').src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        });
    </script>
    <script>
        document.querySelectorAll('.toggle-details').forEach((button) => {
            const collapseTargetId = button.getAttribute('data-bs-target'); // Lấy ID của collapse
            const icon = button.querySelector('i'); // Lấy icon trong nút

            // Xử lý ngay khi nhấn nút
            button.addEventListener('click', function () {
                // Đổi icon ngay lập tức, không chờ hiệu ứng collapse
                if (icon.classList.contains('fa-chevron-left')) {
                    icon.classList.remove('fa-chevron-left');
                    icon.classList.add('fa-chevron-down');
                } else {
                    icon.classList.remove('fa-chevron-down');
                    icon.classList.add('fa-chevron-left');
                }
            });
        });

        
    </script>
    <script>
        document.querySelectorAll('.btn-warning').forEach(button => {
            button.addEventListener('click', function() {
                // Lấy thông tin đơn hàng
                const orderId = this.closest('.order-card').querySelector('h5').textContent.trim().replace('Đơn Hàng #', '');
                const orderDate = this.closest('.order-card').querySelector('small.text-muted').textContent.trim();
                const totalAmount = this.closest('.order-card').querySelector('.ms-auto p strong').textContent.trim();

                // Gửi yêu cầu để tải file orderdetail.html
                fetch('views/ChiTietDonHang.jsp')
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Không thể tải nội dung chi tiết đơn hàng.');
                        }
                        return response.text(); // Trả về nội dung HTML dưới dạng text
                    })
                    .then(html => {
                        // Chèn nội dung HTML vào modal
                        document.querySelector('#orderDetailModal .modal-body').innerHTML = html;

                        // Thay thế các giá trị động (nếu cần)
                        document.querySelector('.order_detail_container .order_detail_header p span').textContent = orderId;

                        // Hiển thị modal
                        const orderDetailModal = new bootstrap.Modal(document.getElementById('orderDetailModal'));
                        orderDetailModal.show();
                    })
                    .catch(error => {
                        console.error('Lỗi:', error);
                        alert('Đã xảy ra lỗi khi tải chi tiết đơn hàng.');
                    });
            });
        });

    </script>
</body>
</html>
