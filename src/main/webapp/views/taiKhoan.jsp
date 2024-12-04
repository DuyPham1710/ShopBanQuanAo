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
                    <span class="nav-icon">
						<div class="notifications">
						    <a href="/project_web/GioHangController">
						        <i class="fas fa-shopping-bag"></i>
						    </a>
						    <span class="notification-badge">6</span>
					    </div>
					</span>
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
	                    <a href="#" class="list-group-item active">
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
	                <div class="profile-form">
	                    <div style="border-bottom: 1px solid #ccc;margin-bottom: 10px;">
	                        <h4 class="font-weight-bold">Hồ Sơ Của Tôi</h4>
	                        <p class="text-muted">Quản lý thông tin hồ sơ để bảo mật tài khoản</p>
	                    </div>
	
	                        <form action="TaiKhoanController" method="POST">
	                            <div class="row">
	                                <div class="col-md-9 " style="padding-right: 30px;" >
	                                    <div class="form-group">
	                                        <label for="username">Tên đăng nhập</label>
	                                        <input type="text" id="username" name="username" class="form-control" value="${nguoiDung.account.username}" readonly>
	                                    </div>
	                                    <div class="form-group">
	                                        <label for="name">Tên</label>
	                                        <input type="text" id="name" class="form-control" name="hoTen" placeholder="Nhập tên của bạn" value="${nguoiDung.hoTen}">
	                                    </div>
	                                    <div class="form-group">
	                                        <div class="row">
	                                            
	                                            <div class="col-md-8">
	                                                <label for="dob" class="d-block mr-2">Ngày sinh</label>
	                                                <input type="date" id="dob" name="ngaySinh" class="form-control d-inline-block" value="${nguoiDung.ngaySinh}">
	                                            </div>
	        
	                                            <div class="col-md-4">
	                                                <label class="d-block mr-3">Giới tính</label>
	                                                <div class="d-flex align-items-center">
	                                                    <div class="form-check form-check-inline">
	                                                        <input class=" d-flex align-items-center form-check-input" type="radio" name="gender" id="male" value="male" ${nguoiDung.gioiTinh == 'Nam' ? 'checked' : ''}>
	                                                        <label class="form-check-label" for="male">Nam</label>
	                                                    </div>
	                                                    <div class="form-check form-check-inline">
	                                                        <input class=" d-flex align-items-center form-check-input" type="radio" name="gender" id="female" value="female" ${nguoiDung.gioiTinh == 'Nữ' ? 'checked' : ''}>
	                                                        <label class="form-check-label" for="female">Nữ</label>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            
	                                        </div>
	                                        
	                                    </div>
	        
	                                    <div class="form-group">
	                                        <label for="email">Email</label>
	                                        <input type="email" id="email" name="email" class="form-control" value="${nguoiDung.email}">
	                                    </div>
	                                    <div class="form-group">
	                                        <label for="phone">Số điện thoại</label>
	                                        <input type="text" id="phone" name="sdt" class="form-control" value="${nguoiDung.sdt}">
	                                    </div>
	        
	                                    <div class="form-group">
	                                        <label for="pass">Mật khẩu</label>
	                                        <input type="password" id="pass" name="password" class="form-control" value="${nguoiDung.account.password}">
	                                    </div>
	                                    <div class="text-center">
	                                        <button type="submit" class="btn btn-primary">Lưu</button>
	                                    </div>
	                                </div>
	                                <div class="col-md-3 form-group" style="border-left: 1px solid #ccc; height: 220px;">
	                                    <label for="profilePic">Ảnh đại diện</label><br>
	                                    <img src="https://www.vlance.vn/uploads/portfolio/view/c4a875224357fa0f1dce59defcb7a42b3d6d2cab1.jpg" alt="Profile Picture" class="profile-pic avatar mb-3">
	                                    <button type="button" class="btn btn-outline-secondary" id="uploadButton">Chọn Ảnh</button>
	                                    <input type="file" id="profilePic" class="d-none">
	                                </div>
	                            </div>
	                            
	                        </form>
	
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
	    // Hàm để cập nhật giá trị của input hidden và submit form
	    function setTrangThai(trangThai) {
	        document.getElementById('trangThai').value = trangThai;
	        document.getElementById('orderForm').submit(); // Submit form khi nhấn vào thẻ a
	    }
	</script>
</body>
</html>
