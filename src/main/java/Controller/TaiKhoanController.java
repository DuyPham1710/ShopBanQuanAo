package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.NguoiDung;

import java.io.IOException;
import java.sql.Connection;

import DAO.NguoiDungDAO;
import DBConnection.ConnectJDBC;

public class TaiKhoanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TaiKhoanController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		try {
			conn = new ConnectJDBC().getConnection();
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		NguoiDung nguoiDung = null;
		try {
			nguoiDung = NguoiDungDAO.ThongTinCaNhan(conn);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		request.setAttribute("nguoiDung", nguoiDung);
		
		RequestDispatcher req = request.getRequestDispatcher("/views/taiKhoan.jsp");
		req.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
