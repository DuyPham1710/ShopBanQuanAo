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
		 String checkSQL = "select SoLuong FROM GioHang where IDNguoiMua = ? and MaSanPham = ?";
		 String sql = "";
		 PreparedStatement checkStmt = conn.prepareStatement(checkSQL);
		 checkStmt.setInt(1, gh.getID()); 
		 checkStmt.setInt(2, gh.getMaSP()); 
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
         stmt.setInt(3, gh.getSoLuong());   
         stmt.setString(4, gh.getKichThuoc()); 
         stmt.setString(5, gh.getMauSac());   
    
         stmt.executeUpdate();
		
	}
	public static void XoaGioHang(Connection conn, int maSP) throws SQLException {
       	String sql = "{call proc_XoaGioHang(?)}";
        CallableStatement stmt = conn.prepareCall(sql) ;
        stmt.setInt(1, maSP); 
        stmt.executeUpdate();
		
	}
	public static List<GioHang> DanhSachGioHang(Connection conn) throws SQLException {
		List<GioHang> listGH = new ArrayList<GioHang>();
		String sql = "select sp.MaSanPham as maSP, TenSanPham, KichThuoc, MauSac, gh.SoLuong as SoLuongGH, GiaBanDau, GiaBanDau - GiaBanDau*(GiamGia/100.0) as GiaHienTai, DuongDanHinh "
				+ "from SanPham as sp, HinhAnhSanPham, GioHang as gh "
				+ "where sp.MaSanPham = HinhAnhSanPham.MaSanPham and sp.MaSanPham = gh.MaSanPham and gh.IDNguoiMua = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, AccountDAO.getID());
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {			
			GioHang gh = new GioHang(
					rs.getInt("maSP"), 
					rs.getString("TenSanPham"), 
					rs.getString("KichThuoc"), 
					rs.getString("MauSac"), 
					rs.getInt("SoLuongGH"), 
					rs.getInt("GiaBanDau"), 
					rs.getFloat("GiaHienTai"), 
					rs.getString("DuongDanHinh"));
			
			listGH.add(gh);	
		}
		return listGH;
	}
}
