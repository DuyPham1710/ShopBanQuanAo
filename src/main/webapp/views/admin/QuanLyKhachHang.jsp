<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản lý khách hàng</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="./views/admin/css/stylesKhachHang.css">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="./views/admin/js/scriptQLKhachHang.js"></script>
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
              <a class="nav-link" href="TrangChuAD.jsp">Trang chủ</a>
            </li>
            <li class="nav-item">
              <i class="bi bi-bag-check me-2"></i>
              <a class="nav-link" href="#">Order</a>
            </li>
            <li class="nav-item">
              <i class="bi bi-box me-2"></i>
              <a class="nav-link" href="/project_web/qlSanPhamController" id="loadProducts">Products</a>
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
          <div class="col-md-12">
            <div class="card mb-4">
              <div class="card-body">
                <h5 class="card-title">Tổng số khách hàng đã đăng ký tài khoản</h5>
                <h2 class="font-weight-bold">${SoKH}</h2>
                <div class="text-success">
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
              	<form id="yearForm" method="post" _method="thayDoiNam" action="qlKhachHangController?_method=thayDoiNam">
				    <label for="chartYear">Chọn năm:</label>
				    <input type="number" id="chartYear" name="year" class="form-control" style="width: auto;" value="${Nam}" onchange="submitYearForm()">
				</form>
            </div>
        
            <!-- Chia cột cho danh sách và biểu đồ -->
            <div class="row">
              <!-- Cột danh sách khách hàng -->
              <div class="col-md-5 mb-4 mb-md-0">
                <h5>Top 5 khách hàng mua nhiều nhất</h5>
                <ul class="list-group" id="topCustomers">
                	<c:forEach var="nd" items="${ListNDMN}">
	                  <li class="list-group-item d-flex justify-content-between align-items-center">
	                    ${nd.hoTen} <span>${nd.daMua} sản phẩm</span>
	                  </li>
	                </c:forEach>
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
              <div class="d-flex align-items-center ">
              	<input type="number" id="filterYear" class="form-control me-3" style="width: auto; heigh:60%" >
            </div>
            </div>
            <div class="table-responsive" style="max-height: 400px; overflow-y: auto;">
              <table class="table table-striped table-hover" id="customerTable">
                <thead>
                  <tr>
                    <th>STT</th>
                    <th>Tên khách hàng</th>
                    <th>Giới tính</th>
                    <th>Số điện thoại</th>
                    <th>Email</th>
                    <th>Số sản phẩm</th>
                    <th>Số tiền</th>
                    <th>Hành động</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="nd" items="${ListND}" varStatus="status">
            		<tr>
	                    <td>${status.index + 1}</td>
	                    <td>${nd.hoTen }</td>
	                    <td>${nd.gioiTinh }</td>
	                    <td>${nd.sdt }</td>
	                    <td>${nd.email }</td>
	                    <td>${nd.daMua }</td>
	                    <td>${nd.tongTien }</td>
	                    <td>
	                      <button class="btn btn-primary btn-sm " data-bs-toggle="modal" data-bs-target="#thongTinNguoiDung" >Xem</button>
	                    </td>
	                </tr>
                  </c:forEach>
                  
                </tbody>
              </table>
            </div>
          </div>
        </div>
	
	  <div class="modal fade" id="thongTinNguoiDung" tabindex="-1" aria-labelledby="thongTinNguoiDung" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="addProductModalLabel">Thông tin khách hàng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                	<!-- Thông tin khách hàng -->


              </div>
            </div>
          </div>
        </div>
  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  <script >
	  	const labels = ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", 
	        "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"];
	  	 const data = <%= request.getAttribute("ThongKeTungThang") %>;
		drawMonthlySalesChart('customerChart', labels, data);
  	</script>
</body>
</html>

