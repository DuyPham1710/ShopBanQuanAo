<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Chủ</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
<link rel="stylesheet" href="../views/css/style.css">

</head>
<body>
	<!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light navbar1">
        <div class="container-fluid">
            <div class="justify-content-between d-flex align-items-center">
                <div class="d-flex align-items-center">
                    <a class="navbar-brand" href="home.jsp">
                        <img src="./images/logo.jpg" alt="Logo">
                    </a>
                     <form action="/project_web/SanPhamController" method="get" class="d-flex">
		                <input class="form-control me-2" type="search" name="searchText" placeholder="Search Products" aria-label="Search">
		                <button class="btn btn-outline-secondary" type="submit">
		                    <i class="fas fa-search"></i>
		                </button>
		            </form>
                </div>
                <div class="navbar-nav">
                    <a class="btn btn-primary font-weight-bold" href="home.jsp">TRANG CHỦ</a>
                    <a class="nav-link font-weight-bold" href="/project_web/SanPhamController">SẢN PHẨM</a>
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
                            <li class="account-info-item"><a href="/project_web/DonHang?trangThai=Chờ+xác+nhận">Đơn mua</a></li>
                            <li class="account-info-item"><a href="/project_web">Đăng xuất</a></li>
                        </ul>
                        
                    </div>
                </div>
            </div>
        </div>
    </nav>

	<div class="marquee-title">
        <h1><span class="hot-icon"></span>Siêu giảm giá 12/12 - Giảm đến 70%! Mua ngay để không bỏ lỡ!</h1>
    </div>

	<!-- Banner Carousel -->
	<div class="container short-container">
        <div class="row">
            <!-- Cột bên trái -->
            <div class="col-md-1 d-flex justify-content-center align-items-center">
                <div class="bg-white text-center p-3">
                    <button class="carousel-control-prev btn-previous" type="button" data-target="#carouselExampleFade" data-slide="prev">
                        <span class="carousel-control-prev-icon tuongPhanMau" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </button>
                </div>
            </div>
            <!-- Cột giữa (carousel) -->
            <div class="col-md-10 img-custom-all">
                <div id="carouselExampleFade" class="carousel slide carousel-fade Carousel-custom" data-ride="carousel" data-interval="4000">
                    <div class="carousel-inner">
                        <div class="carousel-item active img-custom">
                            <img src="https://owen.cdn.vccloud.vn/media/codazon/slideshow/h/e/hero_1366x532_1.5x-100_bf_24.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item img-custom">
                            <img src="https://owen.cdn.vccloud.vn/media/codazon/slideshow/h/e/hero_1366x532_bf24_1.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item img-custom">
                            <img src="https://cdn0918.cdn4s1.com/media/blog-images/anh-thoi-trang-nam-dep/anh-thoi-trang-nam-dep-2.jpg" class="d-block w-100" alt="...">
                        </div>
                    </div>  
                </div>
            </div>
            <!-- Cột bên phải -->
            <div class="col-md-1 d-flex justify-content-center align-items-center">
                <div class="bg-white text-center p-3 ">
                    <button class="carousel-control-next btn-next" type="button" data-target="#carouselExampleFade" data-slide="next">
                        <span class="carousel-control-next-icon tuongPhanMau" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </button>
                </div>
            </div>
        </div>
    </div>


    <!-- Banner -->
    <div class="container1" style="margin-top: 40px">
        <div class="container1">
            <div class="col-md-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="home.jsp"><i class="fas fa-home"></i> Trang chủ</a></li>
                    </ol>
                </nav>
            </div>
            <div class="grid">
                <div class="banner">
                    <h2 class="font-weight-bold">Mang đến cho bạn trải nghiệm tuyệt vời nhất</h2>
                    <p>
                        Rimberio là lựa chọn hàng đầu dành cho các tín đồ thời trang sành điệu. 
                        Sứ mệnh của Rimberio là trao quyền cho thế hệ trẻ toàn thế giới tự do thể hiện 
                        phong cách thông qua thời trang, thương hiệu vượt qua ranh giới của thời trang 
                        thông thường bằng cách không ngừng sáng tạo các trang phục với các bộ sưu tập độc đáo.
                    </p>
                    <a href="/project_web/SanPhamController" class="btn btn-dark font-weight-bold"><i class="fas fa-shopping-cart"></i> MUA NGAY</a>
                    <a href="#contact" class="btn btn-primary font-weight-bold">LIÊN HỆ VỚI CHÚNG TÔI</a>
                </div>
                <div class="banner-image">
                    <img src="./images/home.png" alt="Banner Image" class="img-fluid rounded">
                </div>
            </div>
            
        </div>
    </div>
    
    <div class="container-partner">
		<h3>Đối tác tin cậy</h3>
		<p>  Shop luôn tự hào khi được hợp tác cùng các đối tác uy tín và phục vụ khách hàng đáng tin cậy. Đối tác của shop bao gồm các nhà cung cấp nguyên liệu, xưởng sản xuất, và thương hiệu nổi tiếng, đảm bảo mỗi sản phẩm đều đạt chất lượng cao nhất.</p>
		<div class="partner">
			<div>
				<img src="./images/img1.png" alt="">
			</div>
			<div>
				<img src="./images/img2.png" alt="">
			</div>
			<div>
				<img src="./images/img3.png" alt="">
			</div>
			<div>
				<img src="./images/img4.png" alt="">
			</div>
			<div>
				<img src="./images/img5.png" alt="">
			</div>
			<div>
				<img src="./images/img6.png" alt="">
			</div>
		</div>
		
	</div>
	
	<!-- Phần Liên Hệ -->
    <div class="contact" id="contact">
        <div class="contact-online">
            <h3 class="font-weight-bold">Cần trợ giúp</h3>
            <div  style="margin: 24px 0;">
                <span class="contact-title">Hãy nhập các thông tin dưới đây. Chúng tôi sẽ sớm liên lạc với bạn</span>
            </div>
            <form action="" method="">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" name="name" id="floatingInput" placeholder="Họ và tên">
                    <label for="floatingInput">Họ và tên</label>
                  </div>
                  <div class="form-floating mb-3">
                    <input type="email" class="form-control" name="email" id="floatingInput" placeholder="Email">
                    <label for="floatingInput">Email</label>
                  </div>
                  <div class="form-floating mb-3">
                    <input type="text" class="form-control" name="phoneNumber" id="floatingInput" placeholder="Số điện thoại">
                    <label for="floatingInput">Số điện thoại</label>
                  </div>
                  <div class="form-floating">
                    <textarea class="form-control" name="question" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
                    <label for="floatingTextarea2">Câu hỏi</label>
                  </div>
              
                  <div class="d-grid gap-2">
                    <button class="btn btn-primary send" type="button">Gửi</button>
                  </div>
            </form>
        </div>
        <div class="contact-offline">
            <h3 class="font-weight-bold">Liên hệ trực tiếp</h3>
            <div  style="margin: 24px 0;">
                <span class="contact-title">Bạn có thể đến cửa hàng của chúng tôi tại</span>
            </div>
            <div class="contact-offline-location">
                <ul class="contact-offline-list">
                    <li class="contact-offline-item">
                        <div class="contact-offline-item-icon"><i class="fa-solid fa-location-dot fa-flip"></i></div>
                        <div>
                            <span class="font-weight-bold">Thành phố Hồ Chí Minh</span>
                            <p class="contact-title">268 Lý Thường Kiệt, Phường 14, Quận 10</p>
                        </div>  
                    </li>
                    <li class="contact-offline-item">
                        <div class="contact-offline-item-icon"><i class="fa-solid fa-location-dot fa-flip"></i></div>
                        <div>
                            <span class="font-weight-bold">Hà Nội</span>
                            <p class="contact-title">1 Đại Cồ Việt, Bách Khoa, Hai Bà Trưng</p>
                        </div>
                        
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />
    
    <script>
        document.querySelector('a[href="#contact"]').addEventListener('click', function(e) {
            e.preventDefault();
            const contactSection = document.querySelector('#contact');
    
            const offset = 150;
            const topPosition = contactSection.getBoundingClientRect().top + window.scrollY - offset;

            window.scrollTo({
                top: topPosition,
                behavior: 'smooth'
            });
        });
    </script>
    
    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>