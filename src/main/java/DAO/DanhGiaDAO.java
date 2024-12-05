package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import models.ChiTietHoaDon;
import models.DanhGia;
import models.HinhAnhSanPham;
import models.KichCo;
import models.MauSac;
import models.NguoiDung;
import models.SanPham;

public class DanhGiaDAO {
	public static boolean danhGiaSanPham(Connection conn, int maSP, int maChiTiet, String comment, int rating) throws SQLException {
		String sql = "{call proc_ThemDanhGia(?, ?, ?, ?, ?, ?)}";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, AccountDAO.getID());
		ps.setInt(2, maSP);
		ps.setInt(3, maChiTiet);
		ps.setString(4, comment);
		ps.setInt(5, rating);
		LocalDate today = LocalDate.now(); // Lấy ngày hôm nay
	    ps.setDate(6, Date.valueOf(today)); // Chuyển LocalDate thành java.sql.Date
		ps.executeUpdate();
		return true;
	}
	
	public static List<DanhGia> DanhSachDanhGia(Connection conn) throws SQLException {
		List<DanhGia> listDanhGia = new ArrayList<DanhGia>();
		String sql = "select Hoten, DanhGia.* from DanhGia, NguoiDung where DanhGia.IDNguoiMua = NguoiDung.ID";// and IDNguoiMua = " + AccountDAO.getID();
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {
			SanPham sp = new SanPham();
			sp.setMaSP(rs.getInt("MaSanPham"));
			ChiTietHoaDon chiTietHD = new ChiTietHoaDon();
			chiTietHD.setMaChiTiet(rs.getInt("MaChiTiet"));
			NguoiDung nguoiDung = new NguoiDung();
			nguoiDung.setHoTen(rs.getString("HoTen")); 
			DanhGia dg = new DanhGia(nguoiDung, sp, chiTietHD, rs.getString("BinhLuan"), rs.getInt("SoSao"), rs.getDate("ngayDanhGia"), rs.getString("TrangThaiDanhGia"));
			listDanhGia.add(dg);
		}
		return listDanhGia;
		
	}
	
	public static List<DanhGia> LoadDanhSachDanhGia(Connection conn, String trangThai) throws SQLException {
		List<DanhGia> listDanhGia = new ArrayList<DanhGia>();
		 String sql = "{call proc_LoadThongTinDanhGia(?, ?)}";

	    PreparedStatement ps = conn.prepareStatement(sql);
	    ps.setInt(1, AccountDAO.getID());
	    ps.setString(2, trangThai);
	    ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {
			SanPham sp = new SanPham();
			sp.setMaSP(rs.getInt("maSP"));
			sp.setTenSP(rs.getString("TenSanPham"));
			
			HinhAnhSanPham hinhAnhSP = new HinhAnhSanPham(rs.getInt("MaHinhAnh"), rs.getString("DuongDanHinh"));
			sp.setHinhAnhSP(hinhAnhSP);
			
			KichCo size = new KichCo(rs.getInt("MaKichCo"), rs.getString("TenKichCo"));
		    MauSac color = new MauSac(rs.getInt("MaMau"), rs.getString("TenMau"));
		    
		    List<KichCo> listSize = new ArrayList<KichCo>();
		    listSize.add(size);
		    
		    List<MauSac> ListColor = new ArrayList<MauSac>();
		    ListColor.add(color);
		    
		    sp.setMauSac(ListColor);
		    sp.setKichCo(listSize);
		    
			ChiTietHoaDon chiTietHD = new ChiTietHoaDon();
			chiTietHD.setMaChiTiet(rs.getInt("maChiTiet"));
			
			NguoiDung nguoiDung = new NguoiDung();
			nguoiDung.setHoTen(rs.getString("HoTen")); 
			
			DanhGia dg = new DanhGia(nguoiDung, sp, chiTietHD, rs.getString("BinhLuan"), rs.getInt("SoSao"), rs.getDate("ngayDanhGia"), rs.getString("TrangThaiDanhGia"));
			listDanhGia.add(dg);
		}
		return listDanhGia;
		
	}
	
	public static List<DanhGia> LoadDanhSachDanhGiaMotSP(Connection conn) throws SQLException {
		List<DanhGia> listDanhGia = new ArrayList<DanhGia>();
		 String sql = "{call proc_LoadThongTinDanhGiaMotSP}";

	    PreparedStatement ps = conn.prepareStatement(sql);
	    ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {
			SanPham sp = new SanPham();
			sp.setMaSP(rs.getInt("maSP"));
//			sp.setTenSP(rs.getString("TenSanPham"));
//			
//			HinhAnhSanPham hinhAnhSP = new HinhAnhSanPham(rs.getInt("MaHinhAnh"), rs.getString("DuongDanHinh"));
//			sp.setHinhAnhSP(hinhAnhSP);
			
			KichCo size = new KichCo(rs.getInt("MaKichCo"), rs.getString("TenKichCo"));
		    MauSac color = new MauSac(rs.getInt("MaMau"), rs.getString("TenMau"));
		    
		    List<KichCo> listSize = new ArrayList<KichCo>();
		    listSize.add(size);
		    
		    List<MauSac> ListColor = new ArrayList<MauSac>();
		    ListColor.add(color);
		    
		    sp.setMauSac(ListColor);
		    sp.setKichCo(listSize);
		    
			ChiTietHoaDon chiTietHD = new ChiTietHoaDon();
			chiTietHD.setMaChiTiet(rs.getInt("maChiTiet"));
			
			NguoiDung nguoiDung = new NguoiDung();
			nguoiDung.setHoTen(rs.getString("HoTen")); 
			
			DanhGia dg = new DanhGia(nguoiDung, sp, chiTietHD, rs.getString("BinhLuan"), rs.getInt("SoSao"), rs.getDate("ngayDanhGia"), rs.getString("TrangThaiDanhGia"));
			listDanhGia.add(dg);
		}
		return listDanhGia;
		
	}
}
