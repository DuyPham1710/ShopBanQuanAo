package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.DanhGia;
import models.GioHang;
import models.KichCo;
import models.MauSac;
import models.SanPham;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import DAO.AccountDAO;
import DAO.DanhGiaDAO;
import DAO.GioHangDAO;
import DAO.SanPhamDAO;
import DBConnection.ConnectJDBC;


public class ChiTietSPController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ChiTietSPController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (AccountDAO.getID() == 0) {
			response.sendRedirect("/project_web");
		}
		else {
			int maSP = 0; 
            if (request.getParameter("maSP") != null) {
            	maSP = Integer.parseInt(request.getParameter("maSP"));
            }
		
		    Connection conn = null;
			try {
				conn = new ConnectJDBC().getConnection();
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			SanPham sp = null;
			try {
				sp = SanPhamDAO.layThongTinSP(conn, maSP);
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			List<MauSac> listMau = null;
			try {
				listMau = SanPhamDAO.layMauSP(conn, maSP);
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			List<KichCo> listSize = null;
			try {
				listSize = SanPhamDAO.laySizeSP(conn, maSP);
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			sp.setMauSac(listMau);
			sp.setKichCo(listSize);
			
			List<SanPham> listSPTuongTu = null;
			try {
				listSPTuongTu = SanPhamDAO.DanhSachSPTuongTu(conn, sp.getMaSP(), sp.getDanhMuc().getMaDanhMuc());
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			List<DanhGia> listDanhGia = null;
			try {
				listDanhGia = DanhGiaDAO.LoadDanhSachDanhGiaMotSP(conn);
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
			
			request.setAttribute("sp", sp);
			request.setAttribute("listDanhGia", listDanhGia);
			request.setAttribute("ListSPTuongTu", listSPTuongTu);
			
			RequestDispatcher req = request.getRequestDispatcher("/views/ChiTietSP.jsp");
			req.forward(request, response);
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
	
		if (method.equals("get")) {
			doGet(request, response);
		}
		else {
			if (AccountDAO.getID() == 0) {
				response.sendRedirect("/project_web");
			}
			else {
				String redirect = request.getParameter("redirect");
				
				if (redirect.equals("buyNow")) {
					//response.sendRedirect("/project_web/ThanhToanController");
					request.getRequestDispatcher("/ThanhToanController").forward(request, response);
				}
				else if (redirect.equals("addToCart")) {
					int maSP = Integer.parseInt(request.getParameter("maSP"));
					int maKichThuoc = Integer.parseInt(request.getParameter("size"));
					int maMauSac = Integer.parseInt(request.getParameter("tenmau"));
					int soLuong = Integer.parseInt(request.getParameter("soLuong"));
					 Connection conn = null;
					 try {
						 conn = new ConnectJDBC().getConnection();
					 }
					 catch (Exception e) {
						 e.printStackTrace();
						 response.getWriter().println("Error: " + e.getMessage());
					 }
					 
					 SanPham sp = new SanPham(maSP, maKichThuoc, maMauSac);
					 GioHang gh = new GioHang(sp, soLuong);
					 try {
						 GioHangDAO.ThemGioHang(conn, gh);
						 Thread.sleep(2000);
						 
					 }
					 catch (Exception e) {
						 e.printStackTrace();
						 response.getWriter().println("Error: " + e.getMessage());
					 }
					 doGet(request, response);
				}
				
			}
			
		}
	}

}
