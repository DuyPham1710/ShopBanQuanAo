package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.DanhMucSanPham;
import models.HinhAnhSanPham;
import models.KichCo;
import models.MauSac;
import models.SanPham;

public class SanPhamDAO {
	public static List<SanPham> DanhSachSP(Connection conn) throws SQLException {
		List<SanPham> listSP = new ArrayList<SanPham>();
		String sql = "select sp.MaSanPham as maSP, TenSanPham, MoTa, GiaBanDau, GiamGia, SoLuong, sp.MaDanhMuc as maDanhMuc, TenDanhMuc, MaHinhAnh, DuongDanHinh "
				+ "from SanPham as sp, HinhAnhSanPham as img, DanhMucSanPham "
				+ "where sp.MaSanPham = img.MaSanPham and sp.MaDanhMuc = DanhMucSanPham.MaDanhMuc";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {	
			int giaBanDau = (int)(rs.getFloat("GiaBanDau"));
			HinhAnhSanPham hinhAnhSP = new HinhAnhSanPham(rs.getInt("MaHinhAnh"), rs.getString("DuongDanHinh"));
			DanhMucSanPham danhMuc = new DanhMucSanPham(rs.getInt("maDanhMuc"), rs.getString("TenDanhMuc"));
			SanPham sp = new SanPham(
					rs.getInt("maSP"), 
					rs.getString("TenSanPham"), 
					rs.getString("MoTa"), 
					giaBanDau,
					rs.getInt("GiamGia"), 
					rs.getInt("SoLuong"),
					danhMuc,
					hinhAnhSP);
			
			listSP.add(sp);	
		}
		return listSP;
	}
	
	public static SanPham layThongTinSP(Connection conn, int maSP) throws SQLException {
		
		String sql = "select sp.MaSanPham as maSP, TenSanPham, MoTa, GiaBanDau, GiamGia, SoLuong, sp.MaDanhMuc as maDanhMuc, TenDanhMuc, MaHinhAnh, DuongDanHinh "
				+ "from SanPham as sp, HinhAnhSanPham as img, DanhMucSanPham "
				+ "where sp.MaSanPham = img.MaSanPham and sp.MaDanhMuc = DanhMucSanPham.MaDanhMuc and sp.MaSanPham = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, maSP);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			int giaBanDau = (int)(rs.getFloat("GiaBanDau"));
			HinhAnhSanPham hinhAnhSP = new HinhAnhSanPham(rs.getInt("MaHinhAnh"), rs.getString("DuongDanHinh"));
			DanhMucSanPham danhMuc = new DanhMucSanPham(rs.getInt("maDanhMuc"), rs.getString("TenDanhMuc"));
			SanPham sp = new SanPham(
					rs.getInt("maSP"), 
					rs.getString("TenSanPham"), 
					rs.getString("MoTa"), 
					giaBanDau,
					rs.getInt("GiamGia"), 
					rs.getInt("SoLuong"), 
					danhMuc,
					hinhAnhSP);
			return sp;
		}
		return null;
	}
	
	
	public static List<MauSac> layMauSP(Connection conn, int maSP) throws SQLException {
	
		String sql = "select MaMau, TenMau from MauSac where MauSac.MaSanPham = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, maSP);
		ResultSet rs = ps.executeQuery();
		
		List<MauSac> listMau = new ArrayList<MauSac>();
		while (rs.next()) {
			
			MauSac mau = new MauSac(rs.getInt("MaMau"), rs.getString("TenMau"));
			listMau.add(mau);
		}
		
		return listMau;
	}
	
	public static List<KichCo> laySizeSP(Connection conn, int maSP) throws SQLException {
		
		String sql = "select MaKichCo, TenKichCo from KichCo where KichCo.MaSanPham = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, maSP);
		ResultSet rs = ps.executeQuery();
		
		List<KichCo> listSize = new ArrayList<KichCo>();
		while (rs.next()) {	
			KichCo size = new KichCo(rs.getInt("MaKichCo"), rs.getString("TenKichCo"));
			listSize.add(size);
		}
		
		return listSize;
	}
	
	public static List<SanPham> DanhSachSPTuongTu(Connection conn, int maSP, int maDanhMuc) throws SQLException {
		List<SanPham> listSP = new ArrayList<SanPham>();
		String sql = "select sp.MaSanPham as maSP, TenSanPham, MoTa, GiaBanDau, GiamGia, SoLuong, sp.MaDanhMuc as maDanhMuc, TenDanhMuc, MaHinhAnh, DuongDanHinh "
				+ "from SanPham as sp, HinhAnhSanPham as img, DanhMucSanPham "
				+ "where sp.MaSanPham = img.MaSanPham and sp.MaDanhMuc = DanhMucSanPham.MaDanhMuc and sp.MaDanhMuc = ? and sp.MaSanPham <> ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, maDanhMuc);
		ps.setInt(2, maSP);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {	
			int giaBanDau = (int)(rs.getFloat("GiaBanDau"));
			HinhAnhSanPham hinhAnhSP = new HinhAnhSanPham(rs.getInt("MaHinhAnh"), rs.getString("DuongDanHinh"));
			DanhMucSanPham danhMuc = new DanhMucSanPham(rs.getInt("maDanhMuc"), rs.getString("TenDanhMuc"));
			SanPham sp = new SanPham(
					rs.getInt("maSP"), 
					rs.getString("TenSanPham"), 
					rs.getString("MoTa"), 
					giaBanDau,
					rs.getInt("GiamGia"), 
					rs.getInt("SoLuong"), 
					danhMuc,
					hinhAnhSP);
			
			listSP.add(sp);	
		}
		return listSP;
	}
}
