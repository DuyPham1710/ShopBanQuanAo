<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Page</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/styleSignUp.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Thêm Animate.css cho hiệu ứng -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <!-- Thêm Font Awesome cho biểu tượng -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="wrapper">
        <form action="/project_web/SignUpController" method="post" onsubmit="return validatePassword(event)">
            <input type="hidden" name="csrfToken" value="${csrfToken}" />
            <h1>Register</h1>
            
            <!-- Full Name Field -->
            <div class="input-box">
                <input type="text" name="fullName" placeholder="Full Name" required>
                <i class='bx bxs-user-detail'></i>
            </div>
            
            <div class="input-box">
                <input type="text" name="cccd" placeholder="CCCD" required>
                <i class='bx bxs-id-card'></i>
            </div>
            
            <div class="input-box">
                <input type="email" name="email" placeholder="Email" required>
                <i class='bx bxs-envelope'></i>
            </div>
         
            <!-- Row for Date of Birth and Gender -->
            <div class="form-row">
                <div class="col input-box">
                    <input type="date" name="date" placeholder="Date of Birth" required>
                    <i class='bx bxs-calendar'></i>
                </div>
                <div class="col input-box gender">
                    <label>Gender:</label>
                    <div>
                        <input type="radio" id="male" name="gender" value="Male" required>
                        <label for="male">Male</label>
                        <input type="radio" id="female" name="gender" value="Female" required>
                        <label for="female">Female</label>
                    </div>
                </div>
            </div>

            <div class="input-box">
                <input type="text" name="address" placeholder="Address" required>
                <i class='bx bxs-map'></i>
            </div>

            <!-- Row for Username and Phone Number -->
            <div class="form-row">
                <div class="col input-box">
                    <input type="text" name="username" placeholder="Username" required>
                    <i class='bx bxs-user'></i>
                </div>
                <div class="col input-box">
                    <input type="tel" name="phoneNumber" placeholder="Phone Number" required>
                    <i class='bx bxs-phone'></i>
                </div>
            </div>

            <div class="input-box">
                <input type="password" name="password" placeholder="Password" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
            <div class="input-box">
                <input type="password" name="confirmPassword" placeholder="Confirm Password" required>
                <i class='bx bxs-lock'></i>
            </div>

            <button type="submit" class="btn">Register</button>
            
            <div class="login-link">
                <p>Already have an account? <a href="/project_web">Login</a></p>
            </div>
        </form>
    </div>
    
    <div class="modal fade animate__animated animate__zoomIn" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animate__animated animate__fadeInUp">
                <div class="modal-header">
                    <h5 class="modal-title" id="successModalLabel">Thông Báo</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <i class="fas fa-check-circle fa-3x text-success"></i>
                    <p style="margin-top: 20px;">Đăng ký thành công!</p>
                    <!-- Biểu tượng thành công -->
                    
                </div>
                <div class="modal-footer">
                	<form action="SignUpController" method="GET">
                	  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đăng nhập</button>
                	</form>
                  
                </div>
            </div>
        </div>
    </div>
    
    <script>
        function validatePassword(event) {
            const password = document.querySelector('input[name="password"]').value;
            const confirmPassword = document.querySelector('input[name="confirmPassword"]').value;

            if (password !== confirmPassword) {
                event.preventDefault(); // Ngăn form gửi đi
                alert("Passwords do not match! Please try again.");
                document.querySelector('input[name="confirmPassword"]').focus();
                return false;
            }
            return true;
        }
        window.onload = function () {
	        const urlParams = new URLSearchParams(window.location.search);
	        if (urlParams.get('SignUpSuccess') === 'true') {
	            // Hiển thị modal
	            const modal = new bootstrap.Modal(document.getElementById('successModal'));
	            modal.show();

	            // Reload trang khi modal đóng
	            const closeModalBtn = document.getElementById('closeModalBtn');
	            document.getElementById('successModal').addEventListener('hidden.bs.modal', function () {
	                window.location.href = '/project_web'; // Xóa tham số ratingSuccess
	            });

	            closeModalBtn.addEventListener('click', function () {
	                modal.hide();
	            });
	        }
	    };
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
