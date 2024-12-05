<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>	
    <style type="text/css">
    	.modal-content {
		    animation: fadeIn 0.5s ease-in-out;
		}
		
		.modal-body {
		    animation: slideUp 0.5s ease-in-out;
		}
		
		/* Hiệu ứng khi hiển thị modal */
		@keyframes fadeIn {
		    0% {
		        opacity: 0;
		    }
		    100% {
		        opacity: 1;
		    }
		}
		
		/* Hiệu ứng cho modal body */
		@keyframes slideUp {
		    0% {
		        transform: translateY(30px);
		        opacity: 0;
		    }
		    100% {
		        transform: translateY(0);
		        opacity: 1;
		    }
		}
		
		/* Tùy chỉnh nút */
		.btn-primary, .btn-success {
		    font-size: 1.1rem;
		    padding: 0.8rem 1.5rem;
		    border-radius: 25px;
		}
		
		/* Hiệu ứng cho nút khi hover */
		.btn-primary:hover, .btn-success:hover {
		    box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
		    transform: translateY(-2px);
		    transition: transform 0.3s ease-in-out;
		}
		
		/* Tùy chỉnh font chữ trong modal */
		.modal-title {
		    font-size: 1.5rem;
		    font-weight: bold;
		}
		
		.modal-body p {
		    font-weight: 500;
		}
    </style>
</head>
<body>

    <div class="modal fade" id="paymentSuccessModal" tabindex="-1" aria-labelledby="paymentSuccessModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="paymentSuccessModalLabel">
		                    <i class="bi bi-check-circle-fill text-success"></i> Thanh Toán Thành Công
		                </h5>
		            </div>
		            <div class="modal-body text-center">
		                <div class="mb-3">
		                    <i class="bi bi-check-circle-fill display-1 text-success"></i>
		                </div>
		                <p class="fs-4">Cảm ơn bạn đã mua hàng!</p>
		                <p class="fs-5">Bạn có muốn tiếp tục mua sắm hoặc xem đơn hàng của mình?</p>
		            </div>
		            <div class="modal-footer justify-content-center">
		                <a href="/project_web/SanPhamController" class="btn btn-primary" id="continueShoppingButton">Mua Tiếp</a>
		                <a href="/project_web/DonHang?trangThai=Chờ+xác+nhận" class="btn btn-success" id="viewOrderButton">Xem Đơn Hàng</a>
		            </div>
		        </div>
		    </div>
		</div>

    
    <script>
        window.onload = function() {
             var modal = new bootstrap.Modal(document.getElementById('paymentSuccessModal'));
             modal.show();        
        };
    </script>

</body>
</html>
