package Controller;

import jakarta.servlet.RequestDispatcher;
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

import DAO.AccountDAO;
import DAO.NguoiDungDAO;
import DAO.SanPhamDAO;
import DBConnection.ConnectJDBC;

public class TaiKhoanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TaiKhoanController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (AccountDAO.getID() == 0) {
			response.sendRedirect("/project_web");
		}
		else {
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
			
			int soSanPhamGioHang = 0;
			
			try {
				soSanPhamGioHang = SanPhamDAO.DemSoSanPhamTrongGioHang(conn, AccountDAO.getID());
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			request.setAttribute("soSanPhamGioHang", soSanPhamGioHang);
			request.setAttribute("nguoiDung", nguoiDung);
			
			RequestDispatcher req = request.getRequestDispatcher("/views/taiKhoan.jsp");
			req.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String hoTen = request.getParameter("hoTen");
		String ngaySinhStr = request.getParameter("ngaySinh"); 

	    Date ngaySinh = null;
		try {
			ngaySinh = java.sql.Date.valueOf(ngaySinhStr);
		} catch (IllegalArgumentException  e) {
			e.printStackTrace();
		};
	  
		String gioiTinh = request.getParameter("gender");
		if ("male".equals(gioiTinh)) {
		    gioiTinh = "Nam";
		} else if ("female".equals(gioiTinh)) {
		    gioiTinh = "Nữ";
		}
		String email = request.getParameter("email");
		String sdt = request.getParameter("sdt");
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
		NguoiDung nguoiDung = new NguoiDung(account, "", hoTen, gioiTinh, sdt, ngaySinh, email);
		
		try {
			NguoiDungDAO.suaThongTin(conn, nguoiDung);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		doGet(request, response);
	}
}
