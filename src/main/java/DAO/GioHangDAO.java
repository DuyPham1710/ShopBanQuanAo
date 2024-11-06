package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.GioHang;

public class GioHangDAO {
	public static void ThemGioHang(Connection conn, GioHang gh) throws SQLException {
		 String checkSQL = "select 1 FROM GioHang where IDNguoiMua = ? and MaSanPham = ? and MaKichCo = ? and MaMau = ?";
		 String sql = "";
		 PreparedStatement checkStmt = conn.prepareStatement(checkSQL);
		 checkStmt.setInt(1, gh.getID()); 
		 checkStmt.setInt(2, gh.getMaSP()); 
		 checkStmt.setInt(3, gh.getMaKichThuoc()); 
		 checkStmt.setInt(4, gh.getMaMau()); 
      
		 ResultSet rs = checkStmt.executeQuery();
         if (rs.next()) {
             // Nếu sản phẩm đã tồn tại, cập nhật số lượng
        	 sql = "{call proc_CapNhatGioHang(?, ?, ?, ?, ?)}";
         } 
         else {
             // Nếu sản phẩm chưa có, thêm mới sản phẩm vào giỏ hàng
        	 sql = "{call proc_ThemGioHang(?, ?, ?, ?, ?)}";
         }
         CallableStatement stmt = conn.prepareCall(sql) ;
         stmt.setInt(1, gh.getID()); 
         stmt.setInt(2, gh.getMaSP()); 
         stmt.setInt(3, gh.getMaKichThuoc());   
         stmt.setInt(4, gh.getMaMau()); 
         stmt.setInt(5, gh.getSoLuong());   
    
         stmt.executeUpdate();
		
	}
	public static void XoaGioHang(Connection conn, int maSP, int maKichThuoc, int maMau) throws SQLException {
       	String sql = "{call proc_XoaGioHang(?, ?, ?)}";
        CallableStatement stmt = conn.prepareCall(sql) ;
        stmt.setInt(1, maSP); 
        stmt.setInt(2, maKichThuoc); 
        stmt.setInt(3, maMau); 
        stmt.executeUpdate();
		
	}
	public static List<GioHang> DanhSachGioHang(Connection conn) throws SQLException {
		List<GioHang> listGH = new ArrayList<GioHang>();
		String sql = "{call proc_DanhSachGioHang(?)}";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, AccountDAO.getID());
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {			
			GioHang gh = new GioHang(
					rs.getInt("maSP"), 
					rs.getString("TenSanPham"),
					rs.getInt("MaKichCo"),
					rs.getString("TenKichCo"), 
					rs.getInt("MaMau"),
					rs.getString("TenMau"), 
					rs.getInt("SoLuongGH"), 
					rs.getInt("GiaBanDau"), 
					rs.getFloat("GiaHienTai"), 
					rs.getString("DuongDanHinh"));
			
			listGH.add(gh);	
		}
		return listGH;
	}
}
