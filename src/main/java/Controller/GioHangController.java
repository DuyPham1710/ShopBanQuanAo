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

import DAO.GioHangDAO;
import DAO.SanPhamDAO;
import DBConnection.ConnectJDBC;

public class GioHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GioHangController() {
        super();
        // TODO Auto-generated constructor stub
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
		
		List<GioHang> listGH = null;
		try {
			listGH = GioHangDAO.DanhSachGioHang(conn);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		request.setAttribute("ListGH", listGH);
    	
		RequestDispatcher req = request.getRequestDispatcher("/views/GioHang.jsp");
		req.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maSP = Integer.parseInt(request.getParameter("maSP"));
		Connection conn = null;
		try {
			conn = new ConnectJDBC().getConnection();
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
			//System.out.println("maSP = " + maSP);
		}
		
		
		try {
			GioHangDAO.XoaGioHang(conn, maSP);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		//	System.out.println("maSP = " + maSP);
		}
		doGet(request, response);
	}

}
