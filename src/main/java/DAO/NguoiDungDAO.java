package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import models.NguoiDung;

public class NguoiDungDAO {
public static NguoiDung LayThongTinNguoiDung(Connection conn) throws SQLException {
		
		String sql = "select NguoiDung.*, TenDiaChi from NguoiDung, DiaChiNhanHang where NguoiDung.Madiachi = DiaChiNhanHang.Madiachi and NguoiDung.ID = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, AccountDAO.getID());
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			NguoiDung nguoiDung = new NguoiDung(
					rs.getString("CCCD"), 
					rs.getString("HoTen"), 
					rs.getString("GioiTinh"), 
					rs.getString("SDT"), 
					rs.getDate("NgaySinh"), 
					rs.getInt("MaDiaChi"), 
					rs.getString("TenDiaChi"), 
					rs.getString("email"));
		
			return nguoiDung;
		}
		return null;
	}
}
