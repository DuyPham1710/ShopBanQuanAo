package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import models.GioHang;

public class ThanhToanDAO {
	public static int ThemHoaDon(Connection conn, int tongTienHoaDon, String diaChi) throws SQLException {
		String sql = "{call proc_ThemHoaDon(?, ?, ?, ?)}";
        CallableStatement stmt = conn.prepareCall(sql) ;
        stmt.setInt(1, AccountDAO.getID()); 
        stmt.setInt(2, tongTienHoaDon);  
        stmt.setString(3, diaChi);
        stmt.registerOutParameter(4, Types.INTEGER);
        stmt.execute();		
        int maHoaDon = stmt.getInt(4);
        return maHoaDon;
	}
	
	public static void ThemChiTietHoaDon(Connection conn, GioHang gh, int maHoaDon) throws SQLException {
		String sql = "{call proc_ThemChiTietHoaDon(?, ?, ?, ?, ?, ?)}";
        CallableStatement stmt = conn.prepareCall(sql) ;
     
        stmt.setInt(1, maHoaDon);
        stmt.setInt(2, (gh.getSoLuongGH() * gh.getSanPham().getGiaHienTai())); 
        stmt.setInt(3, gh.getSoLuongGH());
        stmt.setInt(4, gh.getSanPham().getMaSP());
        stmt.setInt(5, gh.getSanPham().getKichCo().get(0).getMaKichCo()); 
        stmt.setInt(6, gh.getSanPham().getMauSac().get(0).getMaMau()); 
       
        stmt.executeUpdate();		
	}
}
