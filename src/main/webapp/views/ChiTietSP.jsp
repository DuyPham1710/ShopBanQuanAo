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
<script src="./views/js/scriptChiTietSP.js"></script>
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
                    <a class="btn btn-primary font-weight-bold" href="SanPhamController">SẢN PHẨM</a>
                    <span class="nav-icon">
						<div class="notifications">
						    <a href="/project_web/GioHangController">
						        <i class="fas fa-shopping-bag"></i>
						    </a>
						    <span class="notification-badge">6</span>
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
                            <li class="account-info-item"><a href="/project_web/DonHang">Đơn mua</a></li>
                            <li class="account-info-item"><a href="/project_web">Đăng xuất</a></li>
                        </ul>
                        
                    </div>
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
						    <a href="SanPhamController">Sản phẩm / ${sp.danhMuc.tenDanhMuc} / ${sp.tenSP}</a>
						</li>
			        </ol>
			    </nav>
			</div>

            <form action="./ChiTietSPController" method="post" class="product">
            	 <input type="hidden" name="method" value="post">
            	  <input type="hidden" name="maSP" value="${sp.maSP}">	 
		        <div class="product-container">
		            <div class="product-image">
		                <img src="${sp.hinhAnhSP.duongDanHinh}" alt="${sp.tenSP}">
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
			                
			                         <div class="size">
			                            <p>Size:</p>
			                            <div class="button-group1">
									    <c:forEach var="size" items="${sp.kichCo}" varStatus="status">
									        <input type="radio" id="size-${size.maKichCo}" name="size" value="${size.maKichCo}" class="radio-input" 
									               ${status.first ? 'checked' : ''}>
									        <label for="size-${size.maKichCo}" class="button">${size.tenKichCo}</label>
									    </c:forEach>
									</div> 
									</div>
			                     	<div class="vertical-divider"></div> <!-- Đường kẻ dọc -->
			                        
			                        <div class="color">
			                            <p>Màu sắc:</p>
			                            <div class="color-selector">
			                            	<select class="form-select" name="tenmau">
							                    <c:forEach var="color" items="${sp.mauSac}">
							                       <option value="${color.maMau}">${color.tenMau}</option>
							                    </c:forEach>
							                </select>
			                            </div>
			                        </div>
			                    </div>
			                </div>
		             
		        	      <div class="buttons">
		                    <button class="buy-now" name="redirect" value="buyNow">Mua Ngay</button>
		                  <button class="add-to-cart" name="redirect" value="addToCart" onclick="showSuccessToast();">Thêm vào giỏ hàng</button>
		                </div>
		            </div>
		        </div>
		    </form>
		     <div id="toast__Alert"></div>
		  
		    
            <div class="product-description">
            	<div class="description">
            		<h4>Mô tả sản phẩm</h4>
				    <p>
				       ${sp.mota}
				    </p>
            	</div>
            	
			    <div class="description">
            		<h4>Chi tiết sản phẩm</h4>
				    <p>
				    	<span class="product-detail-label">Danh Mục</span>Rimberio > Sản phẩm > ${sp.danhMuc.tenDanhMuc}</br>
                       <span class="product-detail-label">Kho</span>${sp.soLuong}</br>
                       <span class="product-detail-label">Xuất xứ</span>${sp.xuatXu}</br>
                       <span class="product-detail-label">Chất liệu</span>${sp.chatLieu}</br>
                       <span class="product-detail-label">Đã bán</span>${sp.daBan}</br>
                       <span class="product-detail-label">ngày tạo</span>${sp.ngayTao}</br>
				    </p>
            	</div>
			</div>
			
			<div class="product-description">
            	<div class="description width-custom">
            		<h4>Đánh giá sản phẩm</h4>
					<div class="review">
						<c:forEach var="dg" items="${listDanhGia}">
							 <c:if test="${dg.trangThai == 'Đã đánh giá' && dg.sp.maSP == sp.maSP}">
							 	 <div class="review-container">
		                            <div class="review-header">
		                                <div class="avatar">
		                                    <img src="https://www.vlance.vn/uploads/portfolio/view/c4a875224357fa0f1dce59defcb7a42b3d6d2cab1.jpg" alt="User Avatar">
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
		                        </div>
							 </c:if>
							
						</c:forEach>
                       
                        
                    </div>
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
						            <img src="${sp.hinhAnhSP.duongDanHinh}" alt="${sp.tenSP}">
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
   <!--  <script type="text/javascript">
	    function redirectToCheckout() {
	        const maSP = "${sp.maSP}";
	        const size = document.querySelector('input[name="size"]:checked').value;
	        const quantity = document.getElementById('hiddenQuantity').value;
	        const color = document.querySelector('select[name="tenmau"]').value; // Lấy màu sắc đã chọn
	        window.location.href = `thanhToanController?maSP=${maSP}&size=${size}&soLuong=${quantity}&color=${color}`;
	    }	
    </script> -->
    <jsp:include page="footer.jsp" />
    <!-- jQuery (Bootstrap's JavaScript plugins require jQuery) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>