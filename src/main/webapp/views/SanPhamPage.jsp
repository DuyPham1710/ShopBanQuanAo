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
                     <form action="/project_web/SanPhamController" method="get" class="d-flex">
		                <input class="form-control me-2" type="search" name="searchText" placeholder="Tìm kiếm sản phẩm" aria-label="Search">
		                <button class="btn btn-outline-secondary" type="submit">
		                    <i class="fas fa-search"></i>
		                </button>
		            </form>
                </div>
                <div class="navbar-nav">
                    <a class="nav-link font-weight-bold" href="/project_web/views/home.jsp">TRANG CHỦ</a>
                    <a class="btn btn-primary font-weight-bold" href="SanPhamController">SẢN PHẨM</a>
                    <span class="nav-icon">
						<div class="notifications">
						    <a href="/project_web/GioHangController">
						        <i class="fas fa-shopping-bag"></i>
						    </a>
						    <span class="notification-badge">${soSanPhamGioHang}</span>
					    </div>
					</span>
                     <span class="nav-icon" id="account-icon">
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
			    <form action="SanPhamController" method="get">
				    <select class="form-select mt-1" name="sortType" aria-label="Default select example" style="width: auto;" onchange="this.form.submit()">
				        <option value="0" ${param.sortType == '0' || param.sortType == null ? 'selected' : ''}>Sản phẩm nổi bật</option>
				        <option value="1" ${param.sortType == '1' ? 'selected' : ''}>Giá: Tăng dần</option>
				        <option value="2" ${param.sortType == '2' ? 'selected' : ''}>Giá: Giảm dần</option>
				        <option value="3" ${param.sortType == '3' ? 'selected' : ''}>Tên: A-Z</option>
				        <option value="4" ${param.sortType == '4' ? 'selected' : ''}>Tên: Z-A</option>
				        <option value="5" ${param.sortType == '5' ? 'selected' : ''}>Cũ nhất</option>
				        <option value="6" ${param.sortType == '6' ? 'selected' : ''}>Mới nhất</option>
				        <option value="7" ${param.sortType == '7' ? 'selected' : ''}>Bán chạy nhất</option>
				        <option value="8" ${param.sortType == '8' ? 'selected' : ''}>Tồn kho: giảm dần</option>
				    </select>
				</form>
			    
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
                        	 <form action="SanPhamController" method="get">
					            <input type="hidden" name="maDanhMuc" value="0">
					            <button type="submit" class="btn btn-link">Tất cả</button>
					        </form>
                        	 <c:forEach var="danhMuc" items="${ListDanhMuc}">
                        	 	<form action="SanPhamController" method="get">
						            <input type="hidden" name="maDanhMuc" value="${danhMuc.maDanhMuc}">
						            <button type="submit" class="btn btn-link">${danhMuc.tenDanhMuc}</button>
						        </form>
                        	</c:forEach> 
                        </div>
                    </div>
                    
                    <div class="filter_category">
                        <div class="filter_category-title font-weight-bold">Giá sản phẩm</div>
                        <div class="icon-controls"><i class="fas fa-sort-down"></i></div>
                        <div class="dropdown-content">
                       	 	<form action="SanPhamController" method="post">
	                       	 	<button type="submit" name="giaHienTai" value="-1" class="btn btn-link">
					                <span class="price-range">Tất cả</span>
					            </button>
                       	 		<button type="submit" name="giaHienTai" value="0-300000" class="btn btn-link">
					                <span class="price-range">Dưới 300,000₫</span>
					            </button>
					            
					            <button type="submit" name="giaHienTai" value="300000-500000" class="btn btn-link">
					                <span class="price-range">300,000₫ - 500,000₫</span>
					            </button>
					            
					            <button type="submit" name="giaHienTai" value="500000-700000" class="btn btn-link">
					                <span class="price-range">500,000₫ - 700,000₫</span>
					            </button>
					            
					            <button type="submit" name="giaHienTai" value="700000-1000000" class="btn btn-link">
					                <span class="price-range">700,000₫ - 1,000,000₫</span>
					            </button>
					            
					            <button type="submit" name="giaHienTai" value="1000000+" class="btn btn-link">
					                <span class="price-range">Trên 1,000,000₫</span>
					            </button>
					        </form>
                        </div>
                    </div>

                    <div class="filter_category">
                        <div class="filter_category-title font-weight-bold">Màu sắc</div>
                        <div class="icon-controls"><i class="fas fa-sort-down"></i></div>
                        <div class="dropdown-content color-options">
                          <c:forEach var="item" items="${listMauHex}">
						        <div class="color-circle" style="background-color: ${item};" data-color="${item}" onclick="toggleColor(this)">
						            <span class="tick">&#10003;</span>
						        </div>
						    </c:forEach>

                        </div>
                    </div>
                 
                    <div class="filter_category">
					    <div class="filter_category-title font-weight-bold">Kích thước</div>
					    <div class="icon-controls"><i class="fas fa-sort-down"></i></div>
					    <div class="dropdown-content size-options">
					        <c:forEach var="item" items="${listAllSize}">
					            <div class="size-option" data-size="${item}" onclick="toggleSizeSelection(this)">${item}</div>
					        </c:forEach>
					    </div>
					</div>
					
                </div> 
            </div>
			
            <div class="container1">
			    <div class="section-header">
				    <h2>Tất cả sản phẩm</h2>
				    <a href="#" class="view-more">Xem Thêm</a>
				</div>
			    <div id="product-grid" class="product-grid">
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
    <script>
        const selectedColors = new Set();
        const selectedSizes = new Set();
        
        function toggleColor(element) {
            const color = element.getAttribute("data-color");

            if (selectedColors.has(color)) {
                selectedColors.delete(color); // Bỏ chọn nếu đã chọn trước đó
                element.classList.remove("selected");
            } else {
                selectedColors.add(color); // Thêm màu vào danh sách chọn
                element.classList.add("selected");
            }

            fetchProductsByColors();
        }
        
        function fetchProductsByColors() {
            const colorsArray = Array.from(selectedColors);
            const colorsParam = colorsArray.join(',');

            fetch(`/project_web/SanPhamController`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "X-colorsParam": colorsParam,
                    "_method": "LocMau",
                },
                body: `colors=${colorsParam}`,
            })
            .then((response) => response.text())  
            .then((data) => {
                renderProducts(data);  
            })
            .catch(error => {
                console.error("Error:", error);
                alert("Không thể tải sản phẩm!");
            });
        }

       
        
		function toggleSizeSelection(element) {
		    const size = element.getAttribute("data-size");

		    if (selectedSizes.has(size)) {
		        selectedSizes.delete(size); 
		        element.classList.remove("selected");
		    } else {
		        selectedSizes.add(size); 
		        element.classList.add("selected");
		    }

		    fetchProductsBySizes();
		}

		function fetchProductsBySizes() {
		    const sizesArray = Array.from(selectedSizes);
		    const sizesParam = sizesArray.join(',');

		    fetch(`/project_web/SanPhamController`, {
		        method: "POST",
		        headers: {
		            "Content-Type": "application/json",
		            "X-sizesParam": sizesParam,
		            "_method": "LocSize",
		        },
		        body: `sizes=${sizesParam}`,
		    })
		    .then((response) => response.text())
		    .then((data) => {
		        renderProducts(data); 
		    })
		    .catch(error => {
		        console.error("Error:", error);
		        alert("Không thể tải sản phẩm!");
		    });
		}	
		
	 	function renderProducts(data) {
            const container = document.getElementById("product-grid");
            container.innerHTML = data;  
        }
   </script>
</body>
</html>