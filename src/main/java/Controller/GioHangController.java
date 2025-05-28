package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.GioHang;
import models.SanPham;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
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
		HttpSession session = request.getSession();
		if (session.getAttribute("userId") == null) {
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
			
			List<GioHang> listGH = null;
			try {
				listGH = GioHangDAO.DanhSachGioHang(conn,(int)session.getAttribute("userId"));
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			int totalTemp = 0;
			for (int i=0; i<listGH.size(); i++) {
				totalTemp += (listGH.get(i).getSanPham().getGiaHienTai() * listGH.get(i).getSoLuongGH());
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
			
			request.setAttribute("ListGH", listGH);
			request.setAttribute("totalTemp", totalTemp);
	    	
			RequestDispatcher req = request.getRequestDispatcher("/views/GioHang.jsp");
			req.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("_method");
		if ("DELETE".equalsIgnoreCase(method)) {
			doDelete(request, response);
		}
		else if("capNhatGioHang".equalsIgnoreCase(method)) {
			doCapNhatGioHang(request, response);
		}
		
	}
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// Validate and parse input safely
			String maSPStr = request.getParameter("maSP");
			String maKichThuocStr = request.getParameter("maKichThuoc");
			String maMauStr = request.getParameter("maMau");
			int maSP, maKichThuoc, maMau;
			try {
				if (maSPStr == null || maKichThuocStr == null || maMauStr == null ||
					maSPStr.length() > 10 || maKichThuocStr.length() > 10 || maMauStr.length() > 10) {
					response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input");
					return;
				}
				maSP = Integer.parseInt(maSPStr);
				maKichThuoc = Integer.parseInt(maKichThuocStr);
				maMau = Integer.parseInt(maMauStr);
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
					
			try {
				GioHangDAO.XoaGioHang(conn, maSP, maKichThuoc, maMau);
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			doGet(request, response);
		}
		protected void doCapNhatGioHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			if(session.getAttribute("userId") != null) {
				String maSPStr = request.getParameter("id");
				String phanbiet = request.getParameter("phanbiet");
				String maKichThuocStr = request.getParameter("sizeoption");
				String maMauStr = request.getParameter("coloroption");
				String quantityStr = request.getParameter("quantity");
				int maSP, maKichThuoc, maMau, quantity;
				try {
					if (maSPStr == null || maKichThuocStr == null || maMauStr == null || quantityStr == null ||
						maSPStr.length() > 10 || maKichThuocStr.length() > 10 || maMauStr.length() > 10 || quantityStr.length() > 10) {
						response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input");
						return;
					}
					maSP = Integer.parseInt(maSPStr);
					maKichThuoc = Integer.parseInt(maKichThuocStr);
					maMau = Integer.parseInt(maMauStr);
					quantity = Integer.parseInt(quantityStr);
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
				
				models.SanPham sp = new models.SanPham(maSP, maKichThuoc, maMau);
				models.GioHang item = new models.GioHang(sp, quantity );
				try {
					GioHangDAO.ThemGioHang(conn, item, (int)session.getAttribute("userId"));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("{\"message\": \"" + "Thêm vào giỏ hàng thành công"+ "\"}");
			}
			else {
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
	}
