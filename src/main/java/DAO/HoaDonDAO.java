package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.tags.shaded.org.apache.xpath.axes.ChildTestIterator;

import models.ChiTietHoaDon;
import models.DanhGia;
import models.HinhAnhSanPham;
import models.HoaDon;
import models.KichCo;
import models.MauSac;
import models.SanPham;

public class HoaDonDAO {
	public static List<HoaDon> DanhSachHoaDon(Connection conn) throws SQLException {
		List<HoaDon> DanhSachHoaDon = new ArrayList<HoaDon>();
		String sql = "select * from HoaDon";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {				
			HoaDon hoaDon = new HoaDon(
					rs.getInt("MaHoaDon"),
					rs.getInt("IDNguoiMua"),
					rs.getDate("NgayTao"),
					rs.getInt("TongTien"),
					rs.getString("diachi"),
					rs.getString("TrangThai")
					);
			DanhSachHoaDon.add(hoaDon);	
		}
			
		return DanhSachHoaDon;
	}
	
	public static List<HoaDon> DanhSachHoaDonCuaKhach(Connection conn, int id, int thang, int nam) throws SQLException {
		List<HoaDon> DanhSachHoaDon = new ArrayList<HoaDon>();
		String sql = "select * from fn_GetHoaDonChiTiet(?, ?, ?)";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);
		ps.setInt(2, thang);
		ps.setInt(3, nam);
		
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			HinhAnhSanPham ha = new HinhAnhSanPham();
			ha.setDuongDanHinh(rs.getString("HinhAnh"));
			
			KichCo size = new KichCo(rs.getInt("MaKichCo"), rs.getString("KichCo"));
			MauSac color = new MauSac(rs.getInt("MaMau"), rs.getString("Mau"));
			
			SanPham sp = new SanPham(rs.getString("TenSanPham"),ha,size,color);
			
			DanhGia dg = new DanhGia();
			dg.setSoSao(rs.getInt("SoSao"));
			dg.setBinhLuan(rs.getString("BinhLuan"));
			
			ChiTietHoaDon chitiet = new ChiTietHoaDon();
			chitiet.setSoLuongDaMua(rs.getInt("SoLuong"));
			chitiet.setSp(sp);
			chitiet.setDanhGia(dg);
			
			HoaDon hoaDon = new HoaDon(
					chitiet,
					rs.getInt("MaHoaDon"),
					rs.getInt("IDNguoiMua"),
					rs.getDate("NgayTao"),
					rs.getInt("TongTien"),
					rs.getString("DiaChiGiaoHang"),
					rs.getString("TrangThai")
					);
			DanhSachHoaDon.add(hoaDon);	
		}
			
		return DanhSachHoaDon;
	}
	
    public static boolean capNhatTrangThai(Connection conn, int maHoaDon, String trangThai, int userId) throws SQLException {
        String sql = "UPDATE HoaDon SET TrangThai = ? WHERE MaHoaDon = ?";
        if (trangThai.equals("Đã giao")) { 	
        	String sqlUpdate = "{call proc_capNhatSoLuongDaBan(?, ?)}";
        	PreparedStatement psUpdate = conn.prepareStatement(sqlUpdate);
        	psUpdate.setInt(1, userId);
        	psUpdate.setInt(2, maHoaDon);
        	psUpdate.executeUpdate();
        }

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, trangThai);
            ps.setInt(2, maHoaDon);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        }
    }
}
