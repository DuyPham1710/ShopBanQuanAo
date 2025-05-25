package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.DanhMucSanPham;
import models.HoaDon;
import models.NguoiDung;
import models.SanPham;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import DAO.HoaDonDAO;
import DAO.NguoiDungDAO;
import DAO.SanPhamDAO;
import DBConnection.ConnectJDBC;

/**
 * Servlet implementation class qlKhachHangController
 */
public class qlKhachHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private int thang=0;
    private int nam=0;
    
    LocalDate today = LocalDate.now();
	private int nam1 = today.getYear();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public qlKhachHangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("userId") == null || (int)session.getAttribute("userId") !=1) {
			response.sendRedirect("/project_web");
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
		
		List<NguoiDung> listND = null;
		try {
			listND = NguoiDungDAO.loadNguoiDung(conn, thang, nam);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
			
		}
		
		List<NguoiDung> listNDMuaNhieu = null;
		try {
			listNDMuaNhieu = NguoiDungDAO.loadNguoiDungMuaNhieu(conn, nam1);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
			
		}
		
		
		List<Integer> thongKeTungThang = null;
		try {
			thongKeTungThang = NguoiDungDAO.ThongKeKhachHangMua(conn, nam1);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
			
		}
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("selectedMonth", thang);
		request.setAttribute("selectedYear", nam);
		request.setAttribute("NamThongKe", nam1);
		request.setAttribute("ThongKeTungThang", thongKeTungThang);
		request.setAttribute("ListND", listND);
		request.setAttribute("ListNDMN", listNDMuaNhieu);
		request.setAttribute("SoKH", listND.size());
		
		RequestDispatcher req = request.getRequestDispatcher("/views/admin/QuanLyKhachHang.jsp");
		req.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String method = request.getParameter("_method");
		if ("thayDoiNam".equalsIgnoreCase(method)) {
			String tmp=request.getParameter("year");
			if(tmp!="") {
				nam1 = Integer.parseInt(tmp);
				if(nam1<0) {
					nam1=0;
				}
			}
			else {
				nam1=0;
			}
			 
			doGet(request, response);
		}
		else if ("locKhachHang".equalsIgnoreCase(method)) {
			 thang= Integer.parseInt(request.getParameter("filterMonth"));
			 String tmp=request.getParameter("filterYear");
			 if(tmp!="") {
				 nam=Integer.parseInt(tmp);
				 if(nam<0) {
					 nam=0;
				 }
			 }
			 else {
				 nam=0;
			 }
			doGet(request, response);
		}
		else if ("loadThongTinKhachHang".equalsIgnoreCase(method)) {
			doLoad(request, response);
		}
		
	}
	
	protected void doLoad(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		try {
			conn = new ConnectJDBC().getConnection();
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		int idNguoiDung = Integer.parseInt(request.getHeader("idNguoiDung"));
		NguoiDung nd = null;
		try {
			nd = NguoiDungDAO.ThongTinKhachHang(conn, idNguoiDung,thang, nam);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
			
		}
		List<HoaDon> listHD = null;
		try {
			listHD = HoaDonDAO.DanhSachHoaDonCuaKhach(conn, idNguoiDung, thang, nam);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		request.setAttribute("ListHD", listHD);
		request.setAttribute("IDNguoiDung", idNguoiDung);
		request.setAttribute("ThongTinND", nd);
		RequestDispatcher req = request.getRequestDispatcher("/views/admin/ThongTinKhachHang.jsp");
		req.include(request, response);
	}

}
