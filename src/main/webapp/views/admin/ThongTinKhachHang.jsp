<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="col-md-12 bg-white py-4 px-5">
    <div class="profile-info">
 	<div class="row">
            <div class="col-md-9" style="padding-right: 30px;">
                <div class="row">
                    <!-- Họ và tên -->
                    <div class="col-md-6 mb-3">
                        <label for="hoTen" class="form-label">Họ và tên</label>
                        <div class="form-control readonly">${ThongTinND.hoTen}</div>
                    </div>

                    <!-- Email -->
                    <div class="col-md-6 mb-3">
                        <label for="email" class="form-label">Email</label>
                        <div class="form-control readonly">${ThongTinND.email}</div>
                    </div>
                </div>

                <div class="row">
                    <!-- Số điện thoại -->
                    <div class="col-md-6 mb-3">
                        <label for="sdt" class="form-label">Số điện thoại</label>
                        <div class="form-control readonly">${ThongTinND.sdt}</div>
                    </div>

                    <!-- Số sản phẩm đã mua -->
                    <div class="col-md-6 mb-3">
                        <label for="daMua" class="form-label">Số sản phẩm đã mua</label>
                        <div class="form-control readonly">${ThongTinND.daMua}</div>
                    </div>
                </div>

                <div class="row">
                    <!-- Tổng số tiền đã chi -->
                    <div class="col-md-6 mb-3">
                        <label for="tongTien" class="form-label">Tổng số tiền đã chi</label>
                        <div class="form-control readonly">${ThongTinND.tongTien} VND</div>
                    </div>

                    <!-- Giới tính -->
                    <div class="col-md-6 mb-3">
                        <label for="gioiTinh" class="form-label">Giới tính</label>
                        <div class="form-control readonly">${ThongTinND.gioiTinh}</div>
                    </div>
                </div>

                <div class="row">
                    <!-- Ngày sinh -->
                    <div class="col-md-6 mb-3">
                        <label for="ngaySinh" class="form-label">Ngày sinh</label>
                        <div class="form-control readonly">${ThongTinND.ngaySinh}</div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 text-center">
                <!-- Ảnh đại diện -->
                <img src="https://www.vlance.vn/uploads/portfolio/view/c4a875224357fa0f1dce59defcb7a42b3d6d2cab1.jpg" alt="Profile Picture" class="profile-pic avatar mb-3" style="width: 150px; height: 150px; object-fit: cover; border-radius: 50%;">
                
            </div>
        </div>
    </div>
</div>




<!-- Thông tin chi tiết các sản phẩm trong đơn hàng -->
<div class="card mt-4">
          <div class="card-body">
            <h4>Danh sách đơn hàng</h4>
            <div class="table-responsive">
              <table class="table table-striped table-hover">
                <thead>
                  <tr>
                    <th>Hình ảnh</th>
                    <th>Tên sản phẩm</th>
                    <th>Thông tin</th>
                    <th>Số lượng</th>
                    <th>Tổng tiền</th>
                    <th>Địa chỉ</th>
                    <th>Ngày tạo</th>
                    <th>Trạng thái</th>
                    <th>Đánh giá (Nếu có)</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="hoaDon" items="${ListHD}">
                        <tr>
                            <td><img src="${hoaDon.chiTietHoaDon.sp.hinhAnhSP.duongDanHinh}" alt="Hinh anh san pham" width="50"></td>
                            <td>${hoaDon.chiTietHoaDon.sp.tenSP}</td>
                            <td>${hoaDon.chiTietHoaDon.sp.mauSac[0].tenMau}, ${hoaDon.chiTietHoaDon.sp.kichCo[0].tenKichCo}</td>
                            <td>${hoaDon.chiTietHoaDon.soLuongDaMua}</td>
                            <td>${hoaDon.tongTien}VNĐ</td>
                            <td>${hoaDon.diachi}</td>
                            <td>${hoaDon.ngayTao}</td>
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
							  ${hoaDon.chiTietHoaDon.danhGia.binhLuan}
							</td>
                        </tr>
                    </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>