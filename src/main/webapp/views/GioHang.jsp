<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./views/css/styleGioHang.css">
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
		                <input class="form-control me-2 mr-2" type="search" placeholder="Search Products" aria-label="Search">
		                <button class="btn btn-outline-secondary" type="submit">
		                    <i class="fas fa-search"></i>
		                </button>
		            </form>
                </div>
                <div class="navbar-nav">
                    <a class="nav-link font-weight-bold" href="/project_web/views/home.jsp">TRANG CHỦ</a>
                    <a class="nav-link font-weight-bold" href="/project_web/SanPhamController">SẢN PHẨM</a>
                    <span class="nav-icon-primary"><a href="/project_web/GioHangController"><i class="fas fa-shopping-bag"></i></a></span>
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
                        <li class="breadcrumb-item"><a href="./index.html">Trang chủ</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
                    </ol>
                </nav>
    
                <!-- Cart Header -->
                <div class="cart-header d-flex border-top border-bottom py-2 font-weight-bold">
                    <div class="col-1 cart-check"><input type="checkbox"></div>
                    <div class="col-5 cart-product">Sản phẩm</div>
                    <div class="col-3 cart-quantity">Số lượng</div>
                    <div class="col-2 cart-price">Giá</div>
                    <div class="col-1 cart-action">
                        <i class="fas fa-trash-alt"></i>
                    </div>
                </div>
                <!-- Cart Items -->
                <div class="cart-items">
                    <!-- Cart Item 1 -->
                    <c:forEach var="gh" items="${ListGH}">
                    	<form action="./GioHangController" method="post">
	                    	<div class="cart-item d-flex align-items-center py-3">
		                        <div class="cart-check" style="width: 5%;"><input type="checkbox"></div>
		                        <div class="cart-product d-flex align-items-center" style="width: 45%;">
		                            <img src="${gh.duongDanHinh}" alt="${gh.tenSP}" class="img-thumbnail" style="width: 80px; height: auto;">
		                            <div class="ml-3">
		                                <p class="mb-1 font-weight-bold">Blue Pants</p>
		                                <p class="mb-0 text-muted">${gh.tenSP}</p>
		                                <p class="mb-0 text-muted">Size: ${gh.kichThuoc}, Màu: ${gh.mauSac}</p>
		
		                            </div>
		                        </div>
		                        <div class="cart-quantity" style="width: 25%;">
		                           <div class="button-group">
									    <div class="button" onclick="changeQuantity(-1, ${gh.maSP})">-</div>
									    <div class="button quantity-display" id="quantity-${gh.maSP}">${gh.soLuong}</div>
									    <input type="hidden" name="soLuong" id="hiddenQuantity-${gh.maSP}" value="${gh.soLuong}">
									    <div class="button" onclick="changeQuantity(1, ${gh.maSP})">+</div>
									</div>
								    <script>
									    function changeQuantity(value, maSP) {
									        // Lấy phần tử hiển thị số lượng và giá trị ẩn của sản phẩm tương ứng
									        const quantityElement = document.getElementById("quantity-" + maSP);
									        const hiddenQuantity = document.getElementById("hiddenQuantity-" + maSP);
									        
									        // Chuyển đổi số lượng thành số nguyên
									        let quantity = parseInt(quantityElement.innerText);
									        
									        // Tăng hoặc giảm số lượng
									        quantity += value;
									        
									        // Đảm bảo số lượng không nhỏ hơn 1
									        if (quantity < 1) {
									            quantity = 1;
									        }
									        
									        // Cập nhật lại giá trị số lượng trên trang và giá trị ẩn
									        quantityElement.innerText = quantity;
									        hiddenQuantity.value = quantity;
									    }
									</script>
		                        </div>
		                        <div class="cart-price" style="width: 20%;">
		                            <p class="mb-0 price">${gh.giaHienTai * gh.soLuong}đ</p>
		                            <p class="mb-0 text-muted"><del>${gh.giaBanDau * gh.soLuong}đ</del></p>
		                        </div>
		                        <input type="hidden" name="maSP" value="${gh.maSP}">	
		                        <div class="cart-action" style="width: 5%;"><button class="btn btn-link text-danger"><i class="fas fa-trash-alt"></i></button></div>
		                    </div>
	                    </form>
                    </c:forEach>
                    
                </div>
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
    
    <jsp:include page="footer.jsp" />
    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>




