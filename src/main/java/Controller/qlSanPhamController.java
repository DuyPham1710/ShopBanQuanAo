package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.DanhMucSanPham;
import models.SanPham;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.Collections;
import java.util.List;

import DAO.SanPhamDAO;
import DBConnection.ConnectJDBC;

/**
 * Servlet implementation class qlSanPhamController
 */
public class qlSanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LocalDate today = LocalDate.now();
	private int year = today.getYear();
	private int masp=0;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public qlSanPhamController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		try {
			conn = new ConnectJDBC().getConnection();
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		List<SanPham> listSP = null;
		try {
			listSP = SanPhamDAO.DanhSachSP(conn, 0, 0, "");
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
		
		int sanPhamDaBan=0, sanPhamTonKho=0;
		try {
			String sql = "SELECT * FROM fn_ThongKeSanPham()";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				sanPhamDaBan = rs.getInt("TongSanPhamDaBan");
				sanPhamTonKho = rs.getInt("TongSanPhamTonKho");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		List<SanPham> listBanChay = null;
		try {
			listBanChay = SanPhamDAO.DanhSachBanChay(conn,year);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		List<Integer> thongKeTungThang = null;
		try {
			thongKeTungThang = SanPhamDAO.ThongKeBanDuocTrongNam(conn,year);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		
		request.setAttribute("DaBan", sanPhamDaBan);
		request.setAttribute("TonKho", sanPhamTonKho);
		request.setAttribute("ListDanhMuc", listDanhMuc);
		request.setAttribute("ListSP", listSP);
		request.setAttribute("ListBanChay", listBanChay);
		request.setAttribute("ThongKeTungThang", thongKeTungThang);
		request.setAttribute("Nam", year);
		
		RequestDispatcher req = request.getRequestDispatcher("/views/admin/QuanLySP.jsp");
		req.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String method = request.getParameter("_method");
		if ("thayDoiNam".equalsIgnoreCase(method)) {
			year = Integer.parseInt(request.getParameter("year"));
			doGet(request, response);
		}
		else if("loadSanPham".equalsIgnoreCase(method)) {
			masp = Integer.parseInt(request.getHeader("X-MaSP"));
			doLoadSanPham(request, response);
			
		}

		
	}
	
	protected void doLoadSanPham(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
			sp = SanPhamDAO.layThongTinSP(conn,masp);
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
		List<String> listMauCuaSP=null;
		try {
			listMauCuaSP = SanPhamDAO.DanhSachMaMauCuaSP(conn,masp);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		request.setAttribute("listMauCuaSP", listMauCuaSP);
		request.setAttribute("listMauHex", listMauHex);
		request.setAttribute("ListDanhMuc", listDanhMuc);
		request.setAttribute("ThongTinSP", sp);
		RequestDispatcher req = request.getRequestDispatcher("/views/admin/SuaSanPham.jsp");
		req.include(request, response);
		
	}
	
}
