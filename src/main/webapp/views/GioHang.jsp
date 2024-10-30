<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/styleGioHang.css">
</head>
<body>
	 <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <div class="justify-content-between d-flex align-items-center">
                <div class="d-flex align-items-center">
                    <a class="navbar-brand" href="#">
                        <img src="./images/logo.jpg" alt="Logo">
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
                    <a class="nav-link" href="/project_web/SanPhamController">SẢN PHẨM</a>
                    <span class="nav-icon-primary"><a href="/project_web/views/GioHang.jsp"><i class="fas fa-shopping-bag"></i></a></span>
                    <span class="nav-icon"><a href="./TaiKhoan.html"><i class="fas fa-user"></i></a></span>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
	<div class="container my-5">
	    <div class="row">
	      <!-- Product Cart -->
	      <div class="col-md-8">
	        <nav aria-label="breadcrumb">
	            <ol class="breadcrumb bg-white px-0">
	                <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
	                <li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
	            </ol>
	        </nav>
	        
	        <table class="table border-top">
	            <thead>
	                <tr>
	                <th><input type="checkbox"></th>
	                <th>Sản phẩm</th>
	                <th>Số lượng</th>
	                <th>Giá</th>
	                <th></th>
	                </tr>
	            </thead>
	
	            <tbody>
	                <tr>
	                    <div class = "Product">
	                        <td><input type="checkbox"></td>
	                        <td>
	                            <div class="d-flex align-items-center">
	                            <img src="picture\OIP.jfif" alt="Blue Pants" class="img-thumbnail" style="width: 80px; height: auto;">
	                            <div class="ml-3">
	                                <p class="mb-1 font-weight-bold">Blue Pants</p>
	                                <p class="mb-0 text-muted">Golden Accessories</p>
	                                <p class="mb-0 text-muted">Size: M, Màu: Vàng</p>
	                            </div>
	                            </div>
	                        </td>
	                        <td>
	                            <div class="input-group">
	                            <div class="input-group-prepend">
	                                <button class="btn btn-outline-secondary btn-sm">-</button>
	                            </div>
	                            <input type="text" class="form-control text-center" value="1" style="width: 40px;">
	                            <div class="input-group-append">
	                                <button class="btn btn-outline-secondary btn-sm">+</button>
	                            </div>
	                            </div>
	                        </td>
	                        <td>
	                            <p class="mb-0 text-danger">105,000đ</p>
	                            <p class="mb-0 text-muted"><del>150,000đ</del></p>
	                        </td>
	                        <td><button class="btn btn-link text-danger"><i class="fas fa-trash-alt"></i></button></td>
	                    </div>
	                    
	                </tr>
	
	                <tr>
	                    <td><input type="checkbox"></td>
	                    <td>
	                        <div class="d-flex align-items-center">
	                        <img src="picture\OIP.jfif" alt="Blue Pants" class="img-thumbnail" style="width: 80px; height: auto;">
	                        <div class="ml-3">
	                            <p class="mb-1 font-weight-bold">Blue Pants</p>
	                            <p class="mb-0 text-muted">Golden Accessories</p>
	                            <p class="mb-0 text-muted">Size: M, Màu: Vàng</p>
	                        </div>
	                        </div>
	                    </td>
	                    <td>
	                        <div class="input-group">
	                        <div class="input-group-prepend">
	                            <button class="btn btn-outline-secondary btn-sm">-</button>
	                        </div>
	                        <input type="text" class="form-control text-center" value="1" style="width: 40px;">
	                        <div class="input-group-append">
	                            <button class="btn btn-outline-secondary btn-sm">+</button>
	                        </div>
	                        </div>
	                    </td>
	                    <td>
	                        <p class="mb-0 text-danger">105,000đ</p>
	                        <p class="mb-0 text-muted"><del>150,000đ</del></p>
	                    </td>
	                    <td><button class="btn btn-link text-danger"><i class="fas fa-trash-alt"></i></button></td>
	                </tr>
	            </tbody>
	        </table>
	    </div>
	  
	      <!-- Order Summary -->
	    <div class="col-md-4">
	        <div class="card">
	          <div class="card-body">
	            <h5 class="card-title font-weight-bold">Thông tin đơn hàng</h5>
	            <div class="d-flex justify-content-between">
	              <span>Tạm tính</span>
	              <span>105,000đ</span>
	            </div>
	            <div class="d-flex justify-content-between">
	              <span>Phí vận chuyển</span>
	              <span>30,000đ</span>
	            </div>
	            <hr>
	            <div class="d-flex justify-content-between font-weight-bold text-danger">
	              <span>Tổng tiền</span>
	              <span>135,000đ</span>
	            </div>
	            <button class="btn btn-dark btn-block mt-3">THANH TOÁN ĐƠN HÀNG</button>
	          </div>
	        </div>
	
	        
	
	      </div>
	    </div>
	  </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>

</body>
</html>