package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.DanhMucSanPham;
import models.SanPham;

import java.io.IOException;
import java.sql.Connection;
import java.util.Arrays;
import java.util.List;

import DAO.AccountDAO;
import DAO.SanPhamDAO;
import DBConnection.ConnectJDBC;

public class SanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private int maDanhMuc = 0;
    private String searchText = "";
    
    public SanPhamController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("userId") == null) {
			response.sendRedirect("/project_web");
		}
		else{
			Connection conn = null;
			try {
				conn = new ConnectJDBC().getConnection();
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			if (request.getParameter("searchText") != null) {
				searchText = request.getParameter("searchText");
			}
			else {
				searchText = "";
			}
			
			if (request.getParameter("maDanhMuc") == null) {
				maDanhMuc = 0;
			}
			else {			
				maDanhMuc = Integer.parseInt(request.getParameter("maDanhMuc"));
			}
			
			int sortType = 0; // Default: Sản phẩm nổi bật
			if (request.getParameter("sortType") != null) {
				sortType = Integer.parseInt(request.getParameter("sortType"));
			}
			SanPhamDAO.resetFilters();
			List<SanPham> listSP = null;
			try {
				listSP = SanPhamDAO.DanhSachSP(conn, maDanhMuc, sortType, searchText);
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
				
			}
		
			List<DanhMucSanPham> listDanhMuc = null;
			try {
				listDanhMuc = SanPhamDAO.DanhSachDanhMucSP(conn);
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			List<String> listMauHex = null;
			try {
				listMauHex = SanPhamDAO.DanhSachMaMauHex(conn);
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			List<String> listAllSize = null;
			try {
				listAllSize = SanPhamDAO.ListAllSize(conn);
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
			request.setAttribute("ListSP", listSP);
			request.setAttribute("ListDanhMuc", listDanhMuc);
			request.setAttribute("listMauHex", listMauHex);
			request.setAttribute("listAllSize", listAllSize);
			
			RequestDispatcher req = request.getRequestDispatcher("/views/SanPhamPage.jsp");
			req.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		if (request.getHeader("_method") != null) {
		    doPut(request, response);
		    return;
		}
		SanPhamDAO.resetFilters();
		String giaHienTai = request.getParameter("giaHienTai");
	    List<SanPham> listSP = null;
	    
	    if (giaHienTai != null) {
	    	Connection conn = null;
			try {
				conn = new ConnectJDBC().getConnection();
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			try {
				switch (giaHienTai) {
	            case "0-300000":
	            	listSP = SanPhamDAO.filterByPrice(conn, 0, 300000);
	                break;
	            case "300000-500000":
	            	listSP = SanPhamDAO.filterByPrice(conn, 300000, 500000);
	                break;
	            case "500000-700000":
	            	listSP = SanPhamDAO.filterByPrice(conn, 500000, 700000);
	                break;
	            case "700000-1000000":
	            	listSP = SanPhamDAO.filterByPrice(conn, 700000, 1000000);
	                break;
	            case "1000000+":
	            	listSP = SanPhamDAO.filterByPrice(conn, 1000001, Integer.MAX_VALUE);
	                break;
	            default:
	                // Không có điều kiện lọc giá
	            	listSP = SanPhamDAO.DanhSachSP(conn, maDanhMuc, 0, searchText);
	                break;
				}
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
	        
	    } 
	    else {
	    	doGet(request, response);
	    }
	    
	    Connection conn = null;
		try {
			conn = new ConnectJDBC().getConnection();
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
	    List<DanhMucSanPham> listDanhMuc = null;
		try {
			listDanhMuc = SanPhamDAO.DanhSachDanhMucSP(conn);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		List<String> listMauHex = null;
		try {
			listMauHex = SanPhamDAO.DanhSachMaMauHex(conn);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		List<String> listAllSize = null;
		try {
			listAllSize = SanPhamDAO.ListAllSize(conn);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		request.setAttribute("ListSP", listSP);
		request.setAttribute("ListDanhMuc", listDanhMuc);
		request.setAttribute("listMauHex", listMauHex);
		request.setAttribute("listAllSize", listAllSize);
		
		RequestDispatcher req = request.getRequestDispatcher("/views/SanPhamPage.jsp");
		req.forward(request, response);
		
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		Connection conn = null;
		try {
			conn = new ConnectJDBC().getConnection();
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		if (request.getHeader("_method").equals("LocMau")) {
			String colorsParam = request.getHeader("X-colorsParam");
			SanPhamDAO.selectedColors = Arrays.asList(colorsParam.split(","));
		}
		else {
			String sizesParam = request.getHeader("X-sizesParam");
			SanPhamDAO.selectedSizes = Arrays.asList(sizesParam.split(","));        
		}
		
		List<SanPham> listSPLocTheoMau = null;
		try {
			listSPLocTheoMau = SanPhamDAO.LocSPTheoMauVaSize(conn);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
			
		}
		request.setAttribute("ListSP", listSPLocTheoMau);
		
	    RequestDispatcher req = request.getRequestDispatcher("/views/SanPham.jsp");
	    req.include(request, response);

	}
}
