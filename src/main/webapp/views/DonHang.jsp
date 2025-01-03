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
	                                      <%--   <p class="mb-1">Trạng thái: <span class="badge bg-warning text-dark"><i class="fas fa-clock me-2"></i>${donMua.trangThai}</span></p> --%>
	                                        <p class="mb-1">Trạng thái: 
											    <span class="badge 
											        <c:choose>
											            <c:when test="${donMua.trangThai == 'Chờ xác nhận'}">bg-warning text-dark</c:when>
											            <c:when test="${donMua.trangThai == 'Đang giao'}">bg-info text-dark</c:when>
											            <c:when test="${donMua.trangThai == 'Đã giao'}">bg-success text-white</c:when>
											            <c:otherwise>bg-secondary text-light</c:otherwise>
											        </c:choose>">
											        <i class="fas 
											            <c:choose>
											                <c:when test="${donMua.trangThai == 'Chờ xác nhận'}">fa-clock</c:when>
											                <c:when test="${donMua.trangThai == 'Đang giao'}">fa-truck</c:when>
											                <c:when test="${donMua.trangThai == 'Đã giao'}">fa-check</c:when>
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
		                                    </div>
	                                  
	                                    </c:forEach>
	                                </div>
	                               	
	                            </div>
	                            
	                             <div class="text-end" style="width: 90%; border-top: 1px solid #ccc; padding: 10px; margin: 10px auto;">
	                                 <p class="mb-1 text-end product-price">Tổng tiền: <strong>${donMua.tongTien} VND</strong></p>
	                                 <a href="javascript:void(0);" class="btn btn-warning btn-sm text-end" data-bs-toggle="modal" data-bs-target="#orderDetailModal" onclick="loadOrderDetails('orderDetails${donMua.maHoaDon}')">
	                                     <span class="font-weight-bold">Xem Chi Tiết</span>
	                                 </a>
	                             </div>
	                        </div>
                    	</c:forEach>	
	            </div>
	        </div>
    </div>
    
   <!-- Modal -->
	<div class="modal fade" id="orderDetailModal" tabindex="-1" aria-labelledby="orderDetailModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="orderDetailModalLabel">Chi Tiết Đơn Hàng</h5>
	          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	        </div>
	        <div class="modal-body">
	          <!-- Nội dung chi tiết đơn hàng sẽ được chèn vào đây bằng JavaScript -->
	          <div class="order-details-content">
	            <!-- Nội dung sẽ được thêm vào từ JavaScript -->
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
  
    
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
        document.querySelectorAll('.btn-warning').forEach(button => {
            button.addEventListener('click', function() {
                // Lấy thông tin đơn hàng
                const orderId = this.closest('.order-card').querySelector('h5').textContent.trim().replace('Đơn Hàng #', '');
                const orderDate = this.closest('.order-card').querySelector('small.text-muted').textContent.trim();
                const totalAmount = this.closest('.order-card').querySelector('.ms-auto p strong').textContent.trim();

                fetch('views/ChiTietDonHang.jsp')
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Không thể tải nội dung chi tiết đơn hàng.');
                        }
                        return response.text(); // Trả về nội dung HTML dưới dạng text
                    })
                    .then(html => {
                        // Chèn nội dung HTML vào modal
                        document.querySelector('#orderDetailModal .modal-body').innerHTML = html;

                        // Thay thế các giá trị động (nếu cần)
                        document.querySelector('.order_detail_container .order_detail_header p span').textContent = orderId;

                        // Hiển thị modal
                        const orderDetailModal = new bootstrap.Modal(document.getElementById('orderDetailModal'));
                        orderDetailModal.show();
                    })
                    .catch(error => {
                        console.error('Lỗi:', error);
                        alert('Đã xảy ra lỗi khi tải chi tiết đơn hàng.');
                    });
            });
        });

    </script> 
	<!-- <script>
		function loadOrderDetails(maHoaDon) {
		    $.ajax({
		        type: "POST",
		        url: "/project_web/DonHang", // Đường dẫn của Servlet
		        data: { id: maHoaDon },
		        success: function(response) {
		            console.log(response); // Log the response to verify
		            $('#orderDetailModal .modal-body .order-details-content').html(response);
		            $('#orderDetailModal').modal('show');
		        },
		        error: function(xhr, status, error) {
		            console.error("Error: " + error);
		            alert('Đã xảy ra lỗi khi tải chi tiết đơn hàng.');
		        }
		    });
		}

		    // Gửi mã đơn hàng dưới dạng JSON
		   /*  $.ajax({
		        url: '/project_web/DonHang',  // URL servlet để xử lý
		        type: 'POST',
		        contentType: 'application/json',
		        data: JSON.stringify({ id: maHoaDon }), // Gửi data dưới dạng JSON
		        success: function(response) {
		            // Chèn nội dung chi tiết đơn hàng vào modal
		            $('#orderDetailModal .modal-body .order-details-content').html(response);
		            
		            // Hiển thị modal
		            $('#orderDetailModal').modal('show');
		        },
		        error: function(xhr, status, error) {
		            console.error('Lỗi:', error);
		            alert('Đã xảy ra lỗi khi tải chi tiết đơn hàng.');
		        }
		    }); */
		}

	</script> -->
	 
</body>
</html>
