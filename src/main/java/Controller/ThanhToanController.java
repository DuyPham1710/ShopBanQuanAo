package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.GioHang;
import models.KichCo;
import models.MauSac;
import models.NguoiDung;
import models.SanPham;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DAO.AccountDAO;
import DAO.DiaChiDAO;
import DAO.GioHangDAO;
import DAO.NguoiDungDAO;
import DAO.SanPhamDAO;
import DAO.ThanhToanDAO;
import DBConnection.ConnectJDBC;

public class ThanhToanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ThanhToanController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (AccountDAO.getID() == 0) {
			response.sendRedirect("/project_web/views/login.jsp");
		}
		else {
			int totalTemp = 0; 
            
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
				nguoiDung = NguoiDungDAO.LayThongTinNguoiDung(conn);
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			String redirect = request.getParameter("redirect");
			List<GioHang> listGH = null;
			
			if (redirect.equals("buyNow")) {
				int maSP = Integer.parseInt(request.getParameter("maSP"));
				int maKichThuoc = Integer.parseInt(request.getParameter("size"));
				int maMauSac = Integer.parseInt(request.getParameter("tenmau"));
				int soLuong = Integer.parseInt(request.getParameter("soLuong"));
				SanPham sp = null;
				GioHang gh = null;
				
				try {
					sp = SanPhamDAO.layThongTinSPThanhToan(conn, maSP, maKichThuoc, maMauSac);
					gh = new GioHang(sp, soLuong);
				} 
				catch (SQLException e) {
					e.printStackTrace();
				}
				
				listGH = new ArrayList<GioHang>();
				listGH.add(gh);
				totalTemp = soLuong * sp.getGiaHienTai();
			}
			else if (redirect.equals("cart")) {
				if (request.getParameter("totalTemp") != null) {
	                totalTemp = Integer.parseInt(request.getParameter("totalTemp"));
	            }
	            if (totalTemp > 0) {
        			try {
        				listGH = GioHangDAO.DanhSachGioHang(conn);
        			}
        			catch (Exception e) {
        				e.printStackTrace();
        				response.getWriter().println("Error: " + e.getMessage());
        			}
    			}
	            else {
	            	response.sendRedirect("/project_web/GioHangController"); 			
	            }	
			}
			
			request.setAttribute("ListGH", listGH);
			request.setAttribute("totalTemp", totalTemp);
			request.setAttribute("nguoiDung", nguoiDung);
			
			RequestDispatcher req = request.getRequestDispatcher("/views/ThanhToan.jsp");
			req.forward(request, response);
        }
            		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String redirect = request.getParameter("redirect");
		if (redirect.equals("cart") || redirect.equals("buyNow")) {
			doGet(request, response);
		}
		else{
			int tongTienHoaDon = Integer.parseInt(request.getParameter("tongTienHoaDon"));
			String diaChi = request.getParameter("selectedAddress");
			int maHoaDon = 0;
			Connection conn = null;
			try {
				conn = new ConnectJDBC().getConnection();
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			try {
				maHoaDon = ThanhToanDAO.ThemHoaDon(conn, tongTienHoaDon, diaChi);
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			List<GioHang> listGH = new ArrayList<GioHang>();
			
			if (redirect.equals("1_San_Pham")) {
				int maSP = Integer.parseInt(request.getParameter("maSP"));
				int maKichCo = Integer.parseInt(request.getParameter("maKichCo"));
				int maMauSac = Integer.parseInt(request.getParameter("maMau"));
				int soLuong1SP = Integer.parseInt(request.getParameter("soLuong1SP"));
				
				try {
					SanPham sp = new SanPham(maSP, maKichCo, maMauSac);
					sp.setGiaHienTai((tongTienHoaDon - 30000) / soLuong1SP);
					GioHang gh = new GioHang(sp, soLuong1SP);
					listGH.add(gh);
				}
				catch (Exception e) {
					e.printStackTrace();
					response.getWriter().println("Error: " + e.getMessage());
				}
			}
			else if (redirect.equals("Nhieu_Hon_1_San_Pham")) {
				try {
    				listGH = GioHangDAO.DanhSachGioHang(conn);
    			}
    			catch (Exception e) {
    				e.printStackTrace();
    				response.getWriter().println("Error: " + e.getMessage());
    			}
			}
			
			for (int i=0; i<listGH.size(); i++) {
				try {
					ThanhToanDAO.ThemChiTietHoaDon(conn, listGH.get(i), maHoaDon);
				}
				catch (Exception e) {
					e.printStackTrace();
    				response.getWriter().println("Error: " + e.getMessage());
				}
			}
			response.sendRedirect("/project_web/views/home.jsp");
		}
		
	}

}
