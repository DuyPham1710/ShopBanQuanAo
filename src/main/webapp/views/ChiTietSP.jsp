<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail product</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- FontAwesome -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
<link rel="stylesheet" href="./views/css/style.css">
<link rel="stylesheet" href="./views/css/ChiTietSP.css">
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
                    <a class="nav-link font-weight-bold" href="SanPhamController">SẢN PHẨM</a>
                    <span class="nav-icon"><a href="/project_web/GioHangController"><i class="fas fa-shopping-bag"></i></a></span>
                    <span class="nav-icon"><a href="#"><i class="fas fa-user"></i></a></span>
                </div>
            </div>
        </div>
    </nav>
    
     <!-- Banner -->
    <div class="container mt">
        <div class="container-fluid">
            <div class="col-md-12">
			    <nav aria-label="breadcrumb">
			        <ol class="breadcrumb">
			            <li class="breadcrumb-item" id="home-item">
				            <a href="/project_web/views/home.jsp">
				            	<i class="fas fa-home"></i>
				            </a>
			            </li>
			            <li class="breadcrumb-item active" id="product-item">
						    <a href="SanPhamController">Sản phẩm / ${sp.tenSP}</a>
						</li>
			        </ol>
			    </nav>
			</div>

            <form action="./ChiTietSPController" method="post" class="product">
            	 <input type="hidden" name="method" value="post">
            	  <input type="hidden" name="maSP" value="${sp.maSP}">	 
		        <div class="product-container">
		            <div class="product-image">
		                <img src="${sp.duongDanHinh}" alt="${sp.tenSP}">
		            </div>
		            
		            <div class="product-details">
		                <h1 class="summer-shirt">${sp.tenSP}</h1>
		                <p>Thương hiệu: <a href="#">Golden Accessories</a></p>
		                <div class="box-container">
		                    <hr class="divider">
		                </div>                
		                <p>Giá:</p> 
		
		                <div class="price">
		                    <span class="sale-price">${sp.giaHienTai}₫</span>
		                    <span class="original-price">${sp.giaBanDau}₫</span>
		                </div>
		                <div class="box-container">
		                    <hr class="divider">
		                </div>  
		                
		                
		                <div class="change-details">
		                    <div class="details-group">
		                        <div class="quantity">
								    <p>Số lượng:</p>
								    <div class="button-group">
								        <div class="button" onclick="changeQuantity(-1, ${sp.soLuong})">-</div>
								        <div class="button quantity-display" id="quantity">1</div>
								        <input type="hidden" name="soLuong" id="hiddenQuantity" value="1">
								        <div class="button" onclick="changeQuantity(1, ${sp.soLuong})">+</div>
								    </div>	
								</div>
								<div class="vertical-divider"></div> <!-- Đường kẻ dọc -->
		                        <script>
								    function changeQuantity(value, maxValue) {
								        // Lấy phần tử hiển thị số lượng
								        const quantityElement = document.getElementById("quantity");
								        let quantity = parseInt(quantityElement.innerText);
								        
								        // Tăng hoặc giảm số lượng
								        quantity += value;
								        
								        // Đảm bảo số lượng không nhỏ hơn 1
								        if (quantity < 1) {
								            quantity = 1;
								        }
								        /* if (quantity > maxValue) {
							            	alert("Số lượng không được vượt quá số lượng tồn kho.");
								            quantity = maxValue;
								        }  */
								        if (quantity > maxValue) {
								            // Hiển thị toast khi số lượng vượt quá tồn kho
								            const toast = new bootstrap.Toast(document.getElementById('quantityToast'));
								            toast.show();
								            quantity = maxValue; // Đặt lại số lượng về giá trị tối đa
								        }
								        // Cập nhật lại giá trị số lượng trên trang
								        quantityElement.innerText = quantity;
								        hiddenQuantity.value = quantity;
								    }
								    function setSize(button, size) {
								        const hiddenSize = document.getElementById("hiddenSize");
								        hiddenSize.value = size; // Cập nhật giá trị ẩn khi chọn size
								    }
								   
								</script>
		                        <div class="size">
		                            <p>Size:</p>
		                            <div class="button-group1">
		                            	<c:forEach var="size" items="${ListSize}">			                    
					                      <button type="button" class="button selected" onclick="setSize(this,'${size.maKichThuoc}')">${size.tenKichThuoc}</button>
						                </c:forEach>
										<input type="hidden" name="size" id="hiddenSize" value="">
		                            </div>
		                            
		                        </div>
		                     	<div class="vertical-divider"></div> <!-- Đường kẻ dọc -->
		                        
		                        <div class="color">
		                            <p>Màu sắc:</p>
		                            <div class="color-selector">
		                            	<select class="form-select" name="tenmau">
						                    <c:forEach var="color" items="${ListMau}">
						                       <option value="${color.maMau}">${color.tenMau}</option>
						                    </c:forEach>
						                </select>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                
		                <div class="buttons">
		                    <button class="buy-now">Mua Ngay</button>
		                    <button class="add-to-cart" onclick="addToCart()">Thêm vào giỏ hàng</button>
		                </div>
		            </div>
		        </div>
		    </form>
		    
		  

		    
            <div class="product-description">
            	<div class="description">
            		<h4>Mô tả sản phẩm</h4>
				    <p>
				       ${sp.mota}
				    </p>
            	</div>
			    
			</div>
			
			<div class="product-description">
            	<div class="description">
            		<h4>Các sản phẩm tương tự</h4>
					<div class="product-grid">
					     <c:forEach var="sp" items="${ListSPTuongTu}">
					     	<form action="./ChiTietSPController" method="post">
					     		<div class="product-card hover-effect" onclick="this.closest('form').submit();">
						            <div class="discount">-${sp.giamGia}%</div>
						            <img src="${sp.duongDanHinh}" alt="${sp.tenSP}">
						            <div class="product-info">
						                <h3>${sp.tenSP} <span class="hot">Hot</span></h3>
						                <p class="price">${sp.giaHienTai}đ <span class="original-price">${sp.giaBanDau}đ</span></p>
						                <h4 class="buy-now-similar">Mua Ngay</h4>
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
    </div>
    
    <jsp:include page="footer.jsp" />
     <script>
     	function addToCart() {
     		const toast = new bootstrap.Toast(document.getElementById('cartToast'));
            toast.show();
		}
	</script>
	<!-- Toast thông báo khi số lượng vượt quá tồn kho -->
	<div class="toast-container position-fixed top-60px end-0 p-3" id="toast-container">
	  <div id="quantityToast" class="toast align-items-center text-bg-danger border-0" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true" data-bs-delay="6000">
	    <div class="d-flex">
	      <div class="toast-body">
	        Số lượng bạn yêu cầu vượt quá số lượng tồn kho.
	      </div>
	      <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
	    </div>
	  </div>
	</div>
	
	 <div class="toast-container position-fixed top-60px end-0 p-3" id="toast-container">
		<div id="cartToast" class="toast align-items-center text-bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="false">
			<div class="d-flex">
				<div class="toast-body">
					Thêm vào giỏ hàng thành công!
				</div>
				<button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
			</div>
		</div>
	</div>
    <!-- jQuery (Bootstrap's JavaScript plugins require jQuery) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>