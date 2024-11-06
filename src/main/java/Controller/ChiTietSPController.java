package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.GioHang;
import models.SanPham;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import DAO.AccountDAO;
import DAO.GioHangDAO;
import DAO.SanPhamDAO;
import DBConnection.ConnectJDBC;


public class ChiTietSPController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ChiTietSPController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maSP = Integer.parseInt(request.getParameter("maSP"));

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
		
		List<SanPham> listMau = null;
		try {
			listMau = SanPhamDAO.layMauSP(conn, maSP);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		List<SanPham> listSize = null;
		try {
			listSize = SanPhamDAO.laySizeSP(conn, maSP);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		List<SanPham> listSPTuongTu = null;
		try {
			listSPTuongTu = SanPhamDAO.DanhSachSPTuongTu(conn, sp.getMaSP(), sp.getMaDanhMuc());
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		request.setAttribute("sp", sp);
		request.setAttribute("ListMau", listMau);
		request.setAttribute("ListSize", listSize);
		request.setAttribute("ListSPTuongTu", listSPTuongTu);
		
		RequestDispatcher req = request.getRequestDispatcher("/views/ChiTietSP.jsp");
		req.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if (method.equals("get")) {
			doGet(request, response);
		}
		else {
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
			 
			 GioHang gh = new GioHang(AccountDAO.getID(), maSP, maKichThuoc, maMauSac, soLuong);
			 try {
				GioHangDAO.ThemGioHang(conn, gh);
			 }
			 catch (Exception e) {
				 e.printStackTrace();
				 response.getWriter().println("Error: " + e.getMessage());
			 }
			 doGet(request, response);
		}
	}

}
