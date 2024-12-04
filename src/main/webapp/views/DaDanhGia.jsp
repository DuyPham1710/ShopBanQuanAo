<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
   
    <title>Đánh giá</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
	<link rel="stylesheet" href="./views/css/style.css">
    <link rel="stylesheet" href="./views/css/styleTaiKhoan.css">
    <link rel="stylesheet" href="./views/css/styleDaDanhGia.css">
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
                            <li class="account-info-item"><a href="/project_web/DonHang?trangThai=Chờ+xác+nhận">Đơn mua</a></li>
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
						         <a href="javascript:void(0);" class="list-group-item ps-4" onclick="setTrangThai('Đã hủy')">
						            <i class="fas fa-times-circle me-2"></i> Đã hủy
						        </a>
						    </div>
						</form>
						<!-- Đánh giá -->
				        <a href="#ratingDropdown" class="list-group-item" data-bs-toggle="collapse" aria-expanded="false" aria-controls="ratingDropdown">
				            <i class="fas fa-star me-2"></i> Đánh giá
				        </a>
				        <form id="ratingForm" action="DanhGiaController" method="GET"> 
				            <input type="hidden" name="trangThai" id="ratingTrangThai">
				            <div class="collapse" id="ratingDropdown">
				                <a href="javascript:void(0);" class="list-group-item ps-4" onclick="setRatingTrangThai('Chưa đánh giá')">
				                    <i class="fas fa-edit me-2"></i> Chưa đánh giá
				                </a>
				                <a href="javascript:void(0);" class="list-group-item ps-4" onclick="setRatingTrangThai('Đã đánh giá')">
				                    <i class="fas fa-check-circle me-2"></i> Đã đánh giá
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
                    <div class="container mt-4">
                        <h3 class="font-weight-bold mb-3 text-center" style="font-size: 24px; color: #343a40; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">Đánh giá sản phẩm</h3>
                        <p class="mb-3 text-center" style="font-size: 16px; color: #6c757d; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">Các sản phẩm ${trangThaiDanhGia}</p>                        
                    	 <c:forEach var="dg" items="${listDanhGia}">
                    	 	<div class="review-container">
                            <!-- Comment Code Above Avatar -->
	                            <div class="comment-code">
	                                <span>Mã bình luận: #${dg.chiTietHD.maChiTiet}</span>
	                            </div>
	                        
	                            <div class="review-header">
	                               <div class="avatar">
	                                    <img src="https://www.vlance.vn/uploads/portfolio/view/c4a875224357fa0f1dce59defcb7a42b3d6d2cab1.jpg" alt="Avatar">
	                                </div>
	                                <div class="review-info">
	                                    <div class="username">${dg.nguoiDung.hoTen}</div>
	                                    <div class="stars">
	                                        <c:forEach var="i" begin="1" end="${dg.soSao}">
						                        <i class="fas fa-star"></i>
						                    </c:forEach>
						                    <!-- Loop to display empty stars for the remaining stars (if any) -->
						                    <c:forEach var="i" begin="${dg.soSao + 1}" end="5">
						                        <i class="far fa-star"></i>
						                    </c:forEach>
	                                    </div>
	                                </div>
	                                <div class="date">${dg.ngayDanhGia}</div>
	                            </div>
	                        
	                            <div class="review-body">
	                                <p>${dg.binhLuan}</p>
	                            </div>
	                            
	                            <!-- Product Details Section (Horizontal layout) -->
	                            <div class="product-details">
	                                <div class="product-image">
	                                    <img src="${dg.sp.hinhAnhSP.duongDanHinh}" alt="${dg.sp.tenSP}">
	                                </div>
	                                <div class="product-info">
	                                    <h5>${dg.sp.tenSP}</h5>
	                                    <p style="margin-top: 0; color: #6c757d;">Size: ${dg.sp.kichCo[0].tenKichCo}, Màu: ${dg.sp.mauSac[0].tenMau}</p>
	                                   
	                                </div>
	                            </div>
	                        
	                            <!-- Edit Icon at Bottom Right -->
	                          <!--   <div class="edit-icon">
	                                <i class="fas fa-edit"></i>
	                            </div> -->
	                            
	                        </div>
                    	 </c:forEach>
	            </div>
	        </div>
    </div>
    

    <script>
	    function setTrangThai(trangThai) {
	        document.getElementById('trangThai').value = trangThai;
	        document.getElementById('orderForm').submit(); // Submit form khi nhấn vào thẻ a
	    }
	    function setRatingTrangThai(trangThai) {
	        document.getElementById('ratingTrangThai').value = trangThai;
	        document.getElementById('ratingForm').submit(); // Submit form khi nhấn vào thẻ a
	    }
    </script>
    <jsp:include page="footer.jsp" />
    <!-- Bootstrap JS, Popper.js, and jQuery -->
   
   	 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
