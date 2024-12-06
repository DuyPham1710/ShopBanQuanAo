<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<form id="productForm">
  <!-- Row 1: Tên sản phẩm -->
  <div class="row mb-5">
    <div class="col-md-7">
      <div class="row mb-2">
        <div class="col-md-11">
          <label for="productNameAdd" class="form-label">Tên sản phẩm</label>
          <input type="text" class="form-control" id="tenSPAdd" name="tenSPAdd" placeholder="Nhập tên sản phẩm"  required>
        </div>
        
      </div>
      <div class="row mb-2">
        <div class="col-md-4">
          <label for="productPriceAdd" class="form-label">Giá sản phẩm</label>
          <input type="number" class="form-control" id="giaSanPhamAdd" name="giaSanPhamAdd" placeholder="Nhập giá sản phẩm"  required>
        </div>
        <div class="col-md-3">
          <label for="productDiscountAdd" class="form-label">Giảm giá</label>
          <input type="number" class="form-control" id="giamGiaAdd" name="giamGiaAdd" placeholder="Nhập giảm giá(%)" required>
        </div>
        <div class="col-md-4">
          <label for="productQuantityAdd" class="form-label">Số lượng</label>
          <input type="number" class="form-control" id="soLuongAdd" name="soLuongAdd" placeholder="Nhập số lượng sản phẩm" required>
        </div>
      </div>
      <div class="row mb-2">
		  <div class="col-md-11">
		    <label for="productCategoryAdd" class="form-label">Danh mục</label>
		    <select id="danhmucAdd" class="form-select" required onchange="toggleDanhMucInput()">
		      <c:forEach var="danhMuc" items="${ListDanhMuc}">
		        <option value="${danhMuc.maDanhMuc}">
		          ${danhMuc.tenDanhMuc}
		        </option>
		      </c:forEach>
		      <option value="0">Thêm danh mục</option>
		    </select>
		  </div>
		</div>
		<div class="row mb-2" id="newDanhMucRow" style="display: none;">
		  <div class="col-md-11">
		    <label for="newDanhMucInput" id="labelDanhMuc" class="form-label" >Tên danh mục mới</label>
		    <input type="text" id="newDanhMucInput" class="form-control" placeholder="Nhập tên danh mục mới" value="">
		  </div>
		</div>
    </div>
    <div class="col-md-5 form-group" style="border-left: 1px solid #ccc; height: 250px;">
      <div class="product-image-container">
        <img 
          src="https://png.pngtree.com/png-clipart/20210310/original/pngtree-creative-wallet-png-image_5926166.jpg"
          alt="Ảnh sản phẩm" 
          class="product-image-preview Add"
          id="anhAdd">
          <input type="hidden" id="linkAnhAdd" name="linkAnhAdd"  />
          <button type="button" class="btn btn-outline-secondary" id="uploadProductImageButtonAdd" onclick="showImageInputAdd()">Chọn ảnh</button>
		  <input type="file" id="productImageInputAdd" class="d-none" accept="image/*">
			  <div id="customImageInputContainerAdd" class="container mt-3 p-3 border rounded bg-light" style="display: none;">
				  <div class="row g-2 align-items-center">
				    <div class="col">
				      <input type="text" id="customImagePathAdd" class="form-control" placeholder="Nhập URL ảnh..." />
				    </div>
				    <div class="col-auto">
				      <button type="button" id="confirmImageAdd" class="btn btn-primary" onclick="confirmImageUploadAdd()">Xác nhận</button>
				    </div>
				  </div>
			</div>
		</div>
      </div>
    </div>
    
  </div>
  <div class="row mb-2">
    <div class="col-md-6">
      <label for="productOriginAdd" class="form-label">Xuất xứ</label>
      <input type="text" class="form-control" id="xuatXuAdd" name="xuatXuAdd" placeholder="Nhập nguồn gốc xuất xứ..."  required>
    </div>
    <div class="col-md-6">
      <label for="productMaterialAdd" class="form-label">Chất liệu</label>
      <input type="text" class="form-control" id="chatLieuAdd" name="chatLieuAdd" placeholder="Nhập chất liệu sản phẩm..."  required>
    </div>
  </div>
  <div class="row mb-3">
    <div class="col-md-6">
      <label class="form-label">Size</label>
      <div class="filter_category" style="width:100%; border-radius:5px;">
      		<input type="hidden" id="sizeDaDuocChonAdd" name="sizeDaDuocChonAdd" />
		    <div class="filter_category-title">Danh sách kích thước...</div>
		    <div class="icon-controls"><i class="fas fa-sort-down"></i></div>
		    <div class="dropdown-content size-options">
		        <c:forEach var="item" items="${listAllSize}">
		            <div class="size-option" data-size="${item}" onclick="toggleSizeSelection(this)">${item}</div>
		        </c:forEach>
		    </div>
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
  <div class="row mb-2">
        <div class="col-md-6">
          <label for="sizeThemVaoAdd" class="form-label">Thêm Size khác</label>
          <input type="text" class="form-control" id="sizeThemVaoAdd" name="sizeThemVaoAdd" placeholder="Nhập tên size(cách nhau bằng dấu ',')">
        </div>
        
        <div class="col-md-6">
          <label for="mauThemVaoAdd" class="form-label">Thêm màu khác</label>
          <input type="text" class="form-control" id="mauThemVaoAdd" name="mauThemVaoAdd" placeholder="Nhập #Mã màu Hex-tên màu (cách nhau bằng dấu ',')">
        </div>
      </div>
  <!-- Row 6: Mô tả -->
   
  <div class="row mb-3">
    <div class="col-md-12">
      <label for="productDescriptionAdd" class="form-label">Mô tả sản phẩm</label>
      <textarea id="moTaAdd" class="form-control" rows="6" name="moTaAdd" placeholder="Nhập thông tin mô tả sản phẩm..." required></textarea>
    </div>
  </div>

  <!-- Nút lưu -->
  
	<div class="text-center">
     <button type="button" class="btn btn-primary" onclick="kiemTraRongKhiAdd()">Thêm sản phẩm</button>
   </div>
</form>


