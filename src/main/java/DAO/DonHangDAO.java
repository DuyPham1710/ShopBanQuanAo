package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.ChiTietHoaDon;
import models.DonMua;
import models.HinhAnhSanPham;
import models.KichCo;
import models.MauSac;
import models.SanPham;

public class DonHangDAO {
	public static List<DonMua> DanhSachDonHang(Connection conn) throws SQLException {
		List<DonMua> DanhSachDonHang = new ArrayList<DonMua>();
		String sql = "{call proc_LoadThongTinDonHang(?)}";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, AccountDAO.getID());
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {	
			HinhAnhSanPham hinhAnhSP = new HinhAnhSanPham(rs.getInt("MaHinhAnh"), rs.getString("DuongDanHinh"));
			KichCo size = new KichCo(rs.getInt("MaKichCo"), rs.getString("TenKichCo"));
			MauSac color = new MauSac(rs.getInt("MaMau"), rs.getString("TenMau"));
			int donGia = (int)(rs.getFloat("DonGia"));
			
			SanPham sp = new SanPham(
					rs.getInt("maSP"), 
					rs.getString("TenSanPham"), 
					rs.getInt("GiaBanDau"), 
					donGia, 
					rs.getInt("SoLuongSP"),
					size,
					color,
					hinhAnhSP);
			
			DonMua donMua = new DonMua(
					rs.getInt("maHoaDon"),
					sp,
					rs.getString("TrangThai"),
					rs.getInt("SoLuongDaMua"),
					rs.getInt("GiaBan"),
					rs.getInt("TongTien"),
					rs.getString("diachi"),
					rs.getDate("ngayDat"));
			
			DanhSachDonHang.add(donMua);	
		}
			
		return DanhSachDonHang;
	}
	
	public static DonMua LoadThongTinMotDonHangChoAD(Connection conn, int maHoaDon, int idNguoiMua) throws SQLException {
		List<ChiTietHoaDon> listChiTietHD = new ArrayList<ChiTietHoaDon>();
	    String sql = "{call proc_LoadThongTinMotDonHang(?, ?)}";

	    PreparedStatement ps = conn.prepareStatement(sql);
	    ps.setInt(1, idNguoiMua);
	    ps.setInt(2, maHoaDon);
	    ResultSet rs = ps.executeQuery();
	    String trangThai = "";
	    int tongTien = 0;
	    while (rs.next()) {
	    	trangThai = rs.getString("TrangThai");
	    	tongTien = rs.getInt("TongTien");
	        HinhAnhSanPham hinhAnhSP = new HinhAnhSanPham(rs.getInt("MaHinhAnh"), rs.getString("DuongDanHinh"));
	        KichCo size = new KichCo(rs.getInt("MaKichCo"), rs.getString("TenKichCo"));
	        MauSac color = new MauSac(rs.getInt("MaMau"), rs.getString("TenMau"));
	        int donGia = (int) (rs.getFloat("DonGia"));

	        SanPham sp = new SanPham(
	                rs.getInt("maSP"),
	                rs.getString("TenSanPham"),
	                rs.getInt("GiaBanDau"),
	                donGia,
	                rs.getInt("SoLuongSP"),
	                size,
	                color,
	                hinhAnhSP
	        );

	        ChiTietHoaDon chiTietHD = new ChiTietHoaDon(
	                sp,
	                rs.getInt("SoLuongDaMua"),
	                rs.getInt("DonGia"),
	                rs.getInt("GiaBan")
	        );      
	        
	        listChiTietHD.add(chiTietHD);
	    }
	    System.out.print(listChiTietHD.size());
	    DonMua donMua = new DonMua(maHoaDon, trangThai, tongTien, listChiTietHD);
	    return donMua;
	}
}
