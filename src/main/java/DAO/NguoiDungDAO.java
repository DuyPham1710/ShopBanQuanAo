package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Account;
import models.DiaChiNhanHang;
import models.NguoiDung;

public class NguoiDungDAO {
	public static NguoiDung LayThongTinNguoiDung(Connection conn) throws SQLException {
			
		String sql = "select * from NguoiDung where NguoiDung.ID = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, AccountDAO.getID());
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			sql = "select Madiachi, TenDiaChi from DiaChiNhanHang where DiaChiNhanHang.IDNguoiDung = ?";
			PreparedStatement psDC = conn.prepareStatement(sql);
			psDC.setInt(1, AccountDAO.getID());
			ResultSet rsDC = psDC.executeQuery();
			List<DiaChiNhanHang> diaChiNhanHang = new ArrayList<DiaChiNhanHang>();
			while (rsDC.next()) {
				DiaChiNhanHang diaChi = new DiaChiNhanHang(rsDC.getInt("Madiachi"), rsDC.getString("TenDiaChi"));
				diaChiNhanHang.add(diaChi);
			}
			NguoiDung nguoiDung = new NguoiDung(
					rs.getString("CCCD"), 
					rs.getString("HoTen"), 
					rs.getString("GioiTinh"), 
					rs.getString("SDT"), 
					rs.getDate("NgaySinh"), 
					rs.getString("email"),
					diaChiNhanHang);
		
			return nguoiDung;
		}
		return null;
	}
	
	public static NguoiDung ThongTinCaNhan(Connection conn) throws SQLException {
		NguoiDung nguoi = null;
		String sql = "select NguoiDung.*, username, pass from NguoiDung, Account where NguoiDung.ID = Account.ID and NguoiDung.ID = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, AccountDAO.getID());
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			Account account = new Account(rs.getString("username"), rs.getString("pass"));
			nguoi = new NguoiDung(
					account,
					rs.getString("CCCD"), 
					rs.getString("HoTen"), 
					rs.getString("GioiTinh"), 
					rs.getString("SDT"), 
					rs.getDate("NgaySinh"), 
					rs.getString("email"));
		
			
		}
		return nguoi;
	}
	
	public static NguoiDung LayThongTinNguoiDung_DonHang(Connection conn, int maHoaDon) throws SQLException {
		String sql = "{call proc_ThongTinNguoiDung_HoaDon(?, ?)}";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, AccountDAO.getID());
		ps.setInt(2, maHoaDon);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {		
			List<DiaChiNhanHang> diaChiNhanHang = new ArrayList<DiaChiNhanHang>();
			DiaChiNhanHang diaChi = new DiaChiNhanHang(1, rs.getString("DiaChi"));
			diaChiNhanHang.add(diaChi);
		
			NguoiDung nguoiDung = new NguoiDung(				
					rs.getString("HoTen"), 					
					rs.getString("SDT"), 	
					rs.getString("email"),
					diaChiNhanHang);
		
			return nguoiDung;
		}
		return null;
	}
}
