<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<form id="productFormEdit" action="qlSanPhamController" _method="suaSabPham" method="POST">
  <!-- Row 1: Tên sản phẩm -->
  <div class="row mb-5">
    <div class="col-md-7">
      <div class="row mb-2">
        <div class="col-md-11">
          <label for="productNameEdit" class="form-label">Tên sản phẩm</label>
          <input type="text" class="form-control" id="tensp" placeholder="Nhập tên sản phẩm" value="${ThongTinSP.tenSP}" required>
        </div>
        
      </div>
      <div class="row mb-2">
        <div class="col-md-4">
          <label for="productPriceEdit" class="form-label">Giá sản phẩm</label>
          <input type="number" class="form-control" id="giasanpham" placeholder="100000" value="${ThongTinSP.giaBanDau}" required>
        </div>
        <div class="col-md-3">
          <label for="productDiscountEdit" class="form-label">Giảm giá</label>
          <input type="number" class="form-control" id="giamgia" placeholder="100000" value="${ThongTinSP.giamGia}" required>
        </div>
        <div class="col-md-4">
          <label for="productQuantityEdit" class="form-label">Số lượng</label>
          <input type="number" class="form-control" id="soluong" placeholder="50" value="${ThongTinSP.soLuong}" required>
        </div>
      </div>
      <div class="row mb-2">
        <div class="col-md-11">
          <label for="productCategoryEdit" class="form-label">Danh mục</label>
          <select id="danhmuc" class="form-select" required>
            <c:forEach var="danhMuc" items="${ListDanhMuc}">
    			<option name="maDanhMuc" value="${danhMuc.maDanhMuc}" 
	            <c:if test="${danhMuc.maDanhMuc == ThongTinSP.danhMuc.maDanhMuc}">
	              selected
	            </c:if>>
      			${danhMuc.tenDanhMuc}
			    </option>
			  </c:forEach>
          </select>
        </div>
      </div>
    </div>
    <div class="col-md-5 form-group" style="border-left: 1px solid #ccc; height: 250px;">
      <div class="product-image-container">
        <img 
          src="${ThongTinSP.hinhAnhSP.duongDanHinh}"
          alt="${ThongTinSP.hinhAnhSP.moTaHinh }" 
          class="product-image-preview Edit"
          id="anh">
          <button type="button" class="btn btn-outline-secondary" id="uploadProductImageButtonEdit" onclick="showImageInput()">Chọn ảnh</button>
		  <input type="file" id="productImageInputEdit" class="d-none" accept="image/*">
			  <div id="customImageInputContainer" class="container mt-3 p-3 border rounded bg-light" style="display: none;">
				  <div class="row g-2 align-items-center">
				    <div class="col">
				      <input type="text" id="customImagePath" class="form-control" placeholder="Nhập URL ảnh..." />
				    </div>
				    <div class="col-auto">
				      <button type="button" id="confirmImage" class="btn btn-primary" onclick="confirmImageUpload()">Xác nhận</button>
				    </div>
				  </div>
				</div>


		</div>
      </div>
    </div>
    
  </div>
  <div class="row mb-2">
    <div class="col-md-6">
      <label for="productOriginEdit" class="form-label">Xuất xứ</label>
      <input type="text" class="form-control" id="xuatxu" placeholder="Việt Nam" value="${ThongTinSP.xuatXu}" required>
    </div>
    <div class="col-md-6">
      <label for="productMaterialEdit" class="form-label">Chất liệu</label>
      <input type="text" class="form-control" id="chatlieu" placeholder="Cotton" value="${ThongTinSP.chatLieu}" required>
    </div>
  </div>
  <div class="row mb-3">
    <div class="col-md-6">
      <label class="form-label">Size</label>
      <div class="btn-group d-flex flex-wrap" role="group" aria-label="Size options">
        <input type="checkbox" class="btn-check" id="sizeSEdit" value="S" autocomplete="off">
        <label class="btn btn-outline-primary" for="sizeSEdit">S</label>
  
        <input type="checkbox" class="btn-check" id="sizeMEdit" value="M" autocomplete="off">
        <label class="btn btn-outline-primary" for="sizeMEdit">M</label>
  
        <input type="checkbox" class="btn-check" id="sizeLEdit" value="L" autocomplete="off">
        <label class="btn btn-outline-primary" for="sizeLEdit">L</label>
  
        <input type="checkbox" class="btn-check" id="sizeXLEdit" value="XL" autocomplete="off">
        <label class="btn btn-outline-primary" for="sizeXLEdit">XL</label>
  
        <input type="checkbox" class="btn-check" id="sizeXXLEdit" value="XXL" autocomplete="off">
        <label class="btn btn-outline-primary" for="sizeXXLEdit">XXL</label>
      </div>
    </div>
  
    <div class="col-md-6">
      <label class="form-label">Màu sắc</label>
      <div class="filter_category" style="width:100%; border-radius:5px;">
           <div class="filter_category-title">Danh sách màu...</div>
           <div class="icon-controls"><i class="fas fa-sort-down"></i></div>
           <div class="dropdown-content color-options">
	           <c:forEach var="item" items="${listMauHex}">
			   		<div class="color-circle" style="background-color: ${item};" data-color="${item}" onclick="toggleColor(this)">
				     	<span class="tick">&#10003;</span>
				 	</div>
				</c:forEach>
           </div>
       </div>
    </div>
  </div>
  <!-- Row 6: Mô tả -->
   
  <div class="row mb-3">
    <div class="col-md-12">
      <label for="productDescriptionEdit" class="form-label">Mô tả sản phẩm</label>
      <textarea id="mota" class="form-control" rows="4" placeholder="Đẹp" required>${ThongTinSP.mota}</textarea>
    </div>
  </div>

  <!-- Nút lưu -->
  <div class="text-center">
    <button type="submit" class="btn btn-primary Edit">Lưu</button>
  </div>
</form>

