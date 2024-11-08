package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class DiaChiDAO {
	public static List<String> LayDanhSachDiaChi(Connection conn) throws SQLException {
		List<String> listDC = new ArrayList<String>();
		String sql = "select TenDiaChi from DiaChiNhanHang where DiaChiNhanHang.IDNguoiDung = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, AccountDAO.getID());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			listDC.add(rs.getString("TenDiaChi"));
		}
		return listDC;
	}
}
