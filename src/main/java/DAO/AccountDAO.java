package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Account;
import models.SanPham;

public class AccountDAO {
	private static int ID = 0;
	public static int Validate(Connection conn, Account acount) throws SQLException {
		String sql = "select ID from Account where username = ? and pass = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, acount.getUsername());
		ps.setString(2, acount.getPassword());
		ResultSet rs = ps.executeQuery();
		
		if (rs.next()) {	
			ID = rs.getInt("ID");
			return rs.getInt("ID");
		}
		return 0;
	}
	public static int getID() {
		return ID;
	}
	public static void setID(int ID) {
		AccountDAO.ID = ID;
	}
	
}
