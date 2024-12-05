package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.ChiTietHoaDon;
import models.DanhGia;
import models.DonMua;
import models.NguoiDung;
import models.SanPham;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import DAO.AccountDAO;
import DAO.DanhGiaDAO;
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
			
			
			if ("Đã giao".equals(trangThai)) {
				List<DanhGia> listDanhGia = null;
				try {
					listDanhGia = DanhGiaDAO.DanhSachDanhGia(conn);
				}
				catch (Exception e) {
					e.printStackTrace();
					response.getWriter().println("Error: " + e.getMessage());
					
				}
				request.setAttribute("listDanhGia", listDanhGia);
			}
			request.setAttribute("DanhSachDonHang", DanhSachDonHang);
			RequestDispatcher req = request.getRequestDispatcher("/views/DonHang.jsp");
			req.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("method") != null && request.getParameter("method").equals("Put")) {
			doPut(request, response);
			return;
		} 
		
		int maHoaDon = Integer.parseInt(request.getHeader("X-MaHoaDon"));
		
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
		
		DonMua donMua = null;
		try {
			donMua = DonHangDAO.LoadThongTinMotDonHang(conn, maHoaDon);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}

		request.setAttribute("nguoiDung", nguoiDung);
		request.setAttribute("donMua", donMua);
		
		RequestDispatcher req = request.getRequestDispatcher("/views/ChiTietDonHang.jsp");
		req.include(request, response);
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maSP = 0;
		if (request.getParameter("maSP") != null) {
			maSP = Integer.parseInt(request.getParameter("maSP"));
		}
		
		int maChiTiet = 0;
		if (request.getParameter("maChiTiet") != null) {
			maChiTiet = Integer.parseInt(request.getParameter("maChiTiet"));
		}
		
		String comment = request.getParameter("comment");
	    int rating = 0;
	    if (request.getParameter("rating") != null) {
	        rating = Integer.parseInt(request.getParameter("rating"));
	    }
	    boolean isSuccess = false; 
	    
		Connection conn = null;
		try {
			conn = new ConnectJDBC().getConnection();
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
	//	System.out.println(maSP + " " + maChiTiet + " " + comment + " " + rating);
		try {
			isSuccess = DanhGiaDAO.danhGiaSanPham(conn, maSP, maChiTiet, comment, rating);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
	
		if (isSuccess) {
		    response.sendRedirect("DonHang?ratingSuccess=true");
		} else {
		    doGet(request, response);
		}
	}
	
}
