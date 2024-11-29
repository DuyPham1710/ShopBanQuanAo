package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		if (ID != 0) {
		//	request.getRequestDispatcher("/views/home.jsp").forward(request, response);
			if (ID == 1) {
				response.sendRedirect("/project_web/views/Admin.jsp");
			}
			else {
				response.sendRedirect("/project_web/views/home.jsp");
			}		
		}
		else {
			response.sendRedirect("/project_web");
        }
	}

}
