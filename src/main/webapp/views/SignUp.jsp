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
</head>
<body>
    <div class="wrapper">
        <form action="">
            <h1>Register</h1>
            
            <!-- Full Name Field -->
            <div class="input-box">
                <input type="text" placeholder="Full Name" required>
                <i class='bx bxs-user-detail'></i>
            </div>
            
            <div class="input-box">
                <input type="email" placeholder="Email" required>
                <i class='bx bxs-envelope'></i>
            </div>
         
            <!-- Row for Date of Birth and Gender -->
            <div class="form-row">
                <div class="col input-box">
                    <input type="date" placeholder="Date of Birth" required>
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
                <input type="text" placeholder="Address" required>
                <i class='bx bxs-map'></i>
            </div>

            <!-- Row for Username and Phone Number -->
            <div class="form-row">
                <div class="col input-box">
                    <input type="text" placeholder="Username" required>
                    <i class='bx bxs-user'></i>
                </div>
                <div class="col input-box">
                    <input type="tel" placeholder="Phone Number" required>
                    <i class='bx bxs-phone'></i>
                </div>
            </div>

            <div class="input-box">
                <input type="password" placeholder="Password" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Confirm Password" required>
                <i class='bx bxs-lock'></i>
            </div>

            <button type="submit" class="btn">Register</button>
            
            <div class="login-link">
                <p>Already have an account? <a href="/project_web">Login</a></p>
            </div>
        </form>
    </div>
</body>
</html>
