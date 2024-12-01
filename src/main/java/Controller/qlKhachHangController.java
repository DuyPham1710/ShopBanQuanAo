package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.DanhMucSanPham;
import models.NguoiDung;
import models.SanPham;

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
		doGet(request, response);
	}

}
