package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.GioHang;
import models.SanPham;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import DAO.AccountDAO;
import DAO.GioHangDAO;
import DAO.SanPhamDAO;
import DBConnection.ConnectJDBC;

public class GioHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GioHangController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (AccountDAO.getID() == 0) {
			response.sendRedirect("/project_web/views/login.jsp");
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
			
			List<GioHang> listGH = null;
			try {
				listGH = GioHangDAO.DanhSachGioHang(conn);
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			int totalTemp = 0;
			for (int i=0; i<listGH.size(); i++) {
				totalTemp += (listGH.get(i).getSanPham().getGiaHienTai() * listGH.get(i).getSoLuongGH());
			}
			
			request.setAttribute("ListGH", listGH);
			request.setAttribute("totalTemp", totalTemp);
	    	
			RequestDispatcher req = request.getRequestDispatcher("/views/GioHang.jsp");
			req.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maSP = Integer.parseInt(request.getParameter("maSP"));
		int maKichThuoc = Integer.parseInt(request.getParameter("maKichThuoc"));
		int maMau = Integer.parseInt(request.getParameter("maMau"));
		
		Connection conn = null;
		try {
			conn = new ConnectJDBC().getConnection();
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		
		}
				
		try {
			GioHangDAO.XoaGioHang(conn, maSP, maKichThuoc, maMau);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		doGet(request, response);
	}

}
