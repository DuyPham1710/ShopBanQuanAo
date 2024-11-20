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
    <nav class="navbar navbar-expand-lg navbar-light bg-light navbar1">
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
                    <a class="nav-link font-weight-bold" href="/project_web/views/home.jsp">TRANG CHỦ</a>
                    <a class="btn btn-primary font-weight-bold" href="SanPhamController">SẢN PHẨM</a>
                    <span class="nav-icon"><a href="/project_web/GioHangController"><i class="fas fa-shopping-bag"></i></a></span>
                     <span class="nav-icon" id="account-icon">
                        <a href="/project_web/TaiKhoanController">
                            <i class="fas fa-user"></i>
                        </a>
                    </span>

                    <div class="account-info" id="account-info">
                        <ul>
                            <li class="account-info-item"><a href="/project_web/TaiKhoanController">Tài khoản của tôi</a></li>
                            <li class="account-info-item"><a href="#">Đơn mua</a></li>
                            <li class="account-info-item"><a href="/project_web">Đăng xuất</a></li>
                        </ul>
                        
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <!-- Banner -->
    <div class="container1 mt">
        <div class="container1">
            <div class="col-md-12 d-flex justify-content-between align-items-center">
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
			    
			    <select class="form-select mt-1" aria-label="Default select example" style="width: 30%;">
                    <option selected>Sản phẩm nổi bật</option>
                    <option value="1">Giá: Tăng dần</option>
                    <option value="2">Giá: Giảm dần</option>
                    <option value="3">Tên: A-Z</option>
                    <option value="4">Tên: Z-A</option>
                    <option value="5">Cũ nhất</option>
                    <option value="6">Mới nhất</option>
                    <option value="7">Bán chạy nhất</option>
                    <option value="8">Tồn kho: giảm dần</option>
                </select>
			</div>
			
			<!-- Filter -->
			<div class="container-filter">
                <div class="filter-container">
                    <div class="filter-button font-weight-bold">
                        <i class="fas fa-filter"></i>
                        <span class="filter-title">Bộ Lọc</span> 
                    </div>

                    <div class="filter_category">
                        <div class="filter_category-title font-weight-bold">Danh mục</div>
                        <div class="icon-controls"><i class="fas fa-sort-down"></i></div>
                        <div class="dropdown-content">
                            <div>Danh mục 1</div>
                            <div>Danh mục 2</div>
                            <div>Danh mục 3</div>
                        </div>
                    </div>
                    
                    <div class="filter_category">
                        <div class="filter_category-title font-weight-bold">Giá sản phẩm</div>
                        <div class="icon-controls"><i class="fas fa-sort-down"></i></div>
                        <div class="dropdown-content">
                            <div>Thấp đến Cao</div>
                            <div>Cao đến Thấp</div>
                        </div>
                    </div>

                    <div class="filter_category">
                        <div class="filter_category-title font-weight-bold">màu sắc</div>
                        <div class="icon-controls"><i class="fas fa-sort-down"></i></div>
                        <div class="dropdown-content color-options">
                            <div class="color-circle" style="background-color: #ffb6c1;" onclick="toggleColorSelect(this)">
                                <span class="tick">&#10003;</span> <!-- Dấu tick -->
                            </div>
                            <div class="color-circle" style="background-color: #ffdf00;" onclick="toggleColorSelect(this)">
                                <span class="tick">&#10003;</span> <!-- Dấu tick -->
                            </div>
                            <div class="color-circle" style="background-color: #d3d3d3;" onclick="toggleColorSelect(this)">
                                <span class="tick">&#10003;</span> <!-- Dấu tick -->
                            </div>
                            <div class="color-circle" style="background-color: #00ff7f;" onclick="toggleColorSelect(this)">
                                <span class="tick">&#10003;</span> <!-- Dấu tick -->
                            </div>
                            <div class="color-circle" style="background-color: #8b4513;" onclick="toggleColorSelect(this)">
                                <span class="tick">&#10003;</span> <!-- Dấu tick -->
                            </div>
                            <div class="color-circle" style="background-color: #696969;" onclick="toggleColorSelect(this)">
                                <span class="tick">&#10003;</span> <!-- Dấu tick -->
                            </div>
                            <div class="color-circle" style="background-color: #000000;" onclick="toggleColorSelect(this)">
                                <span class="tick">&#10003;</span> <!-- Dấu tick -->
                            </div>
                            <div class="color-circle" style="background-color: #ff6347;" onclick="toggleColorSelect(this)">
                                <span class="tick">&#10003;</span> <!-- Dấu tick -->
                            </div>
                            <div class="color-circle" style="background-color: #9370db;" onclick="toggleColorSelect(this)">
                                <span class="tick">&#10003;</span> <!-- Dấu tick -->
                            </div>
                            <div class="color-circle" style="background-color: #ff4500;" onclick="toggleColorSelect(this)">
                                <span class="tick">&#10003;</span> <!-- Dấu tick -->
                            </div>
                            <div class="color-circle" style="background-color: #b0e0e6;" onclick="toggleColorSelect(this)">
                                <span class="tick">&#10003;</span> <!-- Dấu tick -->
                            </div>
                            <div class="color-circle" style="background-color: #4682b4;" onclick="toggleColorSelect(this)">
                                <span class="tick">&#10003;</span> <!-- Dấu tick -->
                            </div>
                        </div>
                    </div>
                    <script>
                        function toggleColorSelect(element) {
                            // Kiểm tra nếu đã chọn màu rồi, nếu có thì bỏ chọn (ẩn dấu tick)
                            if (element.classList.contains('selected')) {
                                element.classList.remove('selected');
                            } else {
                                // Nếu chưa chọn màu, hiển thị dấu tick
                                element.classList.add('selected');
                            }
                        }
                        
                    </script>
                    <div class="filter_category">
                        <div class="filter_category-title font-weight-bold">Kích thước</div>
                        <div class="icon-controls"><i class="fas fa-sort-down"></i></div>
                        <div class="dropdown-content size-options">
                            <div class="size-option">S</div>
                            <div class="size-option">M</div>
                            <div class="size-option selected">L</div>
                            <div class="size-option">XL</div>
                        </div>
                    </div>
                </div> 
            </div>
			
            <div class="container1">
			    <div class="section-header">
				    <h2>Tất cả sản phẩm</h2>
				    <a href="#" class="view-more">Xem Thêm</a>
				</div>
			    <div class="product-grid">
				     <c:forEach var="sp" items="${ListSP}">
				     	<form action="./ChiTietSPController" method="post">
				     		<div class="product-card hover-effect" onclick="this.closest('form').submit();">
					            <div class="discount">-${sp.giamGia}%</div>
					            <img src="${sp.hinhAnhSP.duongDanHinh}" alt="${sp.tenSP}">
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