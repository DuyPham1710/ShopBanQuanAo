<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản lý sản phẩm</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="./css/stylesQuanLySP.css">
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
              <a class="nav-link" href="#">Order</a>
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
            <button class="btn btn-primary me-3" data-bs-toggle="modal" data-bs-target="#addProductModal">Thêm sản phẩm</button>
            
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
                  <h2 class="font-weight-bold">1,200</h2>
                  <div class="text-success">
                    <i class="fas fa-arrow-up"></i> Tổng số sản phẩm còn trong kho
                  </div>
                </div>
              </div>
              <div class="row mb-2">
                <div class="card card-body" style="margin-left: 10px;">
                  <h5 class="card-title">Tổng sản phẩm bán được</h5>
                  <h2 class="font-weight-bold">320</h2>
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
              <label for="chartYear" class="me-2">Chọn năm:</label>
              <input type="number" id="chartYear" class="form-control" style="width: auto;" value="2024">
            </div>
            <div class="row">
              <!-- Cột danh sách sản phẩm bán chạy -->
              <div class="col-md-5 mb-4">
                <h5>Top 5 sản phẩm bán chạy</h5>
                <ul class="list-group" id="topProducts">
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    Sản phẩm A <span>150 sản phẩm</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    Sản phẩm B <span>120 sản phẩm</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    Sản phẩm C <span>90 sản phẩm</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    Sản phẩm D <span>80 sản phẩm</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    Sản phẩm E <span>75 sản phẩm</span>
                  </li>
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
            <div class="table-responsive" style="max-height: 400px; overflow-y: auto;">
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
                  <tr>
                  	<form action="QuanLySPController" method="get">
                  		<c:forEach var="sp" items="${ListSP}">
		                    <td>1</td>
		                    <td><img src="${sp.hinhAnhSP.duongDanHinh}" alt="${sp.tenSP}" width="50"></td>
		                    <td>${sp.tenSP}</td>
		                    <td>${sp.giaHienTai} VNĐ</td>
		                    <td>${sp.soLuong}</td>
		                    <td>${sp.daBan}</td>
		                    <td>
		                      <button class="btn btn-primary btn-sm " data-bs-toggle="modal" data-bs-target="#editProductModal">Sửa</button>
		                      <button class="btn btn-danger btn-sm">Xóa</button>
		                    </td>
		                    <input type="hidden" name="method" value="get">
					        <input type="hidden" name="maSP" value="${sp.maSP}">
	                    </c:forEach>
                  	</form>
                  </tr>
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
                <form id="productForm">
                  <!-- Row 1: Tên sản phẩm -->
                  <div class="row mb-4">
                    <div class="col-md-7">
                      <div class="row mb-2">
                        <div class="col-md-11">
                          <label for="productName" class="form-label">Tên sản phẩm</label>
                          <input type="text" class="form-control" id="productName" placeholder="Nhập tên sản phẩm" required>
                        </div>
                        
                      </div>
                      <div class="row mb-2">
                        <div class="col-md-6">
                          <label for="productPrice" class="form-label">Giá sản phẩm</label>
                          <input type="number" class="form-control" id="productPrice" placeholder="Nhập giá sản phẩm" required>
                        </div>
                        <div class="col-md-5">
                          <label for="productQuantity" class="form-label">Số lượng</label>
                          <input type="number" class="form-control" id="productQuantity" placeholder="Nhập số lượng" required>
                        </div>
                      </div>
                      <div class="row mb-2">
                        <div class="col-md-11">
                          <label for="productCategory" class="form-label">Danh mục</label>
                          <select id="productCategory" class="form-select" required>
                            <option value="Quần áo">Quần áo</option>
                            <option value="Giày dép">Giày dép</option>
                            <option value="Phụ kiện">Phụ kiện</option>
                            <option value="Khác">Khác</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-5 form-group" style="border-left: 1px solid #ccc; height: 250px;">
                      <div class="product-image-container">
                        <img 
                          src="https://via.placeholder.com/200x150.png?text=Chưa+chọn+hình" 
                          alt="Product Image Preview" 
                          class="product-image-preview">
                        <button type="button" class="btn btn-outline-secondary" id="uploadProductImageButton">Chọn ảnh</button>
                        <input type="file" id="productImageInput" class="d-none" accept="image/*">
                      </div>
                    </div>
                    
                  </div>
                  <div class="row mb-2">
                    <div class="col-md-6">
                      <label for="productOrigin" class="form-label">Xuất xứ</label>
                      <input type="text" class="form-control" id="productOrigin" placeholder="Nhập xuất xứ" required>
                    </div>
                    <div class="col-md-6">
                      <label for="productMaterial" class="form-label">Chất liệu</label>
                      <input type="text" class="form-control" id="productMaterial" placeholder="Nhập chất liệu" required>
                    </div>
                  </div>
                  <div class="row mb-3">
                    <div class="col-md-6">
                      <label class="form-label">Size</label>
                      <div class="btn-group d-flex flex-wrap" role="group" aria-label="Size options">
                        <input type="checkbox" class="btn-check" id="sizeS" value="S" autocomplete="off">
                        <label class="btn btn-outline-primary" for="sizeS">S</label>
                  
                        <input type="checkbox" class="btn-check" id="sizeM" value="M" autocomplete="off">
                        <label class="btn btn-outline-primary" for="sizeM">M</label>
                  
                        <input type="checkbox" class="btn-check" id="sizeL" value="L" autocomplete="off">
                        <label class="btn btn-outline-primary" for="sizeL">L</label>
                  
                        <input type="checkbox" class="btn-check" id="sizeXL" value="XL" autocomplete="off">
                        <label class="btn btn-outline-primary" for="sizeXL">XL</label>
                  
                        <input type="checkbox" class="btn-check" id="sizeXXL" value="XXL" autocomplete="off">
                        <label class="btn btn-outline-primary" for="sizeXXL">XXL</label>
                      </div>
                    </div>
                  
                    <div class="col-md-6">
                      <label class="form-label">Màu</label>
                      <div class="btn-group d-flex flex-wrap" role="group" aria-label="Color options">
                        <input type="checkbox" class="btn-check" id="colorRed" value="Đỏ" autocomplete="off">
                        <label class="btn btn-outline-danger" for="colorRed">Đỏ</label>
                  
                        <input type="checkbox" class="btn-check" id="colorBlue" value="Xanh" autocomplete="off">
                        <label class="btn btn-outline-primary" for="colorBlue">Xanh</label>
                  
                        <input type="checkbox" class="btn-check" id="colorYellow" value="Vàng" autocomplete="off">
                        <label class="btn btn-outline-warning" for="colorYellow">Vàng</label>
                  
                        <input type="checkbox" class="btn-check" id="colorWhite" value="Trắng" autocomplete="off">
                        <label class="btn btn-outline-secondary" for="colorWhite">Trắng</label>
                  
                        <input type="checkbox" class="btn-check" id="colorBlack" value="Đen" autocomplete="off">
                        <label class="btn btn-outline-dark" for="colorBlack">Đen</label>
                      </div>
                    </div>
                  </div>
                  <!-- Row 6: Mô tả -->
                  <div class="row mb-3">
                    <div class="col-md-12">
                      <label for="productDescription" class="form-label">Mô tả sản phẩm</label>
                      <textarea id="productDescription" class="form-control" rows="4" placeholder="Nhập mô tả chi tiết sản phẩm" required></textarea>
                    </div>
                  </div>
        
                  <!-- Nút lưu -->
                  <div class="text-center">
                    <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
                  </div>
                </form>
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
                <form id="productFormEdit">
                  <!-- Row 1: Tên sản phẩm -->
                  <div class="row mb-4">
                    <div class="col-md-7">
                      <div class="row mb-2">
                        <div class="col-md-11">
                          <label for="productNameEdit" class="form-label">Tên sản phẩm</label>
                          <input type="text" class="form-control" id="productNameEdit" placeholder="Sản phẩm a" required>
                        </div>
                        
                      </div>
                      <div class="row mb-2">
                        <div class="col-md-6">
                          <label for="productPriceEdit" class="form-label">Giá sản phẩm</label>
                          <input type="number" class="form-control" id="productPriceEdit" placeholder="100000" required>
                        </div>
                        <div class="col-md-5">
                          <label for="productQuantityEdit" class="form-label">Số lượng</label>
                          <input type="number" class="form-control" id="productQuantityEdit" placeholder="50" required>
                        </div>
                      </div>
                      <div class="row mb-2">
                        <div class="col-md-11">
                          <label for="productCategoryEdit" class="form-label">Danh mục</label>
                          <select id="productCategoryEdit" class="form-select" required>
                            <option value="Quần áo">Quần áo</option>
                            <option value="Giày dép">Giày dép</option>
                            <option value="Phụ kiện">Phụ kiện</option>
                            <option value="Khác">Khác</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-5 form-group" style="border-left: 1px solid #ccc; height: 250px;">
                      <div class="product-image-container">
                        <img 
                          src="https://www.akmen.vn/images/2020/12/ao-thun-phoi-raglan-gan-nhan-at036-mau-reu-10432-p.png"
                          alt="Product Image Preview" 
                          class="product-image-preview Edit">
                        <button type="button" class="btn btn-outline-secondary" id="uploadProductImageButtonEdit">Chọn ảnh</button>
                        <input type="file" id="productImageInputEdit" class="d-none" accept="image/*">
                      </div>
                    </div>
                    
                  </div>
                  <div class="row mb-2">
                    <div class="col-md-6">
                      <label for="productOriginEdit" class="form-label">Xuất xứ</label>
                      <input type="text" class="form-control" id="productOriginEdit" placeholder="Việt Nam" required>
                    </div>
                    <div class="col-md-6">
                      <label for="productMaterialEdit" class="form-label">Chất liệu</label>
                      <input type="text" class="form-control" id="productMaterialEdit" placeholder="Cotton" required>
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
                      <label class="form-label">Màu</label>
                      <div class="btn-group d-flex flex-wrap" role="group" aria-label="Color options">
                        <input type="checkbox" class="btn-check" id="colorRedEdit" value="Đỏ" autocomplete="off">
                        <label class="btn btn-outline-danger" for="colorRedEdit">Đỏ</label>
                  
                        <input type="checkbox" class="btn-check" id="colorBlueEdit" value="Xanh" autocomplete="off">
                        <label class="btn btn-outline-primary" for="colorBlueEdit">Xanh</label>
                  
                        <input type="checkbox" class="btn-check" id="colorYellowEdit" value="Vàng" autocomplete="off">
                        <label class="btn btn-outline-warning" for="colorYellowEdit">Vàng</label>
                  
                        <input type="checkbox" class="btn-check" id="colorWhiteEdit" value="Trắng" autocomplete="off">
                        <label class="btn btn-outline-secondary" for="colorWhiteEdit">Trắng</label>
                  
                        <input type="checkbox" class="btn-check Edit" id="colorBlackEdit" value="Đen" autocomplete="off">
                        <label class="btn btn-outline-dark Edit" for="colorBlackEdit">Đen</label>
                      </div>
                    </div>
                  </div>
                  <!-- Row 6: Mô tả -->
                   
                  <div class="row mb-3">
                    <div class="col-md-12">
                      <label for="productDescriptionEdit" class="form-label">Mô tả sản phẩm</label>
                      <textarea id="productDescriptionEdit" class="form-control" rows="4" placeholder="Đẹp" required></textarea>
                    </div>
                  </div>
        
                  <!-- Nút lưu -->
                  <div class="text-center">
                    <button type="submit" class="btn btn-primary Edit">Lưu</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  
</body>
</html>
