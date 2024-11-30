package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.ChiTietHoaDon;
import models.DonMua;
import models.NguoiDung;
import models.SanPham;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import DAO.AccountDAO;
import DAO.DonHangDAO;
import DAO.NguoiDungDAO;
import DAO.SanPhamDAO;
import DBConnection.ConnectJDBC;

public class DonHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DonHang() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (AccountDAO.getID() == 0) {
			response.sendRedirect("/project_web");
		}
		else {
			String trangThai = request.getParameter("trangThai");
			Connection conn = null;
			try {
				conn = new ConnectJDBC().getConnection();
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			List<DonMua> DanhSachDonHang = null;
			try {
				DanhSachDonHang = DonHangDAO.DanhSachDonHang(conn, trangThai);
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
				
			}
			
			request.setAttribute("DanhSachDonHang", DanhSachDonHang);
			RequestDispatcher req = request.getRequestDispatcher("/views/DonHang.jsp");
			req.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("aaa");
		int maHoaDon = Integer.parseInt(request.getParameter("id"));	
	//	int maHoaDon = 6;
		
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
			nguoiDung = NguoiDungDAO.LayThongTinNguoiDung_DonHang(conn, maHoaDon);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		List<ChiTietHoaDon> listChiTietHD = null;
		try {
			listChiTietHD = DonHangDAO.LoadThongTinMotDonHang(conn, maHoaDon);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		System.out.print("QUa Được đây");
		request.setAttribute("nguoiDung", nguoiDung);
		request.setAttribute("listChiTietHD", listChiTietHD);
		RequestDispatcher req = request.getRequestDispatcher("/views/ChiTietDonHang.jsp");
		req.include(request, response);
	//	response.getWriter().write("<div>Test Content</div>");
	}

}
