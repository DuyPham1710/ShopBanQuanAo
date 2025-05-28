package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
		HttpSession session = request.getSession();
		if (session.getAttribute("userId") == null) {
			response.sendRedirect("/project_web");
		}
		else {
			int maSP = 0; 
			String param = request.getParameter("maSP");
			// Validate input
			if (param == null || param.length() > 6 || !param.matches("\\d{1,6}")) {
			    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameter 'maSP'");
			    return;
			}
			try {
			    maSP = Integer.parseInt(param);
			} catch (NumberFormatException e) {
			    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parameter 'maSP' is not a valid number");
			    return;
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
				soSanPhamGioHang = SanPhamDAO.DemSoSanPhamTrongGioHang(conn, (int)session.getAttribute("userId"));
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
		HttpSession session = request.getSession();
		if (method == null || (!method.equals("get") && !method.equals("post"))) {
		    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid method");
		    return;
		}
		if (method.equals("get")) {
			doGet(request, response);
		}
		else {
			if (session.getAttribute("userId") == null) {
				response.sendRedirect("/project_web");
			}
			else {
				String redirect = request.getParameter("redirect");
				
				if (redirect.equals("buyNow")) {
					request.getRequestDispatcher("/ThanhToanController").forward(request, response);
				}
				else if (redirect.equals("addToCart")) {
					String maSPStr = request.getParameter("maSP");
					String maKichThuocStr = request.getParameter("size");
					String maMauSacStr = request.getParameter("tenmau");
					String soLuongStr = request.getParameter("soLuong");
					int maSP, maKichThuoc, maMauSac, soLuong;
					try {
						if (maSPStr == null || maKichThuocStr == null || maMauSacStr == null || soLuongStr == null ||
							maSPStr.length() > 6 || maKichThuocStr.length() > 6 || maMauSacStr.length() > 6 || soLuongStr.length() > 6) {
							response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input");
							return;
						}
						maSP = Integer.parseInt(maSPStr);
						maKichThuoc = Integer.parseInt(maKichThuocStr);
						maMauSac = Integer.parseInt(maMauSacStr);
						soLuong = Integer.parseInt(soLuongStr);
					} catch (NumberFormatException e) {
						response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format");
						return;
					}
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
						 GioHangDAO.ThemGioHang(conn, gh,(int)session.getAttribute("userId"));
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
