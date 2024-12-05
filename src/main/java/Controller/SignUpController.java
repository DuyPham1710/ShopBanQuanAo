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
		String fullName = request.getParameter("fullName");
		String cccd = request.getParameter("cccd");
        String email = request.getParameter("email");
        String dateOfBirthStr = request.getParameter("date");
        Date dateOfBirth = null;
		try {
			dateOfBirth = java.sql.Date.valueOf(dateOfBirthStr);
		} catch (IllegalArgumentException  e) {
			e.printStackTrace();
		};
        
        String gender = request.getParameter("gender");
        if ("Male".equals(gender)) {
        	gender = "Nam";
		} else if ("Female".equals(gender)) {
			gender = "Nữ";
		}
        
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");

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
//		request.setAttribute("success", "Đăng ký thành công!");
//		request.getRequestDispatcher("/views/SignUp.jsp").forward(request, response);
	//	response.sendRedirect("/project_web");
		response.sendRedirect("/project_web/views/SignUp.jsp?SignUpSuccess=true");
	}

}
