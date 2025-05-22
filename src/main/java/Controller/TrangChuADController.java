package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.NguoiDung;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.List;

import DAO.NguoiDungDAO;
import DAO.SanPhamDAO;
import DBConnection.ConnectJDBC;

/**
 * Servlet implementation class TrangChuADController
 */
public class TrangChuADController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LocalDate today = LocalDate.now();
	private int year = today.getYear();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrangChuADController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("userId") == null || (int)session.getAttribute("userId") != 1) {
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
			
			List<NguoiDung> listND = null;
			try {
				listND = NguoiDungDAO.loadNguoiDung(conn, 0, 0);
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
			
			int tongDoanhThu = 0;
			try {
				String sql = "SELECT dbo.TongDoanhThu() AS TongDoanhThu";
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					tongDoanhThu = rs.getInt("TongDoanhThu");
				}
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			int donDaGiao=0, donDangGiao=0;
			try {
				String sql = "SELECT * FROM dbo.SoDonHangTheoTrangThai()";
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					donDaGiao = rs.getInt("DaGiao");
					donDangGiao = rs.getInt("DangGiao");
				}
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			List<Integer> ThongKeDoanhThu = null;
			try {
				ThongKeDoanhThu = SanPhamDAO.ThongKeDoanhThuTrongNam(conn,year);
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			request.setAttribute("NamThongKe", year);
			request.setAttribute("SoKH", listND.size());
			request.setAttribute("DaBan", sanPhamDaBan);
			request.setAttribute("TongDoanhThu", tongDoanhThu);
			request.setAttribute("DaGiao", donDaGiao);
			request.setAttribute("DangGiao", donDangGiao);
			request.setAttribute("ThongKeTheoNam", ThongKeDoanhThu);
			RequestDispatcher req = request.getRequestDispatcher("/views/admin/TrangChuAD.jsp");
			req.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("year")!="") {
			year = Integer.parseInt(request.getParameter("year"));
			if(year<0) {
				year=0;
			}
		}
		else {
			year=0;
		}
		doGet(request, response);
	}

}
