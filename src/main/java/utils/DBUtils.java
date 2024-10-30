package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.SanPham;

public class DBUtils {
	public static List<SanPham> DanhSachSP(Connection conn) throws SQLException {
		List<SanPham> listSP = new ArrayList<SanPham>();
		String sql = "select sp.MaSanPham as maSP, TenSanPham, MoTa, Gia, SoLuong, MaDanhMuc, MaKichCo, MaMau, MaHinhAnh, DuongDanHinh from SanPham as sp, HinhAnhSanPham as img where sp.MaSanPham = img.MaSanPham";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {	
			SanPham sp = new SanPham(
					rs.getInt("maSP"), 
					rs.getString("TenSanPham"), 
					rs.getString("MoTa"), 
					rs.getFloat("Gia"), 
					rs.getInt("SoLuong"), 
					rs.getInt("MaDanhMuc"), 
					rs.getInt("MaKichCo"), 
					rs.getInt("MaMau"), 
					rs.getInt("MaHinhAnh"), 
					rs.getString("DuongDanHinh"));
			
			listSP.add(sp);	
		}
		return listSP;
	}
	
	public static List<String> layMauSP(Connection conn, int maSP) throws SQLException {
	
		String sql = "select TenMau from SanPham, MauSac where SanPham.MaMau = MauSac.MaMau and SanPham.MaSanPham = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, maSP);
		ResultSet rs = ps.executeQuery();
		
		List<String> listMau = new ArrayList<String>();
		while (rs.next()) {	
			listMau.add(rs.getString("TenMau"));
		}
		return listMau;
	}
	
	public static List<String> laySizeSP(Connection conn, int maSP) throws SQLException {
		
		String sql = "select TenKichCo from SanPham, KichCo where SanPham.MaKichCo = KichCo.MaKichCo and SanPham.MaSanPham = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, maSP);
		ResultSet rs = ps.executeQuery();
		
		List<String> listMau = new ArrayList<String>();
		while (rs.next()) {	
			listMau.add(rs.getString("TenKichCo"));
		}
		return listMau;
	}
}
