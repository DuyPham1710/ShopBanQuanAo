package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import models.DonMua;
import models.HoaDon;
import models.NguoiDung;
import models.SanPham;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import DAO.AccountDAO;
import DAO.DonHangDAO;
import DAO.HoaDonDAO;
import DAO.NguoiDungDAO;
import DAO.SanPhamDAO;
import DBConnection.ConnectJDBC;

/**
 * Servlet implementation class HoaDonController
 */
@WebServlet("/HoaDonController")
public class HoaDonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HoaDonController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
			
			List<HoaDon> listHD = null;
			try {
				listHD = HoaDonDAO.DanhSachHoaDon(conn);
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			int tongDonHang = 0, choXacNhan = 0, dangGiao = 0, daGiao = 0, daHuy = 0;
			try {
				String sql = "SELECT * FROM dbo.SoDonHangTheoTrangThai()";
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					tongDonHang = rs.getInt("TongDonHang");
					choXacNhan = rs.getInt("ChoXacNhan");
					dangGiao = rs.getInt("DangGiao");
					daGiao = rs.getInt("DaGiao");
					daHuy = rs.getInt("DaHuy");
				}
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
			
			request.setAttribute("ListHD", listHD);
			request.setAttribute("TongDonHang", tongDonHang);
			request.setAttribute("DonDangChoXacNhan", choXacNhan);
			request.setAttribute("DonDangGiao", dangGiao);
			request.setAttribute("DonDaGiao", daGiao);
			request.setAttribute("DonDaHuy", daHuy);
			RequestDispatcher req = request.getRequestDispatcher("/views/admin/QuanLyDonHang.jsp");
			req.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maHoaDon = Integer.parseInt(request.getHeader("X-MaHoaDon"));
		//	int maHoaDon = 9;
		int idNguoiMua = Integer.parseInt(request.getHeader("X-IdNguoiMua"));
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
				nguoiDung = NguoiDungDAO.LayThongTinNguoiDung_DonHangChoAD(conn, maHoaDon, idNguoiMua);
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			DonMua donMua = null;
			try {
				donMua = DonHangDAO.LoadThongTinMotDonHangChoAD(conn, maHoaDon, idNguoiMua);
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			//DonMua donMua = new DonMua(maHoaDon, listChiTietHD);
			
		//	System.out.print("QUa Được đây");
			request.setAttribute("nguoiDung", nguoiDung);
			request.setAttribute("donMua", donMua);
			
			RequestDispatcher req = request.getRequestDispatcher("/views/admin/ChiTietDonHang.jsp");
			req.include(request, response);
	}
	
	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("userId") == null) {
			response.sendRedirect("/project_web");
		}
		else {
			try {
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
		        int maHoaDon = json.getInt("maHoaDon");
		        String trangThai = json.getString("trangThai");
		        // Kết nối và cập nhật trạng thái
		        try (Connection conn = new ConnectJDBC().getConnection()) {
		            boolean isUpdated = HoaDonDAO.capNhatTrangThai(conn, maHoaDon, trangThai, (int)session.getAttribute("userId"));

		            if (isUpdated) {
		                response.setStatus(HttpServletResponse.SC_OK);
		            } else {
		                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		                response.getWriter().println("Không tìm thấy hóa đơn.");
		            }
		        }
		    } catch (Exception e) {
		        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		        response.getWriter().println("Error: " + e.getMessage());
		    }
		}
	}



}
