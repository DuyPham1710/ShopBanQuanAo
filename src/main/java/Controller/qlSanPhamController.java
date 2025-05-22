package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.DanhMucSanPham;
import models.HinhAnhSanPham;
import models.SanPham;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.json.JSONObject;

import DAO.SanPhamDAO;
import DBConnection.ConnectJDBC;
import Filters.InputSanitizer;

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
		else if("suaSanPham".equalsIgnoreCase(method)) {
			doSuaSanPham(request, response);
		}
		else if("loadThongTinAddSP".equalsIgnoreCase(method)) {
			doLoadThongTinAddSP(request, response);
		}
		else if("themSanPham".equalsIgnoreCase(method)) {
			doThemSanPham(request, response);
		}
		else if("xoaSanPham".equalsIgnoreCase(method)) {
			doXoaSanPham(request,response);
		}
		
	}
	protected void doXoaSanPham(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maSP = Integer.parseInt(request.getParameter("maSPCanXoa"));
		Connection conn = null;
		try {
			conn = new ConnectJDBC().getConnection();
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		try {
			SanPhamDAO.XoaSanPham(conn,maSP);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		doGet(request,response);
	}
protected void doSuaSanPham(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		Connection conn = null;
		try {
			conn = new ConnectJDBC().getConnection();
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
        // Đọc dữ liệu từ body
        StringBuilder jsonBuffer = new StringBuilder();
        String line;
        try (BufferedReader reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                jsonBuffer.append(line);
            }
        }
        

        // Chuyển JSON thành đối tượng
        JSONObject json = new JSONObject(jsonBuffer.toString());
		masp = json.getInt("maSanPhamEdit");
		String tenSP = json.getString("tenSPEdit");
		int giaBanDau = json.getInt("giaSanPhamEdit");
		int giamGia = json.getInt("giamGiaEdit");
		int soLuong = json.getInt("soLuongEdit");
		int danhMuc = json.getInt("maDanhMucEdit");
		String hinh = json.getString("linkAnhEdit");
		String xuatXu = json.getString("xuatXuEdit");
		String chatLieu = json.getString("chatLieuEdit");
		
		String strKichThuoc = json.getString("sizeDaDuocChonEdit");
		List<String> listSize = Arrays.asList(strKichThuoc.split(","));
		
		String strMau = json.getString("mauDaDuocChonEdit");
		List<String> listMau = Arrays.asList(strMau.split(","));
		
		String danhMucMoi = json.getString("danhMucThemVao");

		int maDanhMucNew =danhMuc;
		//them danh muc
		if(danhMuc==0) {
			try {
				maDanhMucNew = SanPhamDAO.ThemDanhMucMoi(conn,danhMucMoi);
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
		}
		
		String moTa = json.getString("moTaEdit");
		
		// Check XSS
		if (containsXSS(tenSP, response) || containsXSS(hinh, response) || 
				containsXSS(xuatXu, response) ||
		    containsXSS(chatLieu, response) || containsXSS(danhMucMoi, response) ||
		    containsXSS(strMau, response) || containsXSS(strKichThuoc, response) ||
		    containsXSS(moTa, response)) {
		    return; // Stop execution if XSS found
		}
		
		HinhAnhSanPham ha= new HinhAnhSanPham(0, hinh);
		DanhMucSanPham dm = new DanhMucSanPham(maDanhMucNew);
		SanPham sp = new SanPham(masp, tenSP, moTa, giaBanDau, giamGia, soLuong,null,xuatXu,chatLieu, 0, dm, ha );

//		try {
//			SanPhamDAO.SuaMau(conn,masp,listMau);
//			
//		}
//		catch (Exception e) {
//			e.printStackTrace();
//			response.getWriter().println("Error: " + e.getMessage());
//		}
		
//		try {
//			SanPhamDAO.SuaSize(conn,masp,listSize);
//		}
//		catch (Exception e) {
//			e.printStackTrace();
//			response.getWriter().println("Error: " + e.getMessage());
//		}
		
		try {
			SanPhamDAO.SuaSanPham(conn,sp);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		try {
			SanPhamDAO.SuaHinhAnh(conn,sp);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
	}
	
	
	protected void doThemSanPham(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection conn = null;
		try {
			conn = new ConnectJDBC().getConnection();
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		

        // Đọc dữ liệu từ body
        StringBuilder jsonBuffer = new StringBuilder();
        String line;
        try (BufferedReader reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                jsonBuffer.append(line);
            }
        }

        // Chuyển JSON thành đối tượng
        JSONObject json = new JSONObject(jsonBuffer.toString());
		String tenSP = json.getString("tenSPAdd");
		int giaBanDau = json.getInt("giaSanPhamAdd");
		int giamGia = json.getInt("giamGiaAdd");
		int soLuong = json.getInt("soLuongAdd");
		int danhMuc = json.getInt("maDanhMucAdd");
		String hinh = json.getString("linkAnhAdd");
		String xuatXu = json.getString("xuatXuAdd");
		String chatLieu = json.getString("chatLieuAdd");
		String danhMucMoi = json.getString("danhMucThemVao");

		
		
		int maDanhMucNew =danhMuc;
		//them danh muc
		if(danhMuc==0) {
			try {
				maDanhMucNew = SanPhamDAO.ThemDanhMucMoi(conn,danhMucMoi);
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
		}
		
		String strKichThuoc;
		String sizeThemVao = json.getString("sizeThemVao");
		if(sizeThemVao == "") {
			strKichThuoc = json.getString("sizeDaDuocChonAdd");
		}
		else {
			if(json.getString("sizeDaDuocChonAdd")=="") {
				strKichThuoc= sizeThemVao;
			}
			else {
				strKichThuoc= json.getString("sizeDaDuocChonAdd")+","+sizeThemVao;
			}
		}
		List<String> listSize = Arrays.asList(strKichThuoc.split(","));
		
		
		String strMau = json.getString("mauDaDuocChonAdd");
		List<String> listMauThemVao = null;
		List<String> listMau = null;
		String mauThemVao = json.getString("mauThemVao");
		if(strMau != "") {
			listMau = Arrays.asList(strMau.split(","));
		}
		if(mauThemVao!="") {
			listMauThemVao = Arrays.asList(mauThemVao.split(","));
		}
		
		int index = 0;
		if(listMau != null) {
			index= listMau.size();
			try {
				SanPhamDAO.ThemMau(conn,masp,listMau);
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
		}
		if(listMauThemVao!= null) {
			try {
				SanPhamDAO.ThemMauMoi(conn,masp,listMauThemVao,index);
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
		}
		
		
		String moTa = json.getString("moTaAdd");
		HinhAnhSanPham ha= new HinhAnhSanPham(masp, hinh);
		DanhMucSanPham dm = new DanhMucSanPham(maDanhMucNew);

		LocalDate day = LocalDate.now();
		Date sqlDate = Date.valueOf(day);
		
		// Check XSS
		if (containsXSS(tenSP, response) || containsXSS(hinh, response) || 
				containsXSS(xuatXu, response) ||
		    containsXSS(chatLieu, response) || containsXSS(danhMucMoi, response) ||
		    containsXSS(strMau, response) || containsXSS(strKichThuoc, response) ||
		    containsXSS(moTa, response)) {
		    return; // Stop execution if XSS found
		}
				
		try {
			masp = SanPhamDAO.MaSPTiepTheo(conn);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		SanPham sp = new SanPham(masp, tenSP, moTa, giaBanDau, giamGia, soLuong, sqlDate, xuatXu,chatLieu, 0, dm, ha );
		
		try {
			SanPhamDAO.ThemSanPham(conn,sp);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		try {
			SanPhamDAO.ThemSize(conn,masp,listSize);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		
		try {
			SanPhamDAO.ThemHinh(conn,sp);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
	}
	
	// Hàm kiểm tra XSS
	private boolean containsXSS(String original, HttpServletResponse response) throws IOException {
	    String clean = InputSanitizer.sanitize(original);
	    if (!clean.equals(original)) {
	        response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set 400 Bad Request
	        response.getWriter().println("Phat hien tan cong XSS!");
	        return true;
	    }
	    return false;
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
		
		List<String> listAllSize=null;
		try {
			listAllSize = SanPhamDAO.ListAllSize(conn);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		List<String> listSizeCuaSP=null;
		try {
			listSizeCuaSP = SanPhamDAO.DanhSachSizeCuaSP(conn,masp);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		request.setAttribute("listSizeCuaSP", listSizeCuaSP);
		request.setAttribute("listAllSize", listAllSize);
		request.setAttribute("listMauCuaSP", listMauCuaSP);
		request.setAttribute("listMauHex", listMauHex);
		request.setAttribute("ListDanhMuc", listDanhMuc);
		request.setAttribute("ThongTinSP", sp);
		RequestDispatcher req = request.getRequestDispatcher("/views/admin/SuaSanPham.jsp");
		req.include(request, response);
		
	}
	
	protected void doLoadThongTinAddSP(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
		
		List<String> listAllSize=null;
		try {
			listAllSize = SanPhamDAO.ListAllSize(conn);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		
		request.setAttribute("listAllSize", listAllSize);
		request.setAttribute("listMauHex", listMauHex);
		request.setAttribute("ListDanhMuc", listDanhMuc);
		RequestDispatcher req = request.getRequestDispatcher("/views/admin/ThemSanPham.jsp");
		req.include(request, response);
	}
	
}
