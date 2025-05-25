package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
		HttpSession session = request.getSession();
		if (session.getAttribute("userId") == null) {
			response.sendRedirect("/project_web");
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
				nguoiDung = NguoiDungDAO.LayThongTinNguoiDung(conn, (int)session.getAttribute("userId"));
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			String redirect = request.getParameter("redirect");
			List<GioHang> listGH = null;
			String CacSanPhamDuocChon="";
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
				
				String cacSanPhamChon = request.getParameter("listSPCheck");
				CacSanPhamDuocChon = cacSanPhamChon;
				String[] listMa = cacSanPhamChon.split(",");
				if (request.getParameter("totalTemp") != null) {
	                totalTemp = Integer.parseInt(request.getParameter("totalTemp"));
	            }
	            if (totalTemp > 0) {
        			try {
        				listGH = GioHangDAO.DanhSachGioHangThanhToan(conn,listMa,(int)session.getAttribute("userId"));
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
			request.setAttribute("CacSanPhamDuocChon", CacSanPhamDuocChon);
			RequestDispatcher req = request.getRequestDispatcher("/views/ThanhToan.jsp");
			req.forward(request, response);
        }
            		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		HttpSession session = request.getSession();
		if (session.getAttribute("userId") == null) {
			response.sendRedirect("/project_web");
		}
		else {
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
					maHoaDon = ThanhToanDAO.ThemHoaDon(conn, tongTienHoaDon, diaChi, (int)session.getAttribute("userId"));
					NguoiDungDAO.themDiaChiNhanHang(conn, diaChi, (int)session.getAttribute("userId"));
				}
				catch (Exception e) {
					e.printStackTrace();
					response.getWriter().println("Error: " + e.getMessage());
				}
				
				List<GioHang> listGH = new ArrayList<GioHang>();
				
				if (redirect.equals("1_San_Pham")) {
//					int maSP = Integer.parseInt(request.getParameter("maSP"));
//					int maKichCo = Integer.parseInt(request.getParameter("maKichCo"));
//					int maMauSac = Integer.parseInt(request.getParameter("maMau"));
//					int soLuong1SP = Integer.parseInt(request.getParameter("soLuong1SP"));
					int maSP = 0, maKichCo = 0, maMauSac = 0, soLuong1SP = 1;
					String paramMaSP = request.getParameter("maSP");
					if (paramMaSP == null || paramMaSP.length() > 6 || !paramMaSP.matches("\\d{1,6}")) {
					    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameter 'maSP'");
					    return;
					}
					try {
					    maSP = Integer.parseInt(paramMaSP);
					} catch (NumberFormatException e) {
					    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parameter 'maSP' is not a valid number");
					    return;
					}

					String paramKichCo = request.getParameter("maKichCo");
					if (paramKichCo == null || paramKichCo.length() > 4 || !paramKichCo.matches("\\d{1,4}")) {
					    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameter 'maKichCo'");
					    return;
					}
					try {
					    maKichCo = Integer.parseInt(paramKichCo);
					} catch (NumberFormatException e) {
					    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parameter 'maKichCo' is not a valid number");
					    return;
					}

					String paramMau = request.getParameter("maMau");
					if (paramMau == null || paramMau.length() > 4 || !paramMau.matches("\\d{1,4}")) {
					    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameter 'maMau'");
					    return;
					}
					try {
					    maMauSac = Integer.parseInt(paramMau);
					} catch (NumberFormatException e) {
					    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parameter 'maMau' is not a valid number");
					    return;
					}

					String paramSoLuong = request.getParameter("soLuong1SP");
					if (paramSoLuong == null || paramSoLuong.length() > 3 || !paramSoLuong.matches("\\d{1,3}")) {
					    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameter 'soLuong1SP'");
					    return;
					}
					try {
					    soLuong1SP = Integer.parseInt(paramSoLuong);
					    if (soLuong1SP <= 0 || soLuong1SP > 100) {
					        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Số lượng không hợp lệ.");
					        return;
					    }
					} catch (NumberFormatException e) {
					    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parameter 'soLuong1SP' is not a valid number");
					    return;
					}
					
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
					String CacSanPhamDuocChon = request.getParameter("CacSanPhamDuocChon");
					String[] listMa = CacSanPhamDuocChon.split(",");
					try {
	    				listGH = GioHangDAO.DanhSachGioHangThanhToan(conn,listMa,(int)session.getAttribute("userId"));
	    			}
	    			catch (Exception e) {
	    				e.printStackTrace();
	    				response.getWriter().println("Error: " + e.getMessage());
	    			}
				}
				
				for (int i=0; i<listGH.size(); i++) {
					try {
						ThanhToanDAO.ThemChiTietHoaDon(conn, listGH.get(i), maHoaDon, (int)session.getAttribute("userId"));
					}
					catch (Exception e) {
						e.printStackTrace();
	    				response.getWriter().println("Error: " + e.getMessage());
					}
				}
			//	response.sendRedirect("/project_web/Donhang");
			
//				RequestDispatcher req = request.getRequestDispatcher("/views/ThanhToan.jsp");
//				req.forward(request, response);
				// request.setAttribute("paymentSuccess", "true");

			        // Chuyển tiếp tới trang ThanhToan.jsp
			        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/CheckOut.jsp");
			        dispatcher.forward(request, response);
			}
		}

	}

}
