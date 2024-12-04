package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.tags.shaded.org.apache.xpath.axes.ChildTestIterator;

import models.ChiTietHoaDon;
import models.HoaDon;

public class HoaDonDAO {
	public static List<HoaDon> DanhSachHoaDon(Connection conn) throws SQLException {
		List<HoaDon> DanhSachHoaDon = new ArrayList<HoaDon>();
		String sql = "select * from HoaDon";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {				
			HoaDon hoaDon = new HoaDon(
					rs.getInt("MaHoaDon"),
					rs.getInt("IDNguoiMua"),
					rs.getDate("NgayTao"),
					rs.getInt("TongTien"),
					rs.getString("diachi"),
					rs.getString("TrangThai")
					);
			DanhSachHoaDon.add(hoaDon);	
		}
			
		return DanhSachHoaDon;
	}
	
	public static List<HoaDon> DanhSachHoaDonCuaKhach(Connection conn, int id, int thang, int nam) throws SQLException {
		List<HoaDon> DanhSachHoaDon = new ArrayList<HoaDon>();
		String sql = "select * from fn_GetHoaDonChiTiet(?, ?, ?)";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);
		ps.setInt(2, thang);
		ps.setInt(3, nam);
		
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			ChiTietHoaDon chitiet = new ChiTietHoaDon();
			chitiet.setSoLuongDaMua(rs.getInt("SoLuong"));
			HoaDon hoaDon = new HoaDon(
					chitiet,
					rs.getInt("MaHoaDon"),
					rs.getInt("IDNguoiMua"),
					rs.getDate("NgayTao"),
					rs.getInt("TongTien"),
					rs.getString("diachi"),
					rs.getString("TrangThai")
					);
			DanhSachHoaDon.add(hoaDon);	
		}
			
		return DanhSachHoaDon;
	}
	
    public static boolean capNhatTrangThai(Connection conn, int maHoaDon, String trangThai) throws SQLException {
        String sql = "UPDATE HoaDon SET TrangThai = ? WHERE MaHoaDon = ?";
        if (trangThai.equals("Đã giao")) { 	
        	String sqlUpdate = "{call proc_capNhatSoLuongDaBan(?)}";
        	PreparedStatement psUpdate = conn.prepareStatement(sqlUpdate);
        	psUpdate.setInt(1, maHoaDon);
        	psUpdate.executeUpdate();
        }
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, trangThai);
            ps.setInt(2, maHoaDon);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        }
    }
}
