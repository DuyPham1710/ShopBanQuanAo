<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail product</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- FontAwesome -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
<link rel="stylesheet" href="./views/css/style.css">
<link rel="stylesheet" href="./views/css/ChiTietSP.css">
</head>
<body>
	<!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <div class="justify-content-between d-flex align-items-center">
                <div class="d-flex align-items-center">
                    <a class="navbar-brand" href="/project_web/views/home.jsp">
                        <img src="./views/images/logo.jpg" alt="Logo">
                    </a>
                     <form class="d-flex">
		                <input class="form-control me-2" type="search" placeholder="Search Products" aria-label="Search">
		                <button class="btn btn-outline-secondary" type="submit">
		                    <i class="fas fa-search"></i>
		                </button>
		            </form>
                </div>
                <div class="navbar-nav">
                    <a class="nav-link" href="/project_web/views/home.jsp">TRANG CHỦ</a>
                    <a class="nav-link" href="SanPhamController">SẢN PHẨM</a>
                    <span class="nav-icon"><a href="/project_web/views/GioHang.jsp"><i class="fas fa-shopping-bag"></i></a></span>
                    <span class="nav-icon"><a href="#"><i class="fas fa-user"></i></a></span>
                </div>
            </div>
        </div>
    </nav>
    
     <!-- Banner -->
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12">
			    <nav aria-label="breadcrumb">
			        <ol class="breadcrumb">
			            <li class="breadcrumb-item" id="home-item">
				            <a href="/project_web/views/home.jsp">
				            	<i class="fas fa-home"></i>
				            </a>
			            </li>
			            <li class="breadcrumb-item active" id="product-item"> Sản phẩm / ${sp.tenSP}</li>
			        </ol>
			    </nav>
			</div>

            <form class="product">
		        <div class="product-container">
		            <div class="product-image">
		                <img src="${sp.duongDanHinh}" alt="${sp.tenSP}">
		            </div>
		            
		            <div class="product-details">
		                <h1 class="summer-shirt">${sp.tenSP}</h1>
		                <p>Thương hiệu: <a href="#">Golden Accessories</a></p>
		                <div class="box-container">
		                    <hr class="divider">
		                </div>                
		                <p>Giá:</p> 
		
		                <div class="price">
		                    <span class="sale-price">${sp.gia}₫</span>
		                    <span class="original-price">100.000₫</span>
		                </div>
		                <div class="box-container">
		                    <hr class="divider">
		                </div>  
		                
		                
		                <div class="change-details">
		                    <div class="details-group">
		                        <div class="quantity">
								    <p>Số lượng:</p>
								    <div class="button-group">
								        <button type="button" class="button" onclick="changeQuantity(-1)">-</button>
								        <button type="button" class="button" id="quantity">1</button><!-- Giá trị mặc định là 1 -->
								        <button type="button" class="button" onclick="changeQuantity(1)">+</button>
								    </div>	
								</div>
		                        <script>
								    function changeQuantity(value) {
								        // Lấy phần tử hiển thị số lượng
								        const quantityElement = document.getElementById("quantity");
								        let quantity = parseInt(quantityElement.innerText);
								        
								        // Tăng hoặc giảm số lượng
								        quantity += value;
								        
								        // Đảm bảo số lượng không nhỏ hơn 1
								        if (quantity < 1) {
								            quantity = 1;
								        }
								
								        // Cập nhật lại giá trị số lượng trên trang
								        quantityElement.innerText = quantity;
								    }
								</script>
		                        <div class="size">
		                            <p>Size:</p>
		                            <div class="button-group1">
		                            	<c:forEach var="size" items="${ListSize}">			                    
					                         <button class="button">${size}</button>
						                </c:forEach>

		                            </div>
		                            
		                        </div>
		                     
		                        
		                        <div class="color">
		                            <p>Màu sắc:</p>
		                            <div class="color-selector">
		                            	<select class="form-select" name="tenmau">
						                    <c:forEach var="color" items="${ListMau}">
						                       <option value="${color}">${color}</option>
						                    </c:forEach>
						                </select>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                
		                
		                
		                <div class="buttons">
		                    <button class="buy-now">Mua Ngay</button>
		                    <button class="add-to-cart">Thêm vào giỏ hàng</button>
		                </div>
		            </div>
		        </div>
		    </form>
            
        </div>
    </div>
</body>
</html>