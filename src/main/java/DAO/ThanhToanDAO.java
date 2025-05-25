package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import models.GioHang;

public class ThanhToanDAO {
	public static int ThemHoaDon(Connection conn, int tongTienHoaDon, String diaChi, int userId) throws SQLException {
		String sql = "{call proc_ThemHoaDon(?, ?, ?, ?)}";
        CallableStatement stmt = conn.prepareCall(sql) ;
        stmt.setInt(1, userId); 
        stmt.setInt(2, tongTienHoaDon);  
        stmt.setString(3, diaChi);
        stmt.registerOutParameter(4, Types.INTEGER);
        stmt.execute();		
        int maHoaDon = stmt.getInt(4);
        return maHoaDon;
	}
	
	public static void ThemChiTietHoaDon(Connection conn, GioHang gh, int maHoaDon, int userId) throws SQLException {
		String sql = "{call proc_ThemChiTietHoaDon(?, ?, ?, ?, ?, ?, ?)}";
        CallableStatement stmt = conn.prepareCall(sql) ;
     
        stmt.setInt(1, userId);
        stmt.setInt(2, maHoaDon);
        stmt.setInt(3, (gh.getSoLuongGH() * gh.getSanPham().getGiaHienTai())); 
        stmt.setInt(4, gh.getSoLuongGH());
        stmt.setInt(5, gh.getSanPham().getMaSP());
        stmt.setInt(6, gh.getSanPham().getKichCo().get(0).getMaKichCo()); 
        stmt.setInt(7, gh.getSanPham().getMauSac().get(0).getMaMau()); 
       
        stmt.executeUpdate();		
	}
	
	public static int TinhTongTienThucTe(Connection conn, String danhSachMaSP, String danhSachSoLuong) throws SQLException {
	    String sql = "SELECT dbo.fn_TinhTongTienSanPham(?, ?) AS TongTien";
	    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setString(1, danhSachMaSP);
	        stmt.setString(2, danhSachSoLuong);
	        try (ResultSet rs = stmt.executeQuery()) {
	            if (rs.next()) {
	                return rs.getInt("TongTien");
	            }
	        }
	    }
	    return 0;
	}
}
