package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.GioHang;
import models.NguoiDung;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import DAO.AccountDAO;
import DAO.DiaChiDAO;
import DAO.GioHangDAO;
import DAO.NguoiDungDAO;
import DBConnection.ConnectJDBC;

public class ThanhToanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ThanhToanController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (AccountDAO.getID() == 0) {
			response.sendRedirect("/project_web/views/login.jsp");
		}
		else {
			int totalTemp = 0; 
            if (request.getParameter("totalTemp") != null) {
                totalTemp = Integer.parseInt(request.getParameter("totalTemp"));
            }
            if (totalTemp > 0) {
            	Connection conn = null;
    			try {
    				conn = new ConnectJDBC().getConnection();
    			}
    			catch (Exception e) {
    				e.printStackTrace();
    				response.getWriter().println("Error: " + e.getMessage());
    			}
    			
    			List<GioHang> listGH = null;
    			try {
    				listGH = GioHangDAO.DanhSachGioHang(conn);
    			}
    			catch (Exception e) {
    				e.printStackTrace();
    				response.getWriter().println("Error: " + e.getMessage());
    			}
    			
    			NguoiDung nguoiDung = null;
    			try {
    				nguoiDung = NguoiDungDAO.LayThongTinNguoiDung(conn);
    			}
    			catch (Exception e) {
    				e.printStackTrace();
    				response.getWriter().println("Error: " + e.getMessage());
    			}
    			
    			List<String> ListDC = null;
    			try {
    				ListDC = DiaChiDAO.LayDanhSachDiaChi(conn);
    			}
    			catch (Exception e) {
    				e.printStackTrace();
    				response.getWriter().println("Error: " + e.getMessage());
    			}
    			
    			request.setAttribute("ListGH", listGH);
    			request.setAttribute("totalTemp", totalTemp);
    			request.setAttribute("nguoiDung", nguoiDung);
    			request.setAttribute("ListDC", ListDC);
    			
    			RequestDispatcher req = request.getRequestDispatcher("/views/ThanhToan.jsp");
    			req.forward(request, response);
            }
            else {
            	response.sendRedirect("/project_web/GioHangController");
    			
            }
			
		}
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
