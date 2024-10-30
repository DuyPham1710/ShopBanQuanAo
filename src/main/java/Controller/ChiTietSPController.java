package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.SanPham;
import utils.DBUtils;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import DBConnection.ConnectJDBC;


public class ChiTietSPController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ChiTietSPController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maSP = Integer.parseInt(request.getParameter("maSP"));
	    String tenSP = request.getParameter("tenSP");
	    String mota = request.getParameter("mota");
	    float gia = Float.parseFloat(request.getParameter("gia"));
	    int soLuong = Integer.parseInt(request.getParameter("soLuong"));
	    int maDanhMuc = Integer.parseInt(request.getParameter("maDanhMuc"));
	    int maKichCo = Integer.parseInt(request.getParameter("maKichCo"));
	    int maMau = Integer.parseInt(request.getParameter("maMau"));
	    int maHinhAnh = Integer.parseInt(request.getParameter("maHinhAnh"));
	    String duongDanHinh = request.getParameter("duongDanHinh");
	    SanPham sp = new SanPham(maSP, tenSP, mota, gia, soLuong, maDanhMuc, maKichCo, maMau, maHinhAnh, duongDanHinh);
	    
	    Connection conn = null;
		try {
			conn = new ConnectJDBC().getConnection();
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		List<String> listMau = null;
		try {
			listMau = DBUtils.layMauSP(conn, maSP);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		List<String> listSize = null;
		try {
			listSize = DBUtils.laySizeSP(conn, maSP);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
		
		request.setAttribute("sp", sp);
		request.setAttribute("ListMau", listMau);
		request.setAttribute("ListSize", listSize);
		
		RequestDispatcher req = request.getRequestDispatcher("/views/ChiTietSP.jsp");
		req.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if (method.equals("get")) {
			doGet(request, response);
		}
		else {
			
		}
	}

}
