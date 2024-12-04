<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chính sách vận chuyển</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="./views/css/style.css">
    <link rel="stylesheet" href="./views/css/styleTaiKhoan.css">
    <link rel="stylesheet" href="./views/css/styleChinhSach.css">
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
			            <li class="breadcrumb-item active" id="product-item"> Tài khoản</li>
			        </ol>
			    </nav>
			</div>
	        <div class="row">
	            <!-- Sidebar -->
	            <div class="col-md-3 sidebar bg-light py-3">
	                <div class="list-group">
	                    <a href="/project_web/TaiKhoanController" class="list-group-item active">
	                        <i class="fas fa-user me-2"></i> Thông tin cá nhân
	                    </a>
	                    <a href="#orderDropdown" class="list-group-item" data-bs-toggle="collapse" aria-expanded="false" aria-controls="orderDropdown">
	                        <i class="fas fa-box me-2"></i> Đơn hàng
	                    </a>
	                   
	                   <form id="orderForm" action="DonHang" method="GET">
						    <!-- Hidden input to store the status -->
						    <input type="hidden" name="trangThai" id="trangThai">
						
						    <div class="collapse" id="orderDropdown">
						        <a href="javascript:void(0);" class="list-group-item ps-4" onclick="setTrangThai('Chờ xác nhận')">
						            <i class="fas fa-clock me-2"></i> Chờ xác nhận
						        </a>
						
						        <a href="javascript:void(0);" class="list-group-item ps-4" onclick="setTrangThai('Đang giao')">
						            <i class="fas fa-truck me-2"></i> Đang giao
						        </a>
						
						        <a href="javascript:void(0);" class="list-group-item ps-4" onclick="setTrangThai('Đã giao')">
						            <i class="fas fa-check me-2"></i> Đã giao
						        </a>
						    </div>
						</form>
	                  
	                    <a href="#" class="list-group-item">
	                        <i class="fas fa-bell me-2"></i> Thông báo
	                    </a>
	                    <a href="#policiesDropdown" class="list-group-item" data-bs-toggle="collapse" aria-expanded="false" aria-controls="policiesDropdown">
	                        <i class="fas fa-file-alt me-2"></i> Chính sách
	                    </a>
	                    
	                    <form id="policiesForm" action="ChinhSachController" method="GET">
						    <!-- Hidden input to store the status -->
						    <input type="hidden" name="chinhSach" id="chinhSach">
		                    <div class="collapse" id="policiesDropdown">
						        <a href="javascript:void(0);" class="list-group-item ps-4" onclick="setChinhSach('Bảo mật')">
						             Bảo mật
						        </a>
						
						        <a href="javascript:void(0);" class="list-group-item ps-4" onclick="setChinhSach('Vận chuyển')">
						             Vận chuyển
						        </a>
						
						        <a href="javascript:void(0);" class="list-group-item ps-4" onclick="setChinhSach('Đổi trả')">
						             Đổi trả
						        </a>
						    </div>
						</form>
	                    <a href="#" class="list-group-item">
	                        <i class="fas fa-headset me-2"></i> Chăm sóc khách hàng
	                    </a>
	                </div>
	            </div>
	            
	            <!-- Main Profile Form -->
	            <div class="col-md-9 bg-white px-5">
				        <div class="container my-5">
					        <h1 class="text-center mb-4 text-primary">Chính Sách Vận Chuyển</h1>
						        
				            <h2 class="title">1. Thời gian giao hàng:</h2>
				            <p><strong>Đơn hàng nội và ngoại thành TP.HCM:</strong></p>
				            <ul>
				                <li>Thời gian giao hàng là <strong>1-2 ngày</strong> sau khi đặt hàng.</li>
				                <li>Đơn hàng trước 11h30 trưa sẽ giao trong buổi chiều cùng ngày.</li>
				                <li>Đơn hàng sau 11h30 sẽ giao trong buổi tối và sáng hôm sau.</li>
				            </ul>
				            <p><strong>Đơn hàng ở các tỉnh thành khác:</strong></p>
				            <ul>
				                <li>Thời gian là <strong>2-3 ngày</strong> đối với khu vực trung tâm tỉnh/thành phố.</li>
				                <li>Thời gian là <strong>3-7 ngày</strong> đối với khu vực ngoại thành, huyện, xã, thị trấn.</li>
				                <li>Thời gian không bao gồm thứ bảy, chủ nhật hoặc các ngày lễ Tết.</li>
				            </ul>
				            <p>
				                Thời gian xử lý đơn hàng được tính từ khi nhận thanh toán hoàn tất. Đơn hàng sẽ được giao tối đa trong 2 lần. Nếu giao hàng không thành công cả 2 lần, đơn hàng sẽ bị hủy.
				            </p>
				            <p>
				                Để kiểm tra tình trạng đơn hàng, vui lòng inbox fanpage hoặc gọi số hotline, cung cấp tên và số điện thoại để được hỗ trợ.
				            </p>
				
				            <h2 class="title">2. Phí giao hàng:</h2>
				            <p>Phí ship cố định là <strong>20,000đ</strong>, áp dụng cho mọi khu vực.</p>
				            <p>Khi nhận hàng, quý khách vui lòng:</p>
				            <ul>
				                <li>Ký xác nhận với nhân viên giao hàng.</li>
				                <li>Kiểm tra số lượng và loại hàng hóa.</li>
				                <li>Giữ lại biên lai vận chuyển và hóa đơn mua hàng để đối chiếu.</li>
				            </ul>
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="../footer.jsp" />
    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.bundle.min.js"></script>
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
	    // Hàm để cập nhật giá trị của input hidden và submit form
	    function setTrangThai(trangThai) {
	        document.getElementById('trangThai').value = trangThai;
	        document.getElementById('orderForm').submit(); // Submit form khi nhấn vào thẻ a
	    }
	</script>
	<script>
		function setChinhSach(chinhSach) {
			document.getElementById('chinhSach').value = chinhSach;
	        document.getElementById('policiesForm').submit();
		}
	</script>
</body>
</html>
