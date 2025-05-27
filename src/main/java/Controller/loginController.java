package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Account;
import models.SanPham;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import DAO.AccountDAO;
import DBConnection.ConnectJDBC;

public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public loginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();
		final int MAX_ATTEMPTS = 5;
		final int LOCK_TIME = 5 * 60 * 1000; // 5 phút (ms)

		Integer failedAttempts = (Integer) session.getAttribute("failedAttempts");
		Long lockTime = (Long) session.getAttribute("lockTime");
		if (failedAttempts == null) failedAttempts = 0;

		// Kiểm tra nếu đang bị khóa
		if (lockTime != null) {
			long now = System.currentTimeMillis();
			if (now - lockTime < LOCK_TIME) {
				System.out.println("[SECURITY] User " + username + " bị khóa đăng nhập tạm thời.");
				response.sendRedirect("/project_web?error=locked");
				return;
			} else {
				// Hết thời gian khóa, reset
				session.removeAttribute("lockTime");
				session.setAttribute("failedAttempts", 0);
				failedAttempts = 0;
			}
		}
		
		Connection conn = null;
		try {
			conn = new ConnectJDBC().getConnection();
		}
		catch (Exception e) {
			e.printStackTrace();
			
		}
		
		Account acountBean = new Account(username, password);
		int ID = 0;
		try {
			ID = AccountDAO.Validate(conn, acountBean);
			session.setAttribute("userId", ID);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		if (ID != 0) {
			// Đăng nhập thành công, reset số lần sai
			session.setAttribute("failedAttempts", 0);
			if (ID == 1) {
				response.sendRedirect("/project_web/TrangChuADController");
			}
			else {
				response.sendRedirect("/project_web/views/home.jsp");
			}		
		}
		else {
			// Đăng nhập sai
			failedAttempts++;
			session.setAttribute("failedAttempts", failedAttempts);
			System.out.println("[SECURITY] Đăng nhập sai cho user: " + username + ". Số lần sai: " + failedAttempts);
			if (failedAttempts >= MAX_ATTEMPTS) {
				session.setAttribute("lockTime", System.currentTimeMillis());
				System.out.println("[SECURITY] User " + username + " bị khóa đăng nhập 5 phút do sai quá nhiều lần.");
				response.sendRedirect("/project_web?error=locked");
			} else {
				response.sendRedirect("/project_web?error=login");
			}
		}
	}

}
