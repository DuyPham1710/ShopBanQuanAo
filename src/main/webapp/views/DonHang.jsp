<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
   
    <title>Đơn hàng Của Tôi</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
	<link rel="stylesheet" href="./views/css/style.css">
    <link rel="stylesheet" href="./views/css/styleTaiKhoan.css">
    <link rel="stylesheet" href="./views/css/styleDonHang.css">
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
                    <a class="nav-link font-weight-bold" href="SanPhamController">SẢN PHẨM</a>
                    <span class="nav-icon">
						<div class="notifications">
						    <a href="/project_web/GioHangController">
						        <i class="fas fa-shopping-bag"></i>
						    </a>
						    <span class="notification-badge">${soSanPhamGioHang }</span>
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
	            <div class="col-md-9 bg-white py-4 px-5">
                    <div class="container mt-4">
                        <h3 class="font-weight-bold mb-3 text-center" style="font-size: 24px; color: #343a40; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">Đơn Hàng</h3>
                        <p class="mb-3 text-center" style="font-size: 16px; color: #6c757d; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">Kiểm tra và theo dõi trạng thái đơn hàng của bạn</p>                        
                    	<c:forEach var="donMua" items="${DanhSachDonHang}">
	                        <div class="card mb-3 order-card">
	                            <div class="card-body">
	                                <div class="d-flex w-100 justify-content-between">
	                                    <h5 class="font-weight-bold mb-3" style="background-color: #f1f1f1; padding: 8px 20px; border-radius: 5px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); color: #343a40; font-size: 16px; border: 1px solid #ced4da;">
	                                        <i class="fas fa-box"></i> Đơn Hàng: #${donMua.maHoaDon}
	                                    </h5>
	                                    <small class="text-muted">Ngày đặt: ${donMua.ngayDat}</small>
	                                </div>
	                    
	                                <div class="d-flex align-items-center">
	                                    <img src="${donMua.chiTietHD[0].sp.hinhAnhSP.duongDanHinh}" alt="${donMua.chiTietHD[0].sp.tenSP}" class="rounded" style="width: 80px; height: 80px; object-fit: cover; margin-right: 20px;">
	                                    <div class="ms-3 flex-grow-1">
	                                        <h4>${donMua.chiTietHD[0].sp.tenSP}</h4>
	                                        <p class="mb-1">Size: ${donMua.chiTietHD[0].sp.kichCo[0].tenKichCo}, Màu: ${donMua.chiTietHD[0].sp.mauSac[0].tenMau}</p>
	                                        <small class="text-muted">x${donMua.chiTietHD[0].soLuongDaMua}</small>
	                                        <p class="mb-1">Trạng thái: 
											    <span class="badge 
											        <c:choose>
											            <c:when test="${donMua.trangThai == 'Chờ xác nhận'}">bg-warning text-dark</c:when>
											            <c:when test="${donMua.trangThai == 'Đang giao'}">bg-info text-dark</c:when>
											            <c:when test="${donMua.trangThai == 'Đã giao'}">bg-success text-white</c:when>
											            <c:when test="${donMua.trangThai == 'Đã hủy'}">bg-danger text-white</c:when>
											            <c:otherwise>bg-secondary text-light</c:otherwise>
											        </c:choose>">
											        <i class="fas 
											            <c:choose>
											                <c:when test="${donMua.trangThai == 'Chờ xác nhận'}">fa-clock</c:when>
											                <c:when test="${donMua.trangThai == 'Đang giao'}">fa-truck</c:when>
											                <c:when test="${donMua.trangThai == 'Đã giao'}">fa-check</c:when>
											                <c:when test="${donMua.trangThai == 'Đã hủy'}">fa-times-circle</c:when>
											                <c:otherwise>fa-question-circle</c:otherwise>
											            </c:choose> me-2"></i>
											        ${donMua.trangThai}
											    </span>
											</p>
	                                        <small class="text-muted">Giao đến: ${donMua.diaChiNhanHang}</small>
	                                        <p class="mb-1 text-muted">Còn: ${donMua.chiTietHD.size()-1} sản phẩm khác</p>
	                                        
	                                    </div>
	                                    
	                                    <div class="ms-auto">
	                                        <p class="mb-1 text-end product-price"><strong>${donMua.chiTietHD[0].donGia} VND</strong></p>
	                                    </div>
	                                    
	                                     <!-- Nút Đánh giá -->
	                                      <c:if test="${donMua.trangThai == 'Đã giao'}">
	                                     	 <c:forEach var="dg" items="${listDanhGia}">
	                                     	 	<c:if test="${dg.sp.maSP == donMua.chiTietHD[0].sp.maSP}">
									                <c:if test="${dg.chiTietHD.maChiTiet == donMua.chiTietHD[0].maChiTiet && dg.trangThai == 'Chưa đánh giá'}">
									                    <button class="btn btn-success btn-sm d-flex align-items-center gap-2" 
									                            data-bs-toggle="modal" 
									                            data-bs-target="#ratingModal" 
									                            onclick="Evaluate(${donMua.chiTietHD[0].sp.maSP}, ${donMua.chiTietHD[0].maChiTiet})">
									                        <i class="fas fa-star"></i> Đánh giá
									                    </button>
									                </c:if>

									                <c:if test="${dg.chiTietHD.maChiTiet == donMua.chiTietHD[0].maChiTiet &&  dg.trangThai == 'Đã đánh giá'}">
									                    <button class="btn btn-success btn-sm d-flex align-items-center gap-2" disabled>
									                        <i class="fas fa-check-circle"></i> Đã đánh giá
									                    </button>
									                </c:if> 
										            
	                                     	 	<%--    <button class="btn btn-success btn-sm d-flex align-items-center gap-2" data-bs-toggle="modal" data-bs-target="#ratingModal" onclick="Evaluate(${donMua.chiTietHD[0].sp.maSP}, ${donMua.chiTietHD[0].maChiTiet})">
													    <i class="fas fa-star"></i> ${dg.trangThai}
													</button>  --%>
	                                     	 	</c:if>
	                                     	 </c:forEach>
	                                       
	                                      </c:if>
							         
										
	                                    <!-- Nút Mua lại -->
	                                    <form action="./ChiTietSPController" method="post">
	                                         <c:if test="${donMua.trangThai == 'Đã giao' || donMua.trangThai == 'Đã hủy'}">
		                                    	<input type="hidden" name="method" value="get">
						        				<input type="hidden" name="maSP" value="${donMua.chiTietHD[0].sp.maSP}">	
		                                       <button class="btn btn-custom btn-sm d-flex align-items-center gap-2" style="margin-right: -45px;">
												    <i class="fas fa-shopping-cart"></i> Mua lại
												</button>
		                                     </c:if>
	                                    </form>
	                               

	                                    <button class="toggle-details" type="button" data-bs-toggle="collapse" data-bs-target="#orderDetails${donMua.maHoaDon}" aria-expanded="false" aria-controls="orderDetails${donMua.maHoaDon}">
	                                        <i class="fa-solid fa-chevron-left"></i>
	                                    </button>
	                                </div>
	                              
	                            </div>
	                            <!-- Danh sách sản phẩm mở rộng -->
	                            <div class="collapse" id="orderDetails${donMua.maHoaDon}">
	                                <div class="card-body">
	                                	<c:forEach var="ChiTietHD" items="${donMua.chiTietHD}" begin="1">
		                                    <div class="d-flex align-items-center mb-3">
		                                        <img src="${ChiTietHD.sp.hinhAnhSP.duongDanHinh}" alt="${ChiTietHD.sp.tenSP}" class="rounded" style="width: 60px; height: 60px; object-fit: cover;">
		                                        <div class="ms-3 flex-grow-1"> 
		                                            <h6 class="mb-1">${ChiTietHD.sp.tenSP}</h6>
		                                            <p class="mb-1 text-muted">Size: ${ChiTietHD.sp.kichCo[0].tenKichCo}, Màu: ${ChiTietHD.sp.mauSac[0].tenMau}</p>
		                                            <p class="mb-0 text-muted">x${ChiTietHD.soLuongDaMua}</p>
		                                        </div>
		                                        
		                                        <div class="ms-auto">
		                                            <p class="mb-1 text-end product-price" style="font-size: 15px; margin-right: 20px;">
		                                                <span style="display: block; text-align: center;">Đơn giá</span> 
		                                                <strong>${ChiTietHD.donGia} VND</strong>
		                                            </p>
		                                        </div>
		                                        
		                                         <!-- Nút Đánh giá -->
		                                      <c:if test="${donMua.trangThai == 'Đã giao'}">
		                                     	 <c:forEach var="dg" items="${listDanhGia}">
		                                     	 	<c:if test="${dg.sp.maSP == ChiTietHD.sp.maSP}">
										                <c:if test="${dg.chiTietHD.maChiTiet == ChiTietHD.maChiTiet && dg.trangThai == 'Chưa đánh giá'}">
										                    <button class="btn btn-success btn-sm d-flex align-items-center gap-2" 
										                            data-bs-toggle="modal" 
										                            data-bs-target="#ratingModal" 
										                            onclick="Evaluate(${ChiTietHD.sp.maSP}, ${ChiTietHD.maChiTiet})">
										                        <i class="fas fa-star"></i> Đánh giá
										                    </button>
										                </c:if>
	
										                <c:if test="${dg.chiTietHD.maChiTiet == ChiTietHD.maChiTiet && dg.trangThai == 'Đã đánh giá'}">
										                    <button class="btn btn-success btn-sm d-flex align-items-center gap-2" disabled>
										                        <i class="fas fa-check-circle"></i> Đã đánh giá
										                    </button>
										                </c:if>
		                                     	 	</c:if>
		                                     	 </c:forEach>
		                                       
		                                      </c:if>
		                                     <%--     <c:if test="${donMua.trangThai == 'Đã giao'}">
		                                        	<button class="btn btn-success btn-sm d-flex align-items-center gap-2" data-bs-toggle="modal" data-bs-target="#ratingModal" onclick="Evaluate(${ChiTietHD.sp.maSP}, ${ChiTietHD.maChiTiet})">
													    <i class="fas fa-star"></i> Đánh giá
													</button>
		                                        </c:if>   --%>
		                                         <!-- Nút Mua lại -->
		                                         <form action="./ChiTietSPController" method="post">
			                                         <c:if test="${donMua.trangThai == 'Đã giao' || donMua.trangThai == 'Đã hủy'}">
			                                         	  <input type="hidden" name="method" value="get">
						      							  <input type="hidden" name="maSP" value="${ChiTietHD.sp.maSP}">	
			                                         	  <button class="btn btn-custom btn-sm d-flex align-items-center gap-2">
															    <i class="fas fa-shopping-cart"></i> Mua lại
														  </button>
			                                         </c:if>
									          	</form>
		                                    </div>
	                                  
	                                    </c:forEach>
	                                </div>
	                               	
	                            </div>
	                            
	                             <div class="text-end" style="width: 90%; border-top: 1px solid #ccc; padding: 10px; margin: 10px auto;">
	                                 <p class="mb-1 text-end product-price">Tổng tiền: <strong>${donMua.tongTien} VND</strong></p>
	                                 <a href="javascript:void(0);" class="btn btn-warning btn-sm text-end" data-bs-toggle="modal" data-bs-target="#orderDetailModal" onclick="loadOrderDetails(${donMua.maHoaDon})">
	                                     <span class="font-weight-bold">Xem Chi Tiết</span>
	                                 </a>
	                             </div>
	                           <div class="position-absolute bottom-0 start-0 mb-3 ms-3 d-block">
								    <!-- Chỉ hiển thị nút Hủy đơn hàng khi trạng thái là 'Chờ xác nhận' -->
								    <c:if test="${donMua.trangThai == 'Chờ xác nhận'}">
								        <button class="btn btn-danger btn-cancel d-flex align-items-center gap-2" data-bs-toggle="modal" data-bs-target="#confirmCancelModal" onclick="Huy(${donMua.maHoaDon})">
								            <i class="fas fa-times-circle"></i> <!-- Icon Font Awesome -->
								            Hủy đơn hàng
								        </button>
								    </c:if>
								</div>
	                             
	                             <div class="position-absolute bottom-0 start-0 mb-3 ms-3 d-block">
								    <!-- Chỉ hiển thị nút Hủy đơn hàng khi trạng thái là 'Chờ xác nhận' -->
								    <c:if test="${donMua.trangThai == 'Đang giao'}">
								        <button class="btn btn-received btn-sm d-flex align-items-center gap-2" onclick="confirmReceived(${donMua.maHoaDon})">
										    <i class="fas fa-check-circle"></i> Đã nhận được hàng
										</button>
								    </c:if>
								</div>
								
	                        </div>
                    	</c:forEach>	
	            </div>
	        </div>
    </div>
    
   <!-- Modal order Detail -->
	 <div class="modal fade" id="orderDetailModal" tabindex="-1" aria-labelledby="orderDetailModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="orderDetailModalLabel">Chi Tiết Đơn Hàng</h5>
	          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	          
	        </div>
	        <div class="modal-body">
	       
	          <div class="order-details-content">
	           
	          </div>
	        </div>
	      </div>
	    </div>
	  </div> 
	
  	<!-- Modal xác nhận hủy -->
    <div class="modal fade" id="confirmCancelModal" tabindex="-1" aria-labelledby="confirmCancelModalLabel" aria-hidden="true">
        <div class="modal-dialog custom-modal-width">
            <div class="modal-content shadow-lg border-0">
                <div class="modal-header">
                    <h5 class="modal-title" id="confirmCancelModalLabel">Xác nhận hủy đơn hàng</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p class="text-center fw-bold">Bạn có chắc chắn muốn hủy đơn hàng này không?</p>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-secondary btn-lg" data-bs-dismiss="modal">
                        Đóng
                    </button>       
                   		<input type="hidden" name="maHoaDon" id="input-maHoaDon">
                   		 <button type="button" class="btn btn-danger btn-lg" id="data-maHoaDon" onclick="huyDonHang()">
	                        Hủy đơn
	                    </button>
                   
                </div>
            </div>
        </div>
    </div>
    <script>   	
	    function Huy(maHoaDon) {
	    	 const InputMaHoaDon = document.getElementById('input-maHoaDon');
	    	 InputMaHoaDon.value = maHoaDon;
	    }
	      
    	function huyDonHang() {		
    	    fetch('/project_web/HoaDonController', {
    	        method: 'PUT',
    	        headers: {
    	            'Content-Type': 'application/json',
    	        },
    	        body: JSON.stringify({ maHoaDon: document.getElementById('input-maHoaDon').value, trangThai: 'Đã hủy'  }),
    	    })
    	    .then(response => {
    	        if (response.ok) {
    	            // Tải lại trang hoặc chuyển hướng nếu cần
    	            location.reload();
    	        } else {
    	            return response.text().then(text => {
    	                throw new Error(text);
    	            });
    	        }
    	    })
    	    .catch(error => {
    	        console.error("Error:", error);
    	        alert("Có lỗi xảy ra khi xác nhận đơn hàng: " + error.message);
    	    });
    	}
    	function confirmReceived(maHoaDon) {		
    	    fetch('/project_web/HoaDonController', {
    	        method: 'PUT',
    	        headers: {
    	            'Content-Type': 'application/json',
    	        },
    	        body: JSON.stringify({ maHoaDon: maHoaDon, trangThai: 'Đã giao'  }),
    	    })
    	    .then(response => {
    	        if (response.ok) {
    	            // Tải lại trang hoặc chuyển hướng nếu cần
    	            location.reload();
    	        } else {
    	            return response.text().then(text => {
    	                throw new Error(text);
    	            });
    	        }
    	    })
    	    .catch(error => {
    	        console.error("Error:", error);
    	        alert("Có lỗi xảy ra khi xác nhận đơn hàng: " + error.message);
    	    });
    	}
    	
    </script>
    
	<!-- Modal Đánh giá -->
	<div class="modal fade" id="ratingModal" tabindex="-1" aria-labelledby="ratingModalLabel" aria-hidden="true">
        <div class="modal-dialog custom-modal-width">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ratingModalLabel">Đánh Giá Sản Phẩm</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="DonHang" method="Post" id="ratingForm">
                        <!-- Rating Section -->
                        <div class="mb-3 text-center">
                            <label class="form-label">Chọn Số Sao:</label>
                            <div class="rating">
                                <input type="radio" id="star5" name="rating" value="5">
                                <label for="star5">&#9733;</label>
                                <input type="radio" id="star4" name="rating" value="4">
                                <label for="star4">&#9733;</label>
                                <input type="radio" id="star3" name="rating" value="3">
                                <label for="star3">&#9733;</label>
                                <input type="radio" id="star2" name="rating" value="2">
                                <label for="star2">&#9733;</label>
                                <input type="radio" id="star1" name="rating" value="1">
                                <label for="star1">&#9733;</label>
                            </div>
                        </div>
                        <!-- Comment Section -->
                        <div class="mb-3">
                            <label for="comment" class="form-label">Bình Luận:</label>
                            <textarea class="form-control" id="comment" name="comment" rows="3" placeholder="Nhập bình luận của bạn..."></textarea>
                        </div>
                        <!-- Submit Button -->
                        <div class="d-grid">
                        	 <input type="hidden" name="method" value="Put">
                        	<input type="hidden" name="maSP" id="maSPInput">
                        	<input type="hidden" name="maChiTiet" id="maChiTietInput">
                            <button type="submit" class="btn btn-success">Gửi Đánh Giá</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Cảm ơn -->
	<div class="modal fade" id="thankYouModal" tabindex="-1" aria-labelledby="thankYouModalLabel" aria-hidden="true">
	    <div class="modal-dialog custom-modal-width">
	        <div class="modal-content">
	            <div class="modal-header bg-success text-white">
	                <h5 class="modal-title" id="thankYouModalLabel">
	                    <i class="bi bi-star-fill me-2"></i> Đánh Giá Thành Công
	                </h5>
	                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body text-center">
	                <i class="bi bi-emoji-smile-fill text-warning" style="font-size: 3rem;"></i>
	                <p class="mt-3">Cảm ơn bạn đã đánh giá sản phẩm của chúng tôi!</p>
	            </div>
	            <div class="modal-footer justify-content-center">
	                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
	                    <i class="bi bi-x-circle me-1"></i> Đóng
	                </button>
	            </div>
	        </div>
	    </div>
	</div>
	<script>
		function Evaluate(maSP, maChiTiet) {
			const InputMaSP = document.getElementById('maSPInput');
			const InputMaChiTiet = document.getElementById('maChiTietInput');
			InputMaSP.value = maSP;
			InputMaChiTiet.value = maChiTiet;
		}
		// Kiểm tra rỗng
		document.getElementById('ratingForm').addEventListener('submit', function(event) {
	        var rating = document.querySelector('input[name="rating"]:checked');
	        var comment = document.getElementById('comment').value.trim();
	        
	        if (!rating) {
	            alert("Vui lòng chọn số sao để đánh giá.");
	            event.preventDefault(); // Ngừng việc gửi form
	            return false;
	        }
	        
	        if (comment === "") {
	            alert("Vui lòng nhập bình luận.");
	            event.preventDefault(); // Ngừng việc gửi form
	            return false;
	        }
	        
	        return true; // Gửi form nếu đã điền đủ
	    });
		window.onload = function () {
	        const urlParams = new URLSearchParams(window.location.search);
	        if (urlParams.get('ratingSuccess') === 'true') {
	            // Hiển thị modal
	            const modal = new bootstrap.Modal(document.getElementById('thankYouModal'));
	            modal.show();

	            // Reload trang khi modal đóng
	            const closeModalBtn = document.getElementById('closeModalBtn');
	            document.getElementById('thankYouModal').addEventListener('hidden.bs.modal', function () {
	                window.location.href = 'DonHang?trangThai=Đã+giao'; // Xóa tham số ratingSuccess
	            });

	            closeModalBtn.addEventListener('click', function () {
	                modal.hide();
	            });
	        }
	    };
	</script>
    
    <jsp:include page="footer.jsp" />
    <!-- Bootstrap JS, Popper.js, and jQuery -->
   
   	 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
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
        
        function setTrangThai(trangThai) {
	        document.getElementById('trangThai').value = trangThai;
	        document.getElementById('orderForm').submit(); // Submit form khi nhấn vào thẻ a
	    }
        function setRatingTrangThai(trangThai) {
	        document.getElementById('ratingTrangThai').value = trangThai;
	        document.getElementById('ratingForm').submit(); // Submit form khi nhấn vào thẻ a
	    }
    </script>
    
    <script>
        document.querySelectorAll('.toggle-details').forEach((button) => {
            const collapseTargetId = button.getAttribute('data-bs-target'); // Lấy ID của collapse
            const icon = button.querySelector('i'); // Lấy icon trong nút

            // Xử lý ngay khi nhấn nút
            button.addEventListener('click', function () {
                // Đổi icon ngay lập tức, không chờ hiệu ứng collapse
                if (icon.classList.contains('fa-chevron-left')) {
                    icon.classList.remove('fa-chevron-left');
                    icon.classList.add('fa-chevron-down');
                } else {
                    icon.classList.remove('fa-chevron-down');
                    icon.classList.add('fa-chevron-left');
                }
            });
        });

        
    </script>
    <script>
	    function loadOrderDetails(maHoaDon) {
	        // Gửi mã đơn hàng đến Controller
	        fetch(`/project_web/DonHang`, {
	            method: "POST",
	            headers: {
	            	"Content-Type": "application/json",
	                "X-MaHoaDon": maHoaDon,
	            },
	            body: `id=${maHoaDon}`,
	        })
	        .then(response => response.text())
	        .then(data => {
	            // Chèn dữ liệu trả về từ Controller vào Modal
	            document.querySelector('#orderDetailModal .modal-body').innerHTML = data;
	            
	            // Hiển thị Modal
	            const modal = new bootstrap.Modal(document.getElementById('orderDetailModal'));
	            modal.show();
	        })
	        .catch(error => {
	            console.error("Error:", error);
	            alert("Không thể tải chi tiết đơn hàng!");
	        });
	    }
	    
	    const modalElement = document.getElementById('orderDetailModal');

		 // Lắng nghe sự kiện khi modal bị ẩn
		 modalElement.addEventListener('hidden.bs.modal', function () {
		     // Xóa backdrop nếu còn tồn tại
		     const backdrop = document.querySelector('.modal-backdrop');
		     if (backdrop) {
		         backdrop.remove();
		     }
		     // Khôi phục scrollbar
		     document.body.style.overflow = '';
		 });
    </script>


   	<script>
		function setChinhSach(chinhSach) {
			document.getElementById('chinhSach').value = chinhSach;
	        document.getElementById('policiesForm').submit();
		}
	</script>
    
</body>
</html>
