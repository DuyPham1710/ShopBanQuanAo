<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container my-5">
  <div class="row">
    <!-- Tên -->
    <div class="col-md-6 mb-3">
      <label class="form-label">Họ và tên</label>
      <input type="text" class="form-control" value="${customer.name}" disabled />
    </div>

    <!-- Email -->
    <div class="col-md-6 mb-3">
      <label class="form-label">Email</label>
      <input type="email" class="form-control" value="${customer.email}" disabled />
    </div>
  </div>

  <div class="row">
    <!-- Số điện thoại -->
    <div class="col-md-6 mb-3">
      <label class="form-label">Số điện thoại</label>
      <input type="text" class="form-control" value="${customer.phone}" disabled />
    </div>

    <!-- Số sản phẩm đã mua -->
    <div class="col-md-6 mb-3">
      <label class="form-label">Số sản phẩm đã mua</label>
      <input type="number" class="form-control" value="${customer.totalProducts}" disabled />
    </div>
  </div>

  <div class="row">
    <!-- Số tiền -->
    <div class="col-md-6 mb-3">
      <label class="form-label">Tổng số tiền đã chi</label>
      <input type="text" class="form-control" value="${customer.totalSpent}" disabled />
    </div>

    <!-- Giới tính -->
    <div class="col-md-6 mb-3">
      <label class="form-label">Giới tính</label>
      <input type="text" class="form-control" value="${customer.gender}" disabled />
    </div>
  </div>

  <div class="row">
    <!-- Ngày sinh -->
    <div class="col-md-6 mb-3">
      <label class="form-label">Ngày sinh</label>
      <input type="date" class="form-control" value="${customer.dob}" disabled />
    </div>
  </div>
</div>



<!-- Thông tin chi tiết các sản phẩm trong đơn hàng -->
<div class="container my-5">
  <h3 class="text-center mb-4">Chi tiết các sản phẩm trong đơn hàng</h3>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>Ảnh</th>
            <th>Tên sản phẩm</th>
            <th>Số lượng</th>
            <th>Màu sắc</th>
            <th>Kích thước</th>
            <th>Số tiền</th>
            <th>Trạng thái</th>
            <th>Đánh giá</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="product" items="${order.products}">
            <tr>
              <td><img src="${product.image}" alt="${product.name}" width="50" /></td>
              <td>${product.name}</td>
              <td>${product.quantity}</td>
              <td>${product.color}</td>
              <td>${product.size}</td>
              <td>${product.price}</td>
              <td>${product.status}</td>
              <td>${product.rating}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
</div>
