<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chính sách bảo mật</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="./views/css/style.css">
    <link rel="stylesheet" href="./views/css/styleTaiKhoan.css">
    <link rel="stylesheet" href="./views/css/styleChinhSach.css">
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
			            <li class="breadcrumb-item active" id="product-item"> Tài khoản</li>
			        </ol>
			    </nav>
			</div>
	        <div class="row">
	            <!-- Sidebar -->
	            <div class="col-md-3 sidebar bg-light py-3">
	                <div class="list-group">
	                    <a href="/project_web/TaiKhoanController" class="list-group-item active">
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
	            <div class="col-md-9 bg-white px-5">
				        <div class="container my-5">
					        <h1 class="text-center mb-4 text-primary">Chính Sách Bảo Mật</h1>
					
					        <h2 class="title">CHÚNG TÔI THU NHẬP NHỮNG THÔNG TIN NÀO?</h2>
					        <p>
					            Chúng tôi thu thập thông tin từ bạn khi bạn đăng ký trên trang web của chúng tôi, đặt hàng, đăng ký nhận bản tin của chúng tôi hoặc điền vào một biểu mẫu.
					        </p>
					        <p>
					            Khi đặt hàng hoặc đăng ký trên trang web của chúng tôi, bạn có thể được yêu cầu nhập của bạn: tên, địa chỉ email hoặc địa chỉ gửi thư. Bạn có thể truy cập trang web của chúng tôi nặc danh.
					        </p>
					
					        <h2 class="title">CHÚNG TÔI SỬ DỤNG THÔNG TIN CỦA BẠN CHO NHỮNG MỤC ĐÍCH GÌ?</h2>
					        <ul>
					            <li>Để cá nhân hóa trải nghiệm của bạn.</li>
					            <li>Để cải thiện trang web của chúng tôi.</li>
					            <li>Để cải thiện dịch vụ khách hàng.</li>
					            <li>Để xử lý các giao dịch.</li>
					            <li>
					                Thông tin của bạn, dù công khai hay ẩn danh, sẽ không được bán, trao đổi, chuyển nhượng hoặc cho bất kỳ công ty nào khác mà không có sự đồng ý của bạn.
					            </li>
					            <li>Để quản lý một cuộc thi, khuyến mãi, khảo sát, tính năng trang web khác.</li>
					            <li>Để gửi email định kỳ.</li>
					        </ul>
					
					        <h2 class="title">CHÚNG TÔI BẢO VỆ THÔNG TIN CỦA BẠN NHƯ THẾ NÀO?</h2>
					        <p>
					            Chúng tôi thực hiện một loạt các biện pháp an ninh để duy trì sự an toàn của thông tin cá nhân của bạn khi bạn đặt hàng hoặc nhập, gửi, hoặc truy cập thông tin cá nhân của bạn.
					        </p>
					        <p>
					            Chúng tôi cung cấp việc sử dụng một máy chủ an toàn. Tất cả các thông tin nhạy cảm cung cấp được truyền qua Bảo mật (SSL) công nghệ Socket và sau đó mã hóa.
					        </p>
					
					        <h2 class="title">CHÚNG TÔI SỬ DỤNG COOKIES?</h2>
					        <p>
					            Có. Chúng tôi sử dụng cookies để giúp chúng tôi nhớ và xử lý các mặt hàng trong giỏ hàng của bạn, hiểu và lưu các sở thích của bạn cho lần truy cập sau và theo dõi các quảng cáo.
					        </p>
					
					        <h2 class="title">DO CHÚNG TÔI TIẾT LỘ BẤT CỨ THÔNG TIN CHO BÊN NGOÀI?</h2>
					        <p>
					            Chúng tôi không bán, thương mại, hoặc chuyển giao cho bên ngoài những thông tin cá nhân của bạn, ngoại trừ các bên đáng tin hỗ trợ hoạt động của chúng tôi.
					        </p>
					
					        <h2 class="title">LIÊN KẾT CỦA BÊN THỨ BA</h2>
					        <p>
					            Chúng tôi có thể cung cấp sản phẩm của bên thứ ba trên trang web của chúng tôi. Tuy nhiên, chúng tôi không chịu trách nhiệm đối với nội dung và hoạt động của các trang web này.
					        </p>
					
					        <h2 class="title">CHÍNH SÁCH CHỈ ÁP DỤNG WEBSITE TRỰC TUYẾN</h2>
					        <p>
					            Chính sách này chỉ áp dụng cho thông tin thu thập trực tuyến, không áp dụng cho thông tin thu thập ngoại tuyến.
					        </p>
					
					        <h2 class="title">SỰ ĐỒNG Ý CỦA BẠN</h2>
					        <p>
					            Bằng cách sử dụng trang web của chúng tôi, bạn đồng ý với chính sách bảo mật của chúng tôi.
					        </p>
					
					        <h2 class="title">THAY ĐỔI CHÍNH SÁCH MẬT CỦA CHÚNG TÔI</h2>
					        <p>
					            Nếu chúng tôi quyết định thay đổi chính sách bảo mật, chúng tôi sẽ đăng những thay đổi trên trang này.
					        </p>
					    </div>
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="../footer.jsp" />
    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.bundle.min.js"></script>
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
    </script>
    <script>
	    // Hàm để cập nhật giá trị của input hidden và submit form
	    function setTrangThai(trangThai) {
	        document.getElementById('trangThai').value = trangThai;
	        document.getElementById('orderForm').submit(); // Submit form khi nhấn vào thẻ a
	    }
	</script>
	<script>
		function setChinhSach(chinhSach) {
			document.getElementById('chinhSach').value = chinhSach;
	        document.getElementById('policiesForm').submit();
		}
	</script>
</body>
</html>
