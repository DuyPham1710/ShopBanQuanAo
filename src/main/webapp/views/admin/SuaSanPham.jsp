<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<form id="productFormEdit" action="qlSanPhamController" _method="suaSanPham" method="POST">
  <!-- Row 1: Tên sản phẩm -->
  <input type="hidden" id="maSanPhamEdit" name="maSanPhamEdit" value="${ThongTinSP.maSP }" />
  <div class="row mb-5">
    <div class="col-md-7">
      <div class="row mb-2">
        <div class="col-md-11">
          <label for="productNameEdit" class="form-label">Tên sản phẩm</label>
          <input type="text" class="form-control" id="tenSPEdit" name="tenSPEdit" placeholder="Nhập tên sản phẩm" value="${ThongTinSP.tenSP}" required>
        </div>
        
      </div>
      <div class="row mb-2">
        <div class="col-md-4">
          <label for="productPriceEdit" class="form-label">Giá sản phẩm</label>
          <input type="number" class="form-control" id="giaSanPhamEdit" name="giaSanPhamEdit" placeholder="100000" value="${ThongTinSP.giaBanDau}" required>
        </div>
        <div class="col-md-3">
          <label for="productDiscountEdit" class="form-label">Giảm giá</label>
          <input type="number" class="form-control" id="giamGiaEdit" name="giamGiaEdit" placeholder="100000" value="${ThongTinSP.giamGia}" required>
        </div>
        <div class="col-md-4">
          <label for="productQuantityEdit" class="form-label">Số lượng</label>
          <input type="number" class="form-control" id="soLuongEdit" name="soLuongEdit" placeholder="50" value="${ThongTinSP.soLuong}" required>
        </div>
      </div>
      <div class="row mb-2">
        <div class="col-md-11">
          <label for="productCategoryEdit" class="form-label">Danh mục</label>
          <select id="danhmucEdit" class="form-select" required onchange="toggleDanhMucInputEdit()">
			    <c:forEach var="danhMuc" items="${ListDanhMuc}">
			        <option value="${danhMuc.maDanhMuc}"
			            <c:if test="${danhMuc.maDanhMuc == ThongTinSP.danhMuc.maDanhMuc}">
			                selected
			            </c:if>>
			            ${danhMuc.tenDanhMuc}
			        </option>
			        
			    </c:forEach>
			    <option value="0">
			        	Thêm danh mục mới
			     </option>
			</select>

        </div>
      </div>
      <div class="row mb-2" id="newDanhMucRowEdit" style="display: none;">
		  <div class="col-md-11">
		    <label for="newDanhMucInput" id="labelDanhMuc" class="form-label" >Tên danh mục mới</label>
		    <input type="text" id="newDanhMucInputEdit" class="form-control" placeholder="Nhập tên danh mục mới" value="">
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
          <input type="hidden" id="linkAnhEdit" name="linkAnhEdit" value="${ThongTinSP.hinhAnhSP.duongDanHinh}" />
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
      <input type="text" class="form-control" id="xuatXuEdit" name="xuatXuEdit" placeholder="Việt Nam" value="${ThongTinSP.xuatXu}" required>
    </div>
    <div class="col-md-6">
      <label for="productMaterialEdit" class="form-label">Chất liệu</label>
      <input type="text" class="form-control" id="chatLieuEdit" name="chatLieuEdit" placeholder="Cotton" value="${ThongTinSP.chatLieu}" required>
    </div>
  </div>
  <div class="row mb-3">
    <div class="col-md-6">
      <label class="form-label">Size</label>
      <div class="filter_category" style="width:100%; border-radius:5px;">
      		<input type="hidden" id="sizeDaDuocChon" name="sizeDaDuocChonEdit" value="<c:forEach var="size" items="${listSizeCuaSP}" varStatus="status">${size}<c:if test="${!status.last}">,</c:if></c:forEach>" />
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
      <input type="hidden" id="mauDaDuocChon" name="mauDaDuocChonEdit" value="<c:forEach var="mau" items="${listMauCuaSP}" varStatus="status">${mau}<c:if test="${!status.last}">,</c:if></c:forEach>" />
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
      <textarea id="moTaEdit" class="form-control" rows="6" name="moTaEdit" placeholder="Đẹp" required>${ThongTinSP.mota}</textarea>
    </div>
  </div>

  <!-- Nút lưu -->
  <div class="text-center">
	<button type="button" class="btn btn-primary Edit" onclick="kiemTraRongKhiEdit()">Lưu</button>
  </div>
</form>



