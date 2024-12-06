<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout Form</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
   <!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Google Fonts -->

<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./views/css/styleThanhToan.css">
<link rel="stylesheet" href="./views/css/style.css">
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
		                <input class="form-control me-2 mr-2" type="search" name="searchText" placeholder="Search Products" aria-label="Search">
		                <button class="btn btn-outline-secondary" type="submit">
		                    <i class="fas fa-search"></i>
		                </button>
		            </form>
                </div>
                <div class="navbar-nav">
                    <a class="nav-link font-weight-bold" href="/project_web/views/home.jsp">TRANG CHỦ</a>
                    <a class="nav-link font-weight-bold" href="/project_web/SanPhamController">SẢN PHẨM</a>
                    <span class="nav-icon">
						<div class="notifications">
						    <a href="/project_web/GioHangController">
						        <i class="fas fa-shopping-bag"></i>
						    </a>
						    <span class="notification-badge">${soSanPhamGioHang }</span>
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
    <div class="container1 mt">
    	<div class="container1">
	    	<div class="col-md-12">
			    <nav aria-label="breadcrumb">
			        <ol class="breadcrumb">
			            <li class="breadcrumb-item" id="home-item">
				            <a href="/project_web/views/home.jsp">
				            	<i class="fas fa-home"></i>
				            </a>
			            </li>
			            <li class="breadcrumb-item active" id="product-item"> Thanh toán</li>
			        </ol>
			    </nav>
			</div>
	    	<div class="checkout-container">
	        <!-- Shipping Information -->
	        <div class="section shipping-info">
	            <h3>Thông tin nhận hàng</h3>
	            <div class="info-row">
	                <span class="label">Người nhận:</span>
	                <span class="detail">${nguoiDung.hoTen}</span>
	            </div>
	            <div class="info-row">
	                <span class="label">Điện thoại:</span>
	                <span class="detail">${nguoiDung.sdt}</span>
	            </div>
	            <div class="info-row">
	                <span class="label">Email:</span>
	                <span class="detail">${nguoiDung.email}</span>
	            </div>
	            <div class="info-row">
	                <span class="label">Địa chỉ:</span>
	                <div class="address-container">
	                	
	                    <select class="detail" id="addressSelect" onchange="checkOtherOption()">
	                    	<c:forEach var="diaChi" items="${nguoiDung.diaChiNhanHang}">
		                		<option value="${diaChi.tenDiaChi}" ${diaChi.tenDiaChi == nguoiDung.diaChiNhanHang[0].tenDiaChi ? 'selected' : ''}>${diaChi.tenDiaChi}</option>
		                	</c:forEach>
	                    	<!--   <option></option>  -->
	                       <option value="other">Khác (Nhập địa chỉ mới)</option>
	                    </select> 
	                   
        <!-- Button mở Modal -->
      <!--   <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addressModal">
            Chọn địa chỉ mới
        </button> -->
	                    <input type="text" id="otherAddress" placeholder="Nhập địa chỉ mới" style="display:none; margin-top: 10px;"> 
	                </div>
	                
	                
	            </div>
	            
	        </div>
	        
	
	        <!-- Payment Method -->
	        <div class="section payment-method">
	            <h3>Phương thức thanh toán</h3>
	            <button class="payment-option" onclick="selectPaymentOption(this, 'cod')">
	                <div class="icon-container">
	                    <i class="fas fa-money-bill-wave"></i>
	                </div>
	                <div class="text-content">
	                    Thanh toán khi nhận hàng
	                </div>
	                <div class="tick" style="display:none;">
	                    <i class="fas fa-check-circle"></i>
	                </div>
	            </button>
	            <button class="payment-option selected" onclick="selectPaymentOption(this, 'paypal')">
	                <div class="icon-container">
	                    <i class="fab fa-paypal"></i>
	                </div>
	                <div class="text-content">
	                    Thanh toán bằng Paypal
	                </div>
	                <div class="tick" style="display:none;">
	                    <i class="fas fa-check-circle"></i>
	                </div>
	            </button>
	        </div>
	        
	        
	        
		        <!-- Order Details -->
		        <div class="section order-details">
		            <h3>Đơn hàng</h3>
		            <div class="order-header">
		                <span>Sản phẩm</span>
		                <span>Số lượng</span>
		                <span>Giá</span>
		            </div>
		            <c:forEach var="gh" items="${ListGH}">
		            	 <div class="product-item">
			                <img src="${gh.sanPham.hinhAnhSP.duongDanHinh}" alt="${gh.sanPham.tenSP}">
			                <div class="product-info">
			                    <h4>${gh.sanPham.tenSP}</h4>
			                    <p class="brand">Rimberio</p>
			                    <p class="details">Size: ${gh.sanPham.kichCo[0].tenKichCo}, Màu: ${gh.sanPham.mauSac[0].tenMau}</p>
			                </div>
			                <div class="product-quantity">
			                    <p>${gh.soLuongGH}</p>
			                </div>
			                <div class="product-price">
			                    <p class="price">${gh.sanPham.giaHienTai * gh.soLuongGH}đ</p>
			                </div>
			            </div>
		            </c:forEach>
		        </div>
		        	
		        <!-- Order Summary -->
		        <form action="ThanhToanController" method="POST" class="section order-summary">
		            <h3>Thông tin đơn hàng</h3>
		            <div class="order-row">
		                <span class="label">Tạm tính</span>
		                <span >${totalTemp}đ</span>
		            </div>
		            <div class="order-row">
		                <span class="label">Phí vận chuyển</span> 
		                <span >30.000đ</span>
		            </div>
		            <hr>
		            <div class="order-row total-row">
		                <span class="label-total">Tổng tiền</span>
		                <span class="price total">${totalTemp + 30000}đ</span>
		            </div>
		                   
	            	<input type="hidden" name="tongTienHoaDon" value="${totalTemp + 30000}">
	            	<input type="hidden" name="selectedAddress" id="selectedAddress" value="${nguoiDung.diaChiNhanHang[0].tenDiaChi}">
	            	<c:if test="${fn:length(ListGH) == 1}">
	            		<input type="hidden" name=redirect value="1_San_Pham">
	            		<input type="hidden" name="maSP" value="${ListGH[0].sanPham.maSP}">
		                <input type="hidden" name="maKichCo" value="${ListGH[0].sanPham.kichCo[0].maKichCo}">
		                <input type="hidden" name="maMau" value="${ListGH[0].sanPham.mauSac[0].maMau}">
		                <input type="hidden" name="soLuong1SP" value="${ListGH[0].soLuongGH}">
	            	</c:if>
	            	<c:if test="${fn:length(ListGH) > 1}">
 						<input type="hidden" name="redirect" value="Nhieu_Hon_1_San_Pham">	  
					</c:if>
	            
	            <button class="paypal-button" id="payButton">PayPal</button>
	        </form>
	        
	    </div>
	</div>

	
	 <!-- Modal -->
   <!--  <div class="modal fade" id="addressModal" tabindex="-1" aria-labelledby="addressModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addressModalLabel">Chọn Địa Chỉ</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addressForm">
                        <div class="mb-3">
                            <label for="province" class="form-label">Tỉnh/Thành phố</label>
                            <select class="form-select" id="province" required>
                                <option value="">Chọn tỉnh/thành phố</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="district" class="form-label">Quận/Huyện</label>
                            <select class="form-select" id="district" disabled required>
                                <option value="">Chọn quận/huyện</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="ward" class="form-label">Phường/Xã</label>
                            <select class="form-select" id="ward" disabled required>
                                <option value="">Chọn phường/xã</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="button" class="btn btn-primary" id="saveAddress">Lưu Địa Chỉ</button>
                </div>
            </div>
        </div>
    </div> -->

    
	
    <script>
  /*   document.addEventListener("DOMContentLoaded", () => {
    	  const provinceSelect = document.getElementById("province");
    	  const districtSelect = document.getElementById("district");
    	  const wardSelect = document.getElementById("ward");

    	  // Hàm tải dữ liệu tỉnh/thành phố
    	  async function loadProvinces() {
    	      try {
    	          const response = await fetch("https://provinces.open-api.vn/api/p/");
    	          const provinces = await response.json();
    	          provinces.forEach(province => {
    	              const option = document.createElement("option");
    	              option.value = province.code; // Mã tỉnh
    	              option.textContent = province.name; // Tên tỉnh
    	              provinceSelect.appendChild(option);
    	          });
    	      } catch (error) {
    	          console.error("Lỗi khi tải tỉnh/thành phố:", error);
    	      }
    	  }

    	  // Hàm tải dữ liệu huyện/quận theo mã tỉnh
    	  async function loadDistricts(provinceCode) {
    	      try {
    	          const response = await fetch(`https://provinces.open-api.vn/api/p/${provinceCode}?depth=2`);
    	          const provinceData = await response.json();
    	          const districts = provinceData.districts || [];
    	          districtSelect.innerHTML = '<option value="">Chọn quận/huyện</option>';
    	          wardSelect.innerHTML = '<option value="">Chọn phường/xã</option>';
    	          wardSelect.disabled = true;
    	          districts.forEach(district => {
    	              const option = document.createElement("option");
    	              option.value = district.code; // Mã huyện
    	              option.textContent = district.name; // Tên huyện
    	              districtSelect.appendChild(option);
    	          });
    	          districtSelect.disabled = false;
    	      } catch (error) {
    	          console.error("Lỗi khi tải quận/huyện:", error);
    	      }
    	  }

    	  // Hàm tải dữ liệu xã/phường theo mã huyện
    	  async function loadWards(districtCode) {
    	      try {
    	          const response = await fetch(`https://provinces.open-api.vn/api/d/${districtCode}?depth=2`);
    	          const districtData = await response.json();
    	          const wards = districtData.wards || [];
    	          wardSelect.innerHTML = '<option value="">Chọn phường/xã</option>';
    	          wards.forEach(ward => {
    	              const option = document.createElement("option");
    	              option.value = ward.code; // Mã xã
    	              option.textContent = ward.name; // Tên xã
    	              wardSelect.appendChild(option);
    	          });
    	          wardSelect.disabled = false;
    	      } catch (error) {
    	          console.error("Lỗi khi tải phường/xã:", error);
    	      }
    	  }

    	  // Event: Khi chọn tỉnh/thành phố
    	  provinceSelect.addEventListener("change", () => {
    	      const provinceCode = provinceSelect.value;
    	      if (provinceCode) {
    	          loadDistricts(provinceCode);
    	      } else {
    	          districtSelect.innerHTML = '<option value="">Chọn quận/huyện</option>';
    	          wardSelect.innerHTML = '<option value="">Chọn phường/xã</option>';
    	          districtSelect.disabled = true;
    	          wardSelect.disabled = true;
    	      }
    	  });

    	  // Event: Khi chọn quận/huyện
    	  districtSelect.addEventListener("change", () => {
    	      const districtCode = districtSelect.value;
    	      if (districtCode) {
    	          loadWards(districtCode);
    	      } else {
    	          wardSelect.innerHTML = '<option value="">Chọn phường/xã</option>';
    	          wardSelect.disabled = true;
    	      }
    	  });

    	  // Tải danh sách tỉnh/thành phố khi tải trang
    	  loadProvinces();
    	});
 */


	    function checkOtherOption() {
	        const addressSelect = document.getElementById('addressSelect');
	        const otherAddressInput = document.getElementById('otherAddress');
	        const selectedAddressInput = document.getElementById('selectedAddress');
	        
	        if (addressSelect.value === 'other') {
	            otherAddressInput.style.display = 'block'; // Hiện trường nhập
	            otherAddressInput.focus(); // Đặt con trỏ vào trường nhập
	            otherAddressInput.oninput = () => {
	                selectedAddressInput.value = otherAddressInput.value; // Đồng bộ khi nhập
	            };
	        } else {
	            otherAddressInput.style.display = 'none'; // Ẩn trường nhập
	            otherAddressInput.value = ''; // Xóa giá trị
	            selectedAddressInput.value = addressSelect.value; // Lưu địa chỉ đã chọn
	        }
	    }

        function selectPaymentOption(button, method) {
            // Xóa lớp 'selected' và ẩn tick của tất cả các nút
            document.querySelectorAll('.payment-option').forEach(option => {
                option.classList.remove('selected');
                option.querySelector('.tick').style.display = 'none';
            });

            // Thêm lớp 'selected' và hiển thị tick cho nút đã chọn
            button.classList.add('selected');
            button.querySelector('.tick').style.display = 'block';

            // Lấy nút thanh toán và thay đổi nội dung theo phương thức
            const payButton = document.getElementById('payButton');
            if (method === 'cod') {
                payButton.textContent = 'Đặt hàng';
            } else if (method === 'paypal') {
                payButton.textContent = 'PayPal';
            }
        }


        </script>
    </div>
	 <jsp:include page="footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>