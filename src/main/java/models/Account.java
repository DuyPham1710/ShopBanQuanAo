package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DBConnection.ConnectJDBC;

public class Account {
	private String username;
	private String password;
	private String position;
	public Account(String username, String password) {
		this.username = username;
		this.password = password;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public int validate() {
		String sql = "select ID from Account where username = ? and pass = ?";
		try {
			Connection conn = new ConnectJDBC().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {	
				return rs.getInt("ID");
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		return 0;
		
	}
}
