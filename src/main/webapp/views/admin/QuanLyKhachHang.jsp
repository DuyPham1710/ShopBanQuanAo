<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản lý khách hàng</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="./css/stylesKhachHang.css">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
          <h2>Quản lý Khách hàng</h2>
          
          <div class="d-flex align-items-center">
            <div class="profile">
              <img src="https://cdn-icons-png.flaticon.com/512/1794/1794749.png" alt="Profile Picture" width="40" class="rounded-circle me-2">
              <span>Admin</span>
            </div>
          </div>
        </header>

        <!-- Cards Section -->
        <div class="row">
          <div class="col-md-4">
            <div class="card mb-4">
              <div class="card-body">
                <h5 class="card-title">Tổng số khách hàng</h5>
                <h2 class="font-weight-bold">3,250</h2>
                <div class="text-success">
                  <i class="fas fa-arrow-up"></i> Tăng 5% so với hôm qua
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card mb-4">
              <div class="card-body">
                <h5 class="card-title">Khách hàng mới</h5>
                <h2 class="font-weight-bold">120</h2>
                <div class="text-success">
                  <i class="fas fa-arrow-up"></i> Tăng 10%
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card mb-4">
              <div class="card-body">
                <h5 class="card-title">Khách hàng rời bỏ</h5>
                <h2 class="font-weight-bold">25</h2>
                <div class="text-danger">
                  <i class="fas fa-arrow-down"></i> Giảm 3%
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Input chọn năm -->
        <div class="card mt-4">
          <div class="card-body">
            <h4>Thống kê khách hàng</h4>
            <!-- Input chọn năm -->
            <div class="d-flex align-items-center mb-4">
              <label for="chartYear" class="me-2">Chọn năm:</label>
              <input type="number" id="chartYear" class="form-control" style="width: auto;" value="2024">
            </div>
        
            <!-- Chia cột cho danh sách và biểu đồ -->
            <div class="row">
              <!-- Cột danh sách khách hàng -->
              <div class="col-md-5 mb-4 mb-md-0">
                <h5>Top 5 khách hàng mua nhiều nhất</h5>
                <ul class="list-group" id="topCustomers">
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    Nguyễn Văn A <span>15 sản phẩm</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    Trần Thị B <span>12 sản phẩm</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    Lê Văn C <span>10 sản phẩm</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    Phạm Minh D <span>8 sản phẩm</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    Vũ Thị E <span>7 sản phẩm</span>
                  </li>
                </ul>
              </div>
        
              <!-- Cột biểu đồ -->
              <div class="col-md-7">
                <canvas id="customerChart"></canvas>
              </div>
            </div>
          </div>
        </div>
        


        <!-- Customer Table -->
        <div class="card mt-4">
          <div class="card-body">
            <h4>Danh sách khách hàng</h4>
            <!-- Combobox lọc dữ liệu -->
            <div class="d-flex align-items-center mb-3">
              <label for="filterMonth" class="me-2">Lọc theo tháng:</label>
              <select id="filterMonth" class="form-select me-3" style="width: auto;">
                <option value="">Tất cả</option>
                <option value="1">Tháng 1</option>
                <option value="2">Tháng 2</option>
                <option value="3">Tháng 3</option>
                <option value="4">Tháng 4</option>
                <option value="5">Tháng 5</option>
                <option value="6">Tháng 6</option>
                <option value="7">Tháng 7</option>
                <option value="8">Tháng 8</option>
                <option value="9">Tháng 9</option>
                <option value="10">Tháng 10</option>
                <option value="11">Tháng 11</option>
                <option value="12">Tháng 12</option>
              </select>
              <label for="filterYear" class="me-2">Lọc theo năm:</label>
              <select id="filterYear" class="form-select" style="width: auto;">
                <option value="">Tất cả</option>
                <option value="2023">2023</option>
                <option value="2024">2024</option>
              </select>
            </div>
            <div class="table-responsive" style="max-height: 400px; overflow-y: auto;">
              <table class="table table-striped table-hover" id="customerTable">
                <thead>
                  <tr>
                    <th>STT</th>
                    <th>Tên khách hàng</th>
                    <th>Email</th>
                    <th>Số điện thoại</th>
                    <th>Địa chỉ</th>
                    <th>Số sản phẩm</th>
                    <th>Số tiền</th>
                    <th>Hành động</th>
                  </tr>
                </thead>
                <tbody>
                  <tr data-month="1" data-year="2024">
                    <td>1</td>
                    <td>Nguyễn Văn A</td>
                    <td>nguyenvana@example.com</td>
                    <td>0123456789</td>
                    <td>Hà Nội</td>
                    <td>10</td>
                    <td>1000000</td>
                    <td>
                      <button class="btn btn-primary btn-sm">Xem</button>
                      <button class="btn btn-danger btn-sm">Xóa</button>
                    </td>
                  </tr>
                  <tr data-month="2" data-year="2023">
                    <td>2</td>
                    <td>Trần Thị B</td>
                    <td>tranthib@example.com</td>
                    <td>0987654321</td>
                    <td>TP Hồ Chí Minh</td>
                    <td>5</td>
                    <td>300000</td>
                    <td>
                      <button class="btn btn-primary btn-sm">Xem</button>
                      <button class="btn btn-danger btn-sm">Xóa</button>
                    </td>
                  </tr>
                  <tr data-month="3" data-year="2024">
                    <td>3</td>
                    <td>Lê Văn C</td>
                    <td>levanc@example.com</td>
                    <td>0912345678</td>
                    <td>Đà Nẵng</td>
                    <td>1</td>
                    <td>100000</td>
                    <td>
                      <button class="btn btn-primary btn-sm">Xem</button>
                      <button class="btn btn-danger btn-sm">Xóa</button>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    // Dữ liệu khách hàng theo tháng
    const customerData = [120, 150, 180, 220, 200, 170, 190, 210, 250, 300, 280, 320];

    // Tạo biểu đồ khách hàng
    const ctx = document.getElementById('customerChart').getContext('2d');
    new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
        datasets: [{
          label: 'Số khách hàng',
          data: customerData,
          backgroundColor: '#36A2EB',
          borderColor: '#0066CC',
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        scales: {
          x: {
            title: { display: true, text: 'Tháng' }
          },
          y: {
            beginAtZero: true,
            title: { display: true, text: 'Số lượng khách hàng' }
          }
        }
      }
    });
  </script>
  <script>
    const filterMonth = document.getElementById('filterMonth');
    const filterYear = document.getElementById('filterYear');
    const customerTable = document.getElementById('customerTable').getElementsByTagName('tbody')[0];
  
    function filterCustomers() {
      const month = filterMonth.value;
      const year = filterYear.value;
      const rows = customerTable.getElementsByTagName('tr');
  
      for (let row of rows) {
        const rowMonth = row.getAttribute('data-month');
        const rowYear = row.getAttribute('data-year');
        const matchMonth = !month || rowMonth === month;
        const matchYear = !year || rowYear === year;
  
        row.style.display = matchMonth && matchYear ? '' : 'none';
      }
    }
  
    filterMonth.addEventListener('change', filterCustomers);
    filterYear.addEventListener('change', filterCustomers);
  </script>
</body>
</html>
