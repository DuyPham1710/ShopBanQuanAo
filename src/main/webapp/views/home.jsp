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
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
<link rel="stylesheet" href="./css/style.css">

</head>
<body>
	<!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <div class="justify-content-between d-flex align-items-center">
                <div class="d-flex align-items-center">
                    <a class="navbar-brand" href="#">
                        <img src="./images/logo.jpg" alt="Logo">
                    </a>
                     <form class="d-flex">
		                <input class="form-control me-2" type="search" placeholder="Search Products" aria-label="Search">
		                <button class="btn btn-outline-secondary" type="submit">
		                    <i class="fas fa-search"></i>
		                </button>
		            </form>
                </div>
                <div class="navbar-nav">
                    <a class="btn btn-primary" href="home.jsp">TRANG CHỦ</a>
                    <a class="nav-link" href="/project_web/SanPhamController">SẢN PHẨM</a>
                    <span class="nav-icon"><a href="/project_web/views/GioHang.jsp"><i class="fas fa-shopping-bag"></i></a></span>
                    <span class="nav-icon"><a href="#"><i class="fas fa-user"></i></a></span>
                </div>
            </div>
        </div>
    </nav>

    <!-- Banner -->
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#"><i class="fas fa-home"></i> Trang chủ</a></li>
                    </ol>
                </nav>
            </div>
            <div class="grid">
                <div class="banner">
                    <h2 class="font-weight-bold">Mang đến cho bạn trải nghiệm tuyệt vời nhất</h2>
                    <p>
                        Davies là lựa chọn hàng đầu dành cho các tín đồ thời trang sành điệu. 
                        Sứ mệnh của Davies là trao quyền cho thế hệ trẻ toàn thế giới tự do thể hiện 
                        phong cách thông qua thời trang, thương hiệu vượt qua ranh giới của thời trang 
                        thông thường bằng cách không ngừng sáng tạo các trang phục với các bộ sưu tập độc đáo.
                    </p>
                    <a href="/project_web/SanPhamController" class="btn btn-dark"><i class="fas fa-shopping-cart"></i> MUA NGAY</a>
                    <a href="#" class="btn btn-primary">LIÊN HỆ VỚI CHÚNG TÔI</a>
                </div>
                <div class="banner-image">
                    <img src="https://daviesfashion.netlify.app/static/media/introduction.d3445e0c714cc8e20077.png" alt="Banner Image" class="img-fluid rounded">
                </div>
            </div>
            
        </div>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>