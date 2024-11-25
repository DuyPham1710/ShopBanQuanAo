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
	public static List<SanPham> DanhSachSP(Connection conn, int maDanhMuc, int sortType) throws SQLException {
		List<SanPham> listSP = new ArrayList<SanPham>();
		String sql = "";
		if (maDanhMuc == 0) {
			sql = "select sp.MaSanPham as maSP, TenSanPham, MoTa, GiaBanDau, GiamGia, SoLuong, sp.MaDanhMuc as maDanhMuc, TenDanhMuc, MaHinhAnh, DuongDanHinh "
					+ "from SanPham as sp, HinhAnhSanPham as img, DanhMucSanPham "
					+ "where sp.MaSanPham = img.MaSanPham and sp.MaDanhMuc = DanhMucSanPham.MaDanhMuc";
		}
		else {
			sql = "select sp.MaSanPham as maSP, TenSanPham, MoTa, GiaBanDau, GiamGia, SoLuong, sp.MaDanhMuc as maDanhMuc, TenDanhMuc, MaHinhAnh, DuongDanHinh "
					+ "from SanPham as sp, HinhAnhSanPham as img, DanhMucSanPham "
					+ "where sp.MaSanPham = img.MaSanPham and sp.MaDanhMuc = DanhMucSanPham.MaDanhMuc and DanhMucSanPham.MaDanhMuc = " + maDanhMuc;
		}

	    switch (sortType) {
	        case 1:
	            sql += " ORDER BY sp.GiaBanDau - (sp.GiaBanDau * sp.GiamGia/100) ASC"; // Giá: Tăng dần
	            break;
	        case 2:
	            sql += " ORDER BY sp.GiaBanDau - (sp.GiaBanDau * sp.GiamGia/100) DESC"; // Giá: Giảm dần
	            break;
	        case 3:
	            sql += " ORDER BY TenSanPham ASC"; // Tên: A-Z
	            break;
	        case 4:
	            sql += " ORDER BY TenSanPham DESC"; // Tên: Z-A
	            break;
	        case 5:
	         //   sql += " ORDER BY NgayTao ASC"; // Cũ nhất
	            break;
	        case 6:
	         //   sql += " ORDER BY NgayTao DESC"; // Mới nhất
	            break;
	        case 7:
	        //    sql += " ORDER BY SoLuongBan DESC"; // Bán chạy nhất
	            break;
	        case 8:
	            sql += " ORDER BY SoLuong DESC"; // Tồn kho: Giảm dần
	            break;
	        default:
	          //  sql += " ORDER BY SanPhamNoiBat DESC"; // Sản phẩm nổi bật
	            break;
	    }
	    
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
	
	public static List<SanPham> filterByPrice(Connection conn, int min, int max) throws SQLException {
		List<SanPham> listSP = new ArrayList<SanPham>();
		String sql = "select sp.MaSanPham as maSP, TenSanPham, MoTa, GiaBanDau, GiamGia, SoLuong, sp.MaDanhMuc as maDanhMuc, TenDanhMuc, MaHinhAnh, DuongDanHinh "
					+ "from SanPham as sp, HinhAnhSanPham as img, DanhMucSanPham "
					+ "where sp.MaSanPham = img.MaSanPham and sp.MaDanhMuc = DanhMucSanPham.MaDanhMuc and sp.GiaBanDau - (sp.GiaBanDau * sp.GiamGia/100) BETWEEN ? AND ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, min);
        ps.setInt(2, max);
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
	
	public static List<DanhMucSanPham> DanhSachDanhMucSP(Connection conn) throws SQLException {
		List<DanhMucSanPham> listDanhMuc = new ArrayList<DanhMucSanPham>();
		String sql = "select * from DanhMucSanPham";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {	
			DanhMucSanPham danhMuc = new DanhMucSanPham(rs.getInt("maDanhMuc"), rs.getString("TenDanhMuc"));			
			listDanhMuc.add(danhMuc);	
		}
		return listDanhMuc;
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
	
	public static SanPham layThongTinSPThanhToan(Connection conn, int maSP, int maKichCo, int maMau) throws SQLException {		
		String sql = "{call proc_layThongTinSPThanhToan(?, ?, ?)}";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, maSP);
		ps.setInt(2, maKichCo);
		ps.setInt(3, maMau);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			int giaHienTai = (int)(rs.getFloat("GiaHienTai"));
			HinhAnhSanPham hinhAnhSP = new HinhAnhSanPham(rs.getInt("MaHinhAnh"), rs.getString("DuongDanHinh"));
			KichCo size = new KichCo(rs.getInt("MaKichCo"), rs.getString("TenKichCo"));
			MauSac color = new MauSac(rs.getInt("MaMau"), rs.getString("TenMau"));
			SanPham sp = new SanPham(
					rs.getInt("maSP"), 
					rs.getString("TenSanPham"), 
					rs.getInt("GiaBanDau"), 
					giaHienTai, 
					rs.getInt("SoLuong"), 
					size,
					color,
					hinhAnhSP);
			return sp;
		}
		return null;
	}

}

