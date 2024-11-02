<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bảng Điều Khiển Quản Trị</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
    <link rel="stylesheet" href="./css/style.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif; 
            background-color: #f8f9fa; 
        }
        .navbar {
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .sidebar {
            background-color: #343a40; 
            color: #fff; 
            height: 100vh; 
            padding: 20px; 
        }
        .sidebar a {
            color: #fff; 
        }
        .sidebar a:hover {
            background-color: #495057; 
            color: #fff; 
        }
        .main-content {
            margin-left: 250px; 
            padding: 20px; 
        }
        .card {
            border-radius: 10px; 
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); 
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="./images/logo.jpg" alt="Logo" height="40">
            </a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="home.jsp">TRANG CHỦ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout.jsp">ĐĂNG XUẤT</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Sidebar -->
    <div class="sidebar position-fixed">
        <h4>Quản Trị</h4>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="manageProducts.jsp">Quản Lý Sản Phẩm</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="manageUsers.jsp">Quản Lý Người Dùng</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="viewOrders.jsp">Xem Đơn Hàng</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="viewReports.jsp">Xem Báo Cáo</a>
            </li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container mt-4">
            <h2>Chào Mừng Đến Bảng Điều Khiển Quản Trị</h2>
            <p>Tại đây bạn có thể quản lý các sản phẩm, người dùng, đơn hàng và xem báo cáo.</p>

            <!-- Card Statistics -->
            <div class="row">
                <div class="col-md-4">
                    <div class="card p-3">
                        <h5 class="card-title">Tổng Sản Phẩm</h5>
                        <p class="card-text">120 sản phẩm đang được quản lý.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card p-3">
                        <h5 class="card-title">Tổng Người Dùng</h5>
                        <p class="card-text">350 người dùng đã đăng ký.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card p-3">
                        <h5 class="card-title">Đơn Hàng Mới</h5>
                        <p class="card-text">15 đơn hàng mới trong hôm nay.</p>
                    </div>
                </div>
            </div>

            <!-- Recent Activity -->
            <div class="mt-4">
                <h4>Hoạt Động Gần Đây</h4>
                <ul class="list-group">
                    <li class="list-group-item">Người dùng đã thêm một sản phẩm mới.</li>
                    <li class="list-group-item">Người dùng đã cập nhật thông tin tài khoản.</li>
                    <li class="list-group-item">Có 5 đơn hàng mới được đặt.</li>
                </ul>
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
