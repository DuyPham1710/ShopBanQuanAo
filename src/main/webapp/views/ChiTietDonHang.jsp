<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="order_detail_container">
    <div class="order_detail_header">
        <p>Đơn hàng: <span class="font-weight-bold">123</span></p>
    </div>
    <div class="order_detail_header">
        <p>Trạng thái: <span class="font-weight-bold">Chờ xác nhận</span></p>
    </div>
</div>

<div class="container my-5">
    <div class="row">
        <!-- Thông tin đơn hàng -->
        <div class="col-md-6">
            <h3 class="font-weight-bold mb-3">Thông tin chi tiết</h3>
            <form>
                <div class="mb-3 row">
                    <label for="full-name" class="col-sm-3 col-form-label">Họ và tên</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="full-name" placeholder="duy" value="${nguoiDung.hoTen}">
                    </div>
                </div>
               
                <div class="mb-3 row">
                    <label for="phone-number" class="col-sm-3 col-form-label">Số điện thoại</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="phone-number" placeholder="0794821201" value="${nguoiDung.hoTen}">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="Email" class="col-sm-3 col-form-label">Email</label>
                    <div class="col-sm-9">
                        <input type="Email" class="form-control" id="Email" placeholder="duy@gmail.com" value="${nguoiDung.email}">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="street-address" class="col-sm-3 col-form-label">Địa chỉ nhận hàng</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="street-address" placeholder="123 Main St, Hanoi" value="${nguoiDung.diaChiNhanHang[0].tenDiaChi}">
                    </div>
                </div>
                
                <div class="mb-3">
                    <label class="col-form-label font-weight-bold">Phương thức thanh toán</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="pay-later" checked>
                    <label class="form-check-label" for="pay-later">Thanh toán khi nhận hàng</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="online-payment">
                    <label class="form-check-label" for="online-payment">Online payment</label>
                </div>
            </form>

            
        </div>

        <!-- Thông tin đơn hàng -->
        <div class="col-md-6">
            <h3 class="font-weight-bold mb-3">Đơn hàng của bạn</h3>
			<c:forEach var="ChiTietHD" items="${listChiTietHD}">
				<div class="d-flex align-items-center mb-3 border-bottom pb-3">
	                <img src="${ChiTietHD.sp.hinhAnhSP.duongDanHinh}" alt="${ChiTietHD.sp.tenSP}" class="rounded" style="width: 60px; height: 60px; object-fit: cover;">
	                <div class="ms-3 flex-grow-1">
	                    <h6 class="mb-1">${ChiTietHD.sp.tenSP}</h6>
	                    <p class="mb-1 text-muted">Size: ${ChiTietHD.sp.kichCo[0].tenKichCo}, Màu: ${ChiTietHD.sp.mauSac[0].tenMau}</p>
	                    <p class="mb-0 text-muted">x${ChiTietHD.soLuongDaMua}</p>
	                </div>
	                <!-- Đơn giá sản phẩm -->
	                <div class="ms-auto">
	                    <p class="mb-1 text-end" style="font-size: 15px; margin-right: 20px;">
	                        <span style="display: block; text-align: center;">Đơn giá</span> 
	                        <strong>${ChiTietHD.donGia} VND</strong>
	                    </p>
	                </div>
	            </div>
			</c:forEach>
            

            <!-- Tổng tiền -->
            <div class="d-flex justify-content-between mt-3 pt-3 border-top product-price">
                <h5 class="font-weight-bold">Tổng tiền</h5>
                <h5 class="font-weight-bold"><strong>1.500.000 VND</strong></h5>
            </div>
        </div>
    </div>
</div>