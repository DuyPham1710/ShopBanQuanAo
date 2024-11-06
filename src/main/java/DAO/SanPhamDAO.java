package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.SanPham;

public class SanPhamDAO {
	public static List<SanPham> DanhSachSP(Connection conn) throws SQLException {
		List<SanPham> listSP = new ArrayList<SanPham>();
		String sql = "select sp.MaSanPham as maSP, TenSanPham, MoTa, GiaBanDau, GiamGia, SoLuong, MaDanhMuc, MaHinhAnh, DuongDanHinh from SanPham as sp, HinhAnhSanPham as img where sp.MaSanPham = img.MaSanPham";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {	
			int giaBanDau = (int)(rs.getFloat("GiaBanDau"));
			SanPham sp = new SanPham(
					rs.getInt("maSP"), 
					rs.getString("TenSanPham"), 
					rs.getString("MoTa"), 
					giaBanDau,
					rs.getInt("GiamGia"), 
					rs.getInt("SoLuong"), 
					rs.getInt("MaDanhMuc"), 
					rs.getInt("MaHinhAnh"), 
					rs.getString("DuongDanHinh"));
			
			listSP.add(sp);	
		}
		return listSP;
	}
	
	public static SanPham layThongTinSP(Connection conn, int maSP) throws SQLException {
		
		String sql = "select sp.MaSanPham as maSP, TenSanPham, MoTa, GiaBanDau, GiamGia, SoLuong, MaDanhMuc, MaHinhAnh, DuongDanHinh from SanPham as sp, HinhAnhSanPham as img where sp.MaSanPham = img.MaSanPham and sp.MaSanPham = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, maSP);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			int giaBanDau = (int)(rs.getFloat("GiaBanDau"));
			SanPham sp = new SanPham(
					rs.getInt("maSP"), 
					rs.getString("TenSanPham"), 
					rs.getString("MoTa"), 
					giaBanDau,
					rs.getInt("GiamGia"), 
					rs.getInt("SoLuong"), 
					rs.getInt("MaDanhMuc"), 
					rs.getInt("MaHinhAnh"), 
					rs.getString("DuongDanHinh"));
			return sp;
		}
		return null;
	}
	
	
	public static List<SanPham> layMauSP(Connection conn, int maSP) throws SQLException {
	
		String sql = "select MaMau, TenMau from MauSac where MauSac.MaSanPham = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, maSP);
		ResultSet rs = ps.executeQuery();
		
		List<SanPham> listMau = new ArrayList<SanPham>();
		while (rs.next()) {
			SanPham sp = new SanPham(rs.getInt("MaMau"), rs.getString("TenMau"));
			listMau.add(sp);
		}
		return listMau;
	}
	
	public static List<SanPham> laySizeSP(Connection conn, int maSP) throws SQLException {
		
		String sql = "select MaKichCo, TenKichCo from KichCo where KichCo.MaSanPham = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, maSP);
		ResultSet rs = ps.executeQuery();
		
		List<SanPham> listMau = new ArrayList<SanPham>();
		while (rs.next()) {	
			SanPham sp = new SanPham();
			sp.setMaKichThuoc(rs.getInt("MaKichCo"));
			sp.setTenKichThuoc(rs.getString("TenKichCo"));
			listMau.add(sp);
		}
		
		return listMau;
	}
	
	public static List<SanPham> DanhSachSPTuongTu(Connection conn, int maSP, int maDanhMuc) throws SQLException {
		List<SanPham> listSP = new ArrayList<SanPham>();
		String sql = "select sp.MaSanPham as maSP, TenSanPham, MoTa, GiaBanDau, GiamGia, SoLuong, MaDanhMuc, MaHinhAnh, DuongDanHinh "
				+ "from SanPham as sp, HinhAnhSanPham as img "
				+ "where sp.MaSanPham = img.MaSanPham and sp.MaDanhMuc = ? and sp.MaSanPham <> ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, maDanhMuc);
		ps.setInt(2, maSP);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {	
			int giaBanDau = (int)(rs.getFloat("GiaBanDau"));
			SanPham sp = new SanPham(
					rs.getInt("maSP"), 
					rs.getString("TenSanPham"), 
					rs.getString("MoTa"), 
					giaBanDau,
					rs.getInt("GiamGia"), 
					rs.getInt("SoLuong"), 
					rs.getInt("MaDanhMuc"), 
					rs.getInt("MaHinhAnh"), 
					rs.getString("DuongDanHinh"));
			
			listSP.add(sp);	
		}
		return listSP;
	}
}
