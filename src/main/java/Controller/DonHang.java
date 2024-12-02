package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.DonMua;
import models.NguoiDung;
import models.SanPham;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import DAO.DonHangDAO;
import DAO.NguoiDungDAO;
import DAO.SanPhamDAO;
import DBConnection.ConnectJDBC;

public class DonHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DonHang() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		try {
			conn = new ConnectJDBC().getConnection();
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		List<DonMua> DanhSachDonHang = null;
		try {
			DanhSachDonHang = DonHangDAO.DanhSachDonHang(conn);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
			
		}
		
		request.setAttribute("DanhSachDonHang", DanhSachDonHang);
		RequestDispatcher req = request.getRequestDispatcher("/views/DonHang.jsp");
		req.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//int maHoaDon = Integer.parseInt(request.getHeader("X-MaHoaDon"));
		int maHoaDon = 1;
			
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
				nguoiDung = NguoiDungDAO.LayThongTinNguoiDung_DonHang(conn, maHoaDon);
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			DonMua donMua = null;
			try {
				donMua = DonHangDAO.LoadThongTinMotDonHang(conn, maHoaDon);
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			//DonMua donMua = new DonMua(maHoaDon, listChiTietHD);
			
			System.out.print(donMua.getGiaBan());
			request.setAttribute("nguoiDung", nguoiDung);
			request.setAttribute("donMua", donMua);
			
			RequestDispatcher req = request.getRequestDispatcher("/views/admin/ChiTietDonHang.jsp");
			req.include(request, response);
	}

}
