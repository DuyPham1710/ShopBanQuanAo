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
	
	public static SanPham layThongTinSanPham(Connection conn, int maSP, String tenSP, String mota, float gia, int soLuong, int maDanhMuc, int maKichCo, int maMau, int maHinhAnh, String duongDanHinh) throws SQLException {
		SanPham sp = new SanPham();
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
}
