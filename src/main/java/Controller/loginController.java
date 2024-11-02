package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Account;
import models.actBean;

import java.io.IOException;

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
		
		Account acountBean = new Account(username, password);
		int valid = acountBean.validate();
		if (valid != 0) {
		//	request.getRequestDispatcher("/views/home.jsp").forward(request, response);
			if (valid == 1) {
				response.sendRedirect("/project_web/views/Admin.jsp");
			}
			else {
				response.sendRedirect("/project_web/views/home.jsp");
			}		
		}
		else {
			response.sendRedirect("/project_web/views/login.jsp");
        }
	}

}
