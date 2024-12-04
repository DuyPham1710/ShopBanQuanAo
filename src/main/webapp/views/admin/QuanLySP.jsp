<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản lý sản phẩm</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- FontAwesome -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <link rel="stylesheet" href="./views/admin/css/stylesQuanLySP.css">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="./views/admin/js/scriptQLSanPham.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
</head>
<body>
  <div class="container-fluid">
    <div class="row">
    
      <!-- Sidebar -->
     <nav class="col-md-2 d-none d-md-block bg-light sidebar">
        <div class="position-sticky">
          <div class="logo text-center">
            <img src="./views/images/logo.jpg" class="rounded" alt="Logo" id="logo">
          </div>
          <ul class="nav flex-column">
            <li class="nav-item">
              <i class="bi bi-house me-2"></i>
              <a class="nav-link" href="/project_web/TrangChuADController">Trang chủ</a>
            </li>
            <li class="nav-item">
              <!-- Icon giỏ hàng -->
              <i class="bi bi-bag-check me-2"></i>
              <a class="nav-link" href="/project_web/HoaDonController">Order</a>
            </li>
          
            <li class="nav-item">
              <i class="bi bi-box me-2"></i>
              <a class="nav-link" href="/project_web/qlSanPhamController" id="loadProducts">Products</a>
            </li>
            <li class="nav-item">
              <i class="bi bi-people me-2"></i>
              <a class="nav-link" href="/project_web/qlKhachHangController">Customers</a>
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
      <main class="content col-md-10 ms-sm-auto px-md-3">
        <header class="d-flex justify-content-between align-items-center py-3">
          <h2>Quản lý Sản phẩm</h2>
          <div class="d-flex align-items-center">
            <button class="btn btn-primary me-3" data-bs-toggle="modal" data-bs-target="#addProductModal" onclick="loadThongTinAddSP()">Thêm sản phẩm</button>
            
            <div class="profile">
              <img src="https://cdn-icons-png.flaticon.com/512/1794/1794749.png" alt="Profile Picture" width="40" class="rounded-circle me-2">
              <span>Admin</span>
            </div>
          </div>
        </header>

        <!-- Cards Section -->
        <div class="row mb-3">
          <div class="col-md-6" >
            <div class="row mb-2">
              <div class="row mb-2">
                <div class="card card-body" style="margin-left: 10px;">
                  <h5 class="card-title">Tổng số sản phẩm hiện có</h5>
                  <h2 id="tonKho" class="font-weight-bold">${TonKho}</h2>
                  <div class="text-success">
                    <i class="fas fa-arrow-up"></i> Tổng số sản phẩm còn trong kho
                  </div>
                </div>
              </div>
              <div class="row mb-2">
                <div class="card card-body" style="margin-left: 10px;">
                  <h5 class="card-title">Tổng sản phẩm bán được</h5>
                  <h2 id="daBan" class="font-weight-bold">${DaBan}</h2> 
                  <div class="text-success">
                    <i class="fas fa-arrow-up"></i> Các sản phẩm đã bán và giao thành công đến khách hàng
                  </div>
                </div>
                
              </div>
            </div>
          </div>
          
          <div class="col-md-6">
            <div class="card mb-3" style = "height: 280px;">
                <div class="card-body">
                  <div class="row">
                    <div class="col-md-5">
                      <h1 class="chart-title">Thống kê sản phẩm</h1>
                    </div>
                    <div class="col-md-7">
                      <canvas id="visitorChart" style="max-width: 160%; height: 160%;"></canvas>
                    </div>
                  </div>
                </div>
            </div>
          </div>
          
        
        </div>

        <!-- Input chọn năm -->
        <div class="card mt-4">
          <div class="card-body">
            <h4>Số liệu thống kê sản phẩm bán được trong năm</h4>
            <!-- Input chọn năm -->
            <div class="d-flex align-items-center mb-4">
	              <form id="yearForm" method="post" _method="thayDoiNam" action="qlSanPhamController?_method=thayDoiNam">
				    <label for="chartYear">Chọn năm:</label>
				    <input type="number" id="chartYear" name="year" class="form-control" style="width: auto;" value="${Nam}" onchange="submitYearForm()">
				</form>
            </div>
            <div class="row">
              <!-- Cột danh sách sản phẩm bán chạy -->
              <div class="col-md-5 mb-4">
                <h5>Top 5 sản phẩm bán chạy</h5>
                <ul class="list-group" id="topProducts">
                	<c:forEach var="sp" items="${ListBanChay}" >
	                  <li class="list-group-item d-flex justify-content-between align-items-center">
	                    ${sp.tenSP} <span>${sp.daBan} sản phẩm</span>
	                  </li>
                  </c:forEach>
                </ul>
              </div>

              <!-- Cột biểu đồ -->
              <div class="col-md-7">
                <canvas id="monthlySalesChart"></canvas>
              </div>
            </div>
          </div>
        </div>

        <!-- Product Table -->
        <div class="card mt-4">
          <div class="card-body">
            <h4>Danh sách sản phẩm</h4>
            <div class="table-responsive" style="max-height: 1000px; overflow-y: auto;">
              <table class="table table-striped table-hover">
                <thead>
                  <tr>
                    <th>STT</th>
                    <th>Ảnh</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Đã bán</th>
                    <th>Hành động</th>
                  </tr>
                </thead>
                <tbody>
                  
               		<c:forEach var="sp" items="${ListSP}" varStatus="status">
               			<tr>
		                    <td>${status.index + 1}</td>
		                    <td><img src="${sp.hinhAnhSP.duongDanHinh}" alt="${sp.tenSP}" width="50"></td>
		                    <td>${sp.tenSP}</td>
		                    <td>${sp.giaHienTai} VNĐ</td>
		                    <td>${sp.soLuong}</td>
		                    <td>${sp.daBan}</td>
		                    <td>
		                      <button class="btn btn-primary btn-sm " data-bs-toggle="modal" data-bs-target="#editProductModal" onclick="loadSanPham(${sp.maSP})">Sửa</button>
		                      <button class="btn btn-danger btn-sm">Xóa</button>
		                    </td>
				        </tr>
                    </c:forEach>
                  
                </tbody>
              </table>
            </div>
          </div>
          
        </div>
        </main>
        </div>
	</div>
       <!-- Modal thêm sản phẩm -->
        <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="addProductModalLabel">Thêm sản phẩm</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
	              <div class="modal-body">
					
	              </div>
            </div>
          </div>
        </div>

        <!--Modal sửa-->
        <div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
              	
                <h5 class="modal-title" id="addProductModalLabel">Sửa sản phẩm</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              
	              <div class="modal-body">
	              </div>
	              
            </div>
          </div>
        </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  
  <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  	<script >
	  	const labels = ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", 
	        "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"];
	  	 const data = <%= request.getAttribute("ThongKeTungThang") %>;
		drawMonthlySalesChart('monthlySalesChart', labels, data);
  	</script>
  	
</body>
</html>
