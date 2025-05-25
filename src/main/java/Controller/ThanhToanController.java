package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.GioHang;
import models.KichCo;
import models.MauSac;
import models.NguoiDung;
import models.SanPham;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DAO.AccountDAO;
import DAO.DiaChiDAO;
import DAO.GioHangDAO;
import DAO.NguoiDungDAO;
import DAO.SanPhamDAO;
import DAO.ThanhToanDAO;
import DBConnection.ConnectJDBC;

public class ThanhToanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ThanhToanController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("userId") == null) {
			response.sendRedirect("/project_web");
		}
		else {
			
			
			int totalTemp = 0; 
            
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
				nguoiDung = NguoiDungDAO.LayThongTinNguoiDung(conn, (int)session.getAttribute("userId"));
			}
			catch (Exception e) {
				e.printStackTrace();
				response.getWriter().println("Error: " + e.getMessage());
			}
			
			String redirect = request.getParameter("redirect");
			List<GioHang> listGH = null;
			String CacSanPhamDuocChon="";
			if (redirect.equals("buyNow")) {
				int maSP = Integer.parseInt(request.getParameter("maSP"));
				int maKichThuoc = Integer.parseInt(request.getParameter("size"));
				int maMauSac = Integer.parseInt(request.getParameter("tenmau"));
				int soLuong = Integer.parseInt(request.getParameter("soLuong"));
				SanPham sp = null;
				GioHang gh = null;
				
				try {
					sp = SanPhamDAO.layThongTinSPThanhToan(conn, maSP, maKichThuoc, maMauSac);
					gh = new GioHang(sp, soLuong);
				} 
				catch (SQLException e) {
					e.printStackTrace();
				}
				
				listGH = new ArrayList<GioHang>();
				listGH.add(gh);
				totalTemp = soLuong * sp.getGiaHienTai();
			}
			else if (redirect.equals("cart")) {
				
				String cacSanPhamChon = request.getParameter("listSPCheck");
				CacSanPhamDuocChon = cacSanPhamChon;
				String[] listMa = cacSanPhamChon.split(",");
				if (request.getParameter("totalTemp") != null) {
	                totalTemp = Integer.parseInt(request.getParameter("totalTemp"));
	            }
	            if (totalTemp > 0) {
        			try {
        				listGH = GioHangDAO.DanhSachGioHangThanhToan(conn,listMa,(int)session.getAttribute("userId"));
        			}
        			catch (Exception e) {
        				e.printStackTrace();
        				response.getWriter().println("Error: " + e.getMessage());
        			}
    			}
	            else {
	            	response.sendRedirect("/project_web/GioHangController"); 			
	            }	
			}
			
			request.setAttribute("ListGH", listGH);
			request.setAttribute("totalTemp", totalTemp);
			request.setAttribute("nguoiDung", nguoiDung);
			request.setAttribute("CacSanPhamDuocChon", CacSanPhamDuocChon);
			RequestDispatcher req = request.getRequestDispatcher("/views/ThanhToan.jsp");
			req.forward(request, response);
        }
            		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		HttpSession session = request.getSession();
		if (session.getAttribute("userId") == null) {
			response.sendRedirect("/project_web");
		}
		else {
			String redirect = request.getParameter("redirect");
			if (redirect.equals("cart") || redirect.equals("buyNow")) {
				doGet(request, response);
			}
			else{
				int tongTienHoaDon = Integer.parseInt(request.getParameter("tongTienHoaDon"));
				String diaChi = request.getParameter("selectedAddress");
				
				
				int maHoaDon = 0;
				Connection conn = null;
				try {
					conn = new ConnectJDBC().getConnection();
				}
				catch (Exception e) {
					e.printStackTrace();
					response.getWriter().println("Error: " + e.getMessage());
				}
				
//				try {
//					maHoaDon = ThanhToanDAO.ThemHoaDon(conn, tongTienHoaDon, diaChi, (int)session.getAttribute("userId"));
//					NguoiDungDAO.themDiaChiNhanHang(conn, diaChi, (int)session.getAttribute("userId"));
//				}
//				catch (Exception e) {
//					e.printStackTrace();
//					response.getWriter().println("Error: " + e.getMessage());
//				}
				
				List<GioHang> listGH = new ArrayList<GioHang>();
				
				String danhSachMaSP = "";
				String danhSachSoLuong = "";
				int soLuong1SP = 0;
				SanPham spForSingleProduct = null;
				if (redirect.equals("1_San_Pham")) {
					int maSP = Integer.parseInt(request.getParameter("maSP"));
					int maKichCo = Integer.parseInt(request.getParameter("maKichCo"));
					int maMauSac = Integer.parseInt(request.getParameter("maMau"));
					soLuong1SP = Integer.parseInt(request.getParameter("soLuong1SP"));
					danhSachMaSP = String.valueOf(maSP);
				    danhSachSoLuong = String.valueOf(soLuong1SP);
				    
					try {
						// Tạo đối tượng SanPham và GioHang, nhưng CHƯA đặt GiaHienTai
                        spForSingleProduct = new SanPham(maSP, maKichCo, maMauSac);
                        GioHang gh = new GioHang(spForSingleProduct, soLuong1SP);
                        listGH.add(gh);
					}
					catch (Exception e) {
						e.printStackTrace();
						response.getWriter().println("Error: " + e.getMessage());
					}
				}
				else if (redirect.equals("Nhieu_Hon_1_San_Pham")) {
					String CacSanPhamDuocChon = request.getParameter("CacSanPhamDuocChon");
					String[] listMa = CacSanPhamDuocChon.split(",");
					danhSachMaSP = CacSanPhamDuocChon;
					try {
	    				listGH = GioHangDAO.DanhSachGioHangThanhToan(conn,listMa,(int)session.getAttribute("userId"));
	    				
	    				StringBuilder sbSoLuong = new StringBuilder();
	    		        for (int i = 0; i < listGH.size(); i++) {
	    		            int soLuong = listGH.get(i).getSoLuongGH(); // Lấy số lượng từ GioHang
	    		            if (i > 0) {
	    		                sbSoLuong.append(","); // ngăn cách dấu phẩy
	    		            }
	    		            sbSoLuong.append(soLuong);
	    		        }
	    		        danhSachSoLuong = sbSoLuong.toString();
	    			}
	    			catch (Exception e) {
	    				e.printStackTrace();
	    				response.getWriter().println("Error: " + e.getMessage());
	    			}
				}
				
				try {
				    int tongTienThucTe = ThanhToanDAO.TinhTongTienThucTe(conn, danhSachMaSP, danhSachSoLuong);
				  
//				    if (tongTienHoaDon != tongTienThucTe) {
//				        // Nếu tổng tiền người dùng gửi không khớp với tổng tiền thực tế DB thì sửa lại
				        tongTienHoaDon = tongTienThucTe;
				    //}
				} catch (SQLException e) {
				    e.printStackTrace();
				    response.getWriter().println("Error khi kiểm tra tổng tiền: " + e.getMessage());
				}
	
				if (redirect.equals("1_San_Pham")) {
                    if (soLuong1SP > 0) {
                        // Cập nhật GiaHienTai cho sản phẩm đơn lẻ
                        spForSingleProduct.setGiaHienTai((tongTienHoaDon) / soLuong1SP);
                    } else {
                        // Xử lý trường hợp số lượng là 0 để tránh chia cho 0
                        spForSingleProduct.setGiaHienTai(0); 
                        System.err.println("Warning: soLuong1SP is 0 for single product checkout.");
                    }
                }
				
				try {
					maHoaDon = ThanhToanDAO.ThemHoaDon(conn, tongTienHoaDon, diaChi, (int)session.getAttribute("userId"));
					NguoiDungDAO.themDiaChiNhanHang(conn, diaChi, (int)session.getAttribute("userId"));
				}
				catch (Exception e) {
					e.printStackTrace();
					response.getWriter().println("Error: " + e.getMessage());
				}
				
				for (int i=0; i<listGH.size(); i++) {
					try {
						ThanhToanDAO.ThemChiTietHoaDon(conn, listGH.get(i), maHoaDon, (int)session.getAttribute("userId"));
					}
					catch (Exception e) {
						e.printStackTrace();
	    				response.getWriter().println("Error: " + e.getMessage());
					}
				}
			//	response.sendRedirect("/project_web/Donhang");
			
//				RequestDispatcher req = request.getRequestDispatcher("/views/ThanhToan.jsp");
//				req.forward(request, response);
				// request.setAttribute("paymentSuccess", "true");

			        // Chuyển tiếp tới trang ThanhToan.jsp
			        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/CheckOut.jsp");
			        dispatcher.forward(request, response);
			}
		}

	}

}
