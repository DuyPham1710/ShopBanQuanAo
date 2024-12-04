<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản lý Đơn hàng</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="./css/stylesDonHang.css">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
  <div class="container-fluid">
    <div class="row">
      <!-- Sidebar -->
      <nav class="col-md-2 d-none d-md-block bg-light sidebar">
        <div class="position-sticky">
          <div class="logo text-center" style="margin-top:20px;">
            <img src="../images/logo.jpg" class="rounded-5"  alt="Logo" id="logo">
          </div>
          <ul class="nav flex-column">
            <li class="nav-item">
              <i class="bi bi-house me-2"></i>
              <a class="nav-link" href="TrangChuAD.jsp">Trang chủ</a>
            </li>
            <li class="nav-item" style="Background:#f0d4a0;border-radius: 8px;">
              <i class="bi bi-bag-check me-2"></i>
              <a class="nav-link" href="HoaDonController" >Đơn Hàng</a>
            </li>
            <li class="nav-item">
              <i class="bi bi-box me-2"></i>
              <a class="nav-link" href="/project_web/qlSanPhamController" id="loadProducts">Sản phẩm</a>
            </li>
            <li class="nav-item">
              <i class="bi bi-people me-2"></i>
              <a class="nav-link" href="/project_web/qlKhachHangController">Khách hàng</a>
            </li>
            <li class="nav-item">
              <i class="bi bi-box-arrow-right me-2"></i>
              <a class="nav-link" href="/project_web">Đăng xuất</a>
            </li>
          </ul>
        </div>
      </nav>

      <!-- Main Content -->
      <main class="content col-md-10 ms-sm-auto px-md-4">
        <header class="d-flex justify-content-between align-items-center py-3">
          <h2>Quản lý Đơn hàng</h2>
        </header>
        <!-- Cards Section -->
        <div class="row">
          <div class="col-md-4">
            <div class="card mb-4">
              <div class="card-body">
                <h5 class="card-title">Tổng số đơn hàng</h5>
                <h2 class="font-weight-bold">1,250</h2>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card mb-4">
              <div class="card-body">
                <h5 class="card-title">Đơn hàng mới</h5>
                <h2 class="font-weight-bold">320</h2>
              </div>
            </div>
          </div>
        </div>


        <!-- Order Table -->
        <div class="card mt-4">
          <div class="card-body">
            <h4>Danh sách đơn hàng</h4>
            <div class="table-responsive">
              <table class="table table-striped table-hover">
                <thead>
                  <tr>
                    <th>Mã đơn hàng</th>
                    <th>Mã khách hàng</th>
                    <th>Ngày tạo</th>
                    <th>Tổng tiền</th>
                    <th>Địa chỉ</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="hoaDon" items="${ListHD}">
                        <tr>
                            <td>${hoaDon.maHD}</td>
                            <td>${hoaDon.idNguoiDung}</td>
                            <td>${hoaDon.ngayTao}</td>
                            <td>${hoaDon.tongTien}</td>
                            <td>${hoaDon.diachi}</td>
                            <td>
							  <span 
							    class="badge 
							      <c:choose>
							        <c:when test="${hoaDon.trangThai == 'Đang giao'}">bg-success</c:when>
							        <c:when test="${hoaDon.trangThai == 'Chờ xác nhận'}">bg-warning text-dark</c:when>
							        <c:when test="${hoaDon.trangThai == 'Đã hủy'}">bg-danger</c:when>
							        <c:when test="${hoaDon.trangThai == 'Đã giao'}">bg-primary</c:when>
							      </c:choose>">
							      <i class="fas 
							        <c:choose>
							          <c:when test="${hoaDon.trangThai == 'Chờ xác nhận'}">fa-clock</c:when>
							          <c:when test="${hoaDon.trangThai == 'Đang giao'}">fa-truck</c:when>
							          <c:when test="${hoaDon.trangThai == 'Đã giao'}">fa-check</c:when>
							          <c:when test="${hoaDon.trangThai == 'Đã hủy'}">fa-times</c:when>
							        </c:choose> me-2"></i>
							    ${hoaDon.trangThai}
							  </span>
							</td>

                            <td>
							  <a href="javascript:void(0);" class="btn btn-warning btn-sm text-end" data-bs-toggle="modal" data-bs-target="#orderDetailModal" onclick="loadOrderDetails(${hoaDon.maHD}, ${hoaDon.idNguoiDung})">
	                          		<span class="font-weight-bold">Xem Chi Tiết</span>
	                          </a>
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
	
	   <!-- Modal order Detail -->
	 <div class="modal fade" id="orderDetailModal" tabindex="-1" aria-labelledby="orderDetailModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="orderDetailModalLabel">Chi Tiết Đơn Hàng</h5>
	          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	          
	        </div>
	        <div class="modal-body">
	       
	          <div class="order-details-content">
	           
	          </div>
	        </div>
	      </div>
	    </div>
	  </div> 
	
  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
 
  <script>
  function loadOrderDetails(maHoaDon, idNguoiMua) {
  	console.log(maHoaDon);
      // Gửi mã đơn hàng đến Controller
      fetch(`/project_web/views/admin/HoaDonController`, {
          method: "POST",
          headers: {
          	"Content-Type": "application/json",
              "X-MaHoaDon": maHoaDon,
              "X-IdNguoiMua": idNguoiMua,
          },
          body: `id=${maHoaDon}`,
      })
      .then(response => response.text())
      .then(data => {
          // Chèn dữ liệu trả về từ Controller vào Modal
          document.querySelector('#orderDetailModal .modal-body').innerHTML = data;
          
          // Hiển thị Modal
          const modal = new bootstrap.Modal(document.getElementById('orderDetailModal'));
          modal.show();
      })
      .catch(error => {
          console.error("Error:", error);
          alert("Không thể tải chi tiết đơn hàng!");
      });
  }
  
  const modalElement = document.getElementById('orderDetailModal');

	 // Lắng nghe sự kiện khi modal bị ẩn
	 modalElement.addEventListener('hidden.bs.modal', function () {
	     // Xóa backdrop nếu còn tồn tại
	     const backdrop = document.querySelector('.modal-backdrop');
	     if (backdrop) {
	         backdrop.remove();
	     }
	     // Khôi phục scrollbar
	     document.body.style.overflow = '';
	 });
  </script>
  <script>
function xacNhanDonHang(maHoaDon) {
    if (!confirm("Bạn có chắc chắn muốn xác nhận đơn hàng này?")) {
        return;
    }

    fetch('/project_web/views/admin/HoaDonController', {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ maHoaDon: maHoaDon, trangThai: 'Đang giao'  }),
    })
    .then(response => {
        if (response.ok) {
            alert("Đơn hàng đã được xác nhận thành công!");
            // Tải lại trang hoặc chuyển hướng nếu cần
            location.reload();
        } else {
            return response.text().then(text => {
                throw new Error(text);
            });
        }
    })
    .catch(error => {
        console.error("Error:", error);
        alert("Có lỗi xảy ra khi xác nhận đơn hàng: " + error.message);
    });
}
</script>
  <script>
  function huyDonHang(maHoaDon) {
	    if (!confirm("Bạn có chắc chắn muốn hủy đơn hàng này?")) {
	        return;
	    }

	    fetch('/project_web/views/admin/HoaDonController', {
	        method: 'PUT',
	        headers: {
	            'Content-Type': 'application/json',
	        },
	        body: JSON.stringify({ maHoaDon: maHoaDon, trangThai: 'Đã hủy' }),
	    })
	    .then(response => {
	        if (response.ok) {
	            alert("Đơn hàng đã được hủy thành công!");
	            // Cập nhật lại trạng thái hiển thị
	            document.querySelector('.order_detail_header span').innerText = 'Đã hủy';
	            // Tải lại trang hoặc chuyển hướng nếu cần
	            location.reload();
	        } else {
	            return response.text().then(text => {
	                throw new Error(text);
	            });
	        }
	    })
	    .catch(error => {
	        console.error("Error:", error);
	        alert("Có lỗi xảy ra khi hủy đơn hàng: " + error.message);
	    });
	}
  </script>
  
  <script>
  function daGiao(maHoaDon) {
    if (!confirm("Bạn có chắc chắn muốn xác nhận đơn hàng này đã giao?")) {
        return;
    }

    fetch('/project_web/views/admin/HoaDonController', {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ maHoaDon: maHoaDon, trangThai: 'Đã giao' }),
    })
    .then(response => {
        if (response.ok) {
            alert("Đơn hàng đã được cập nhật thành công!");
            // Cập nhật lại trạng thái hiển thị
            document.querySelector('.order_detail_header span').innerText = 'Đã giao';
            // Tải lại trang hoặc chuyển hướng nếu cần
            location.reload();
        } else {
            return response.text().then(text => {
                throw new Error(text);
            });
        }
    })
    .catch(error => {
        console.error("Error:", error);
        alert("Có lỗi xảy ra khi cập nhật đơn hàng: " + error.message);
    });
  }
</script>
  
</body>
</html>
