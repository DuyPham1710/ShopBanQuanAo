package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
import java.util.List;

import DAO.DonHangDAO;
import DAO.HoaDonDAO;
import DAO.NguoiDungDAO;
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
		

		request.setAttribute("ListHD", listHD);
		RequestDispatcher req = request.getRequestDispatcher("/views/admin/QuanLyDonHang.jsp");
		req.forward(request, response);
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
	            boolean isUpdated = HoaDonDAO.capNhatTrangThai(conn, maHoaDon, trangThai);

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
