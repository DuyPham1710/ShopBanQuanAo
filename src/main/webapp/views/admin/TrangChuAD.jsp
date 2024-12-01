<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="./css/stylesTrangChu.css">
</head>
<body>
  <div class="container-fluid">
    <div class="row">
      <!-- Sidebar -->
      <nav class="col-md-2 d-none d-md-block bg-light sidebar">
        <div class="position-sticky">
          <div class="logo text-center">
            <img src="../images/logo.jpg" class="rounded" alt="Logo" id="logo">
          </div>
          <ul class="nav flex-column">
            <li class="nav-item">
              <i class="bi bi-house me-2"></i>
              <a class="nav-link" href="TrangChuAD.jsp">Trang chủ</a>
            </li>
            <li class="nav-item">
              <!-- Icon giỏ hàng -->
              <i class="bi bi-bag-check me-2"></i>
              <a class="nav-link" href="HoaDonController">Order</a>
            </li>
          
            <li class="nav-item">
              <i class="bi bi-box me-2"></i>
              <a class="nav-link" href="QuanLySP.jsp" id="loadProducts">Products</a>
            </li>
            <li class="nav-item">
              <i class="bi bi-people me-2"></i>
              <a class="nav-link" href="QuanLyKhachHang.jsp">Customers</a>
            </li>
            <li class="nav-item">
              <i class="bi bi-chat-left-text me-2"></i>
              <a class="nav-link" href="#">Messages</a>
            </li>
            <li class="nav-item">
              <i class="bi bi-box-arrow-right me-2"></i>
              <a class="nav-link" href="#">Sign Out</a>
            </li>
          </ul>
        </div>
      </nav>

      <!-- Main Content -->
      <main class="content col-md-10 ms-sm-auto px-md-4">
          <header class="d-flex justify-content-between align-items-center py-3">
            <h2>Welcome Admin</h2>
            <div class="input-group w-25">
              <input type="text" class="form-control" placeholder="Search here...">
            </div>
            <div class="d-flex align-items-center">
              <div class="notifications">
                <i class="fas fa-bell"></i>
                <span class="notification-badge">6</span>
              </div>
              <div class="profile">
                <img src="https://cdn-icons-png.flaticon.com/512/1794/1794749.png" alt="Profile Picture">
                <span>Moni Roy</span>
              </div>
            </div>
          </header>

        <!-- Cards Section -->
        <div class="main-container" id="mainContainer">
          <div class="row">
            <!-- Cột bên trái - Chiếm 70% -->
            <div class="col-md-9">
                <div class="row">
                    <!-- Số lượng khách hàng -->
                    <div class="col-md-4">
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="card-title">Tổng khách hàng</h5>
                                <h2 class="font-weight-bold">40,689</h2>
                                <div class="d-flex align-items-center text-success">
                                    <i class="fas fa-arrow-up"></i>
                                    <span>8.5% Up from yesterday</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Tổng sản phẩm -->
                    <div class="col-md-4">
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="card-title">Tổng sản phẩm</h5>
                                <h2 class="font-weight-bold">40,689</h2>
                            </div>
                        </div>
                    </div>
        
                    <!-- Tổng doanh thu -->
                    <div class="col-md-4">
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="card-title">Tổng doanh thu</h5>
                                <h2 class="font-weight-bold">40,689$</h2>
                                <div class="d-flex align-items-center text-success">
                                    <i class="fas fa-arrow-up"></i>
                                    <span>8.5% Up from yesterday</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Bảng bo tròn góc nằm dưới -->
                <div class="card mt-4">
                    <div class="card-body">
                      <h1>Top Deals</h1>
                        <div class="table-responsive" style="max-height: 200px; overflow-y: auto;">
                            
                            <table class="table table-bordered rounded-table table-striped">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Tên khách hàng</th>
                                        <th>Sản phẩm</th>
                                        <th>Doanh thu</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Nguyễn Văn A</td>
                                        <td>Sản phẩm 1</td>
                                        <td>1,000$</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Trần Thị B</td>
                                        <td>Sản phẩm 2</td>
                                        <td>1,500$</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>Lê Văn C</td>
                                        <td>Sản phẩm 3</td>
                                        <td>2,000$</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>Phạm Thị D</td>
                                        <td>Sản phẩm 4</td>
                                        <td>1,200$</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        
            <!-- Cột bên phải - Chiếm 30% -->
            <div class="col-md-3">
                <div class="card mb-4 h-100">
                    <div class="card-body">
                        <h1 class="chart-title">Thống kê đơn hàng</h1>
                        <canvas id="visitorChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
        

        
        
        
        </div>
      </main>
    </div>
  </div>

  <!-- Bootstrap JS and dependencies -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script>
    // Số lượng đơn hàng chưa giao và tổng số đơn hàng
    const undeliveredOrders = 120; // Ví dụ: 120 đơn hàng chưa giao
    const totalOrders = 300;       // Ví dụ: Tổng cộng 300 đơn hàng

    // Tính số lượng đơn hàng đã giao
    const deliveredOrders = totalOrders - undeliveredOrders;

    // Tạo biểu đồ hình tròn
    const ctx = document.getElementById('visitorChart').getContext('2d');
    const visitorChart = new Chart(ctx, {
        type: 'doughnut', // Biểu đồ hình tròn (doughnut hoặc pie)
        data: {
            labels: ['Chưa giao', 'Đã giao'],
            datasets: [{
                data: [undeliveredOrders, deliveredOrders],
                backgroundColor: ['#FF6384', '#36A2EB'], // Màu sắc cho từng phần
                hoverBackgroundColor: ['#FF6384', '#36A2EB']
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                tooltip: {
                    callbacks: {
                        label: function (tooltipItem) {
                            return tooltipItem.label + ': ' + tooltipItem.raw + ' đơn hàng';
                        }
                    }
                }
            }
        }
    });
</script>



</body>
</html>