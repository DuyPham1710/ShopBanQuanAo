<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sản phẩm</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- FontAwesome -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
<link rel="stylesheet" href="./views/css/style.css">
<link rel="stylesheet" href="./views/css/SanPhamPage.css">
</head>
<body>
	<!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <div class="justify-content-between d-flex align-items-center">
                <div class="d-flex align-items-center">
                    <a class="navbar-brand" href="/project_web/views/home.jsp">
                        <img src="./views/images/logo.jpg" alt="Logo">
                    </a>
                     <form class="d-flex">
		                <input class="form-control me-2" type="search" placeholder="Search Products" aria-label="Search">
		                <button class="btn btn-outline-secondary" type="submit">
		                    <i class="fas fa-search"></i>
		                </button>
		            </form>
                </div>
                <div class="navbar-nav">
                    <a class="nav-link" href="/project_web/views/home.jsp">TRANG CHỦ</a>
                    <a class="btn btn-primary" href="SanPhamController">SẢN PHẨM</a>
                    <span class="nav-icon"><a href="/project_web/views/GioHang.jsp"><i class="fas fa-shopping-bag"></i></a></span>
                    <span class="nav-icon"><a href="#"><i class="fas fa-user"></i></a></span>
                </div>
            </div>
        </div>
    </nav>

    <!-- Banner -->
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12">
			    <nav aria-label="breadcrumb">
			        <ol class="breadcrumb">
			            <li class="breadcrumb-item" id="home-item">
				            <a href="/project_web/views/home.jsp">
				            	<i class="fas fa-home"></i>
				            </a>
			            </li>
			            <li class="breadcrumb-item active" id="product-item"> Sản phẩm</li>
			        </ol>
			    </nav>
			</div>

            <div class="container">
			    <div class="section-header">
				    <h2>Được mua nhiều</h2>
				    <a href="#" class="view-more">Xem Thêm</a>
				</div>
			    <div class="product-grid">
				     <c:forEach var="sp" items="${ListSP}">
				     	<form action="./ChiTietSPController" method="post">
				     		<div class="product-card hover-effect" onclick="this.closest('form').submit();">
					            <div class="discount">-${sp.giamGia}%</div>
					            <img src="${sp.duongDanHinh}" alt="${sp.tenSP}">
					            <div class="product-info">
					                <h3>${sp.tenSP} <span class="hot">Hot</span></h3>
					                <p class="price">${sp.giaHienTai}đ <span class="original-price">${sp.giaBanDau}đ</span></p>
					                <h4 class="buy-now">Mua Ngay</h4>
					            </div>
					        </div>
					        <input type="hidden" name="method" value="get">
					        <input type="hidden" name="maSP" value="${sp.maSP}">	           
				     	</form>
				    </c:forEach>
				        
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
</body>
</html>