package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Account;
import models.NguoiDung;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;

import DAO.NguoiDungDAO;
import DBConnection.ConnectJDBC;
import Filters.InputSanitizer;

/**
 * Servlet implementation class SignUpController
 */
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/project_web");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Validate and sanitize input
		String fullName = request.getParameter("fullName");
		String cccd = request.getParameter("cccd");
        String email = request.getParameter("email");
        String dateOfBirthStr = request.getParameter("date");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");

        // Check null and length
        if (fullName == null || fullName.length() > 100 ||
            cccd == null || cccd.length() > 20 ||
            email == null || email.length() > 100 ||
            dateOfBirthStr == null || dateOfBirthStr.length() > 20 ||
            gender == null || gender.length() > 10 ||
            address == null || address.length() > 255 ||
            username == null || username.length() > 50 ||
            phoneNumber == null || phoneNumber.length() > 20 ||
            password == null || password.length() > 100) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input");
            return;
        }

        // Sanitize input
        fullName = InputSanitizer.sanitize(fullName);
        cccd = InputSanitizer.sanitize(cccd);
        email = InputSanitizer.sanitize(email);
        gender = InputSanitizer.sanitize(gender);
        address = InputSanitizer.sanitize(address);
        username = InputSanitizer.sanitize(username);
        phoneNumber = InputSanitizer.sanitize(phoneNumber);
        password = InputSanitizer.sanitize(password);

        java.sql.Date dateOfBirth = null;
		try {
			dateOfBirth = java.sql.Date.valueOf(dateOfBirthStr);
		} catch (IllegalArgumentException  e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid date format");
			return;
		}
        
        if ("Male".equals(gender)) {
        	gender = "Nam";
		} else if ("Female".equals(gender)) {
			gender = "Nữ";
		}
        
        Connection conn = null;
		try {
			conn = new ConnectJDBC().getConnection();
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		Account account = new Account(username, password);
		NguoiDung nguoiDung = new NguoiDung(account, cccd, fullName, gender, phoneNumber, dateOfBirth, email);
		
		try {
			NguoiDungDAO.DangKy(conn, nguoiDung, address);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		response.sendRedirect("/project_web/views/SignUp.jsp?SignUpSuccess=true");
	}

}
