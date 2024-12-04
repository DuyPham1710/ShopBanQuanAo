package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.GioHang;
import models.HinhAnhSanPham;
import models.KichCo;
import models.MauSac;
import models.SanPham;

public class GioHangDAO {
	public static void ThemGioHang(Connection conn, GioHang gh) throws SQLException {
		 String checkSQL = "select 1 FROM GioHang where IDNguoiMua = ? and MaSanPham = ? and MaKichCo = ? and MaMau = ?";
		 String sql = "";
		 PreparedStatement checkStmt = conn.prepareStatement(checkSQL);
		 checkStmt.setInt(1, AccountDAO.getID()); 
		 checkStmt.setInt(2, gh.getSanPham().getMaSP()); 
		 checkStmt.setInt(3, gh.getSanPham().getKichCo().get(0).getMaKichCo()); 
		 checkStmt.setInt(4, gh.getSanPham().getMauSac().get(0).getMaMau()); 
      
		 ResultSet rs = checkStmt.executeQuery();
         if (rs.next()) {
             // Nếu sản phẩm đã tồn tại, cập nhật số lượng
        	 sql = "{call proc_CapNhatGioHang(?, ?, ?, ?, ?)}";
         } 
         else {
             // Nếu sản phẩm chưa có, thêm mới sản phẩm vào giỏ hàng
        	 sql = "{call proc_ThemGioHang(?, ?, ?, ?, ?)}";
         }
         CallableStatement stmt = conn.prepareCall(sql) ;
         stmt.setInt(1, AccountDAO.getID()); 
         stmt.setInt(2, gh.getSanPham().getMaSP()); 
         stmt.setInt(3, gh.getSanPham().getKichCo().get(0).getMaKichCo()); 
         stmt.setInt(4, gh.getSanPham().getMauSac().get(0).getMaMau()); 
         stmt.setInt(5, gh.getSoLuongGH());   
    
         stmt.executeUpdate();
		
	}
	public static void XoaGioHang(Connection conn, int maSP, int maKichThuoc, int maMau) throws SQLException {
       	String sql = "{call proc_XoaGioHang(?, ?, ?)}";
        CallableStatement stmt = conn.prepareCall(sql) ;
        stmt.setInt(1, maSP); 
        stmt.setInt(2, maKichThuoc); 
        stmt.setInt(3, maMau); 
        stmt.executeUpdate();
		
	}
	public static List<GioHang> DanhSachGioHang(Connection conn) throws SQLException {
		List<GioHang> listGH = new ArrayList<GioHang>();
		String sql = "{call proc_DanhSachGioHang(?,0,0,0)}";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, AccountDAO.getID());
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {			
			int giaHienTai = (int)(rs.getFloat("GiaHienTai"));
			
			KichCo size = new KichCo(rs.getInt("MaKichCo"), rs.getString("TenKichCo"));
			MauSac color = new MauSac(rs.getInt("MaMau"), rs.getString("TenMau"));
			HinhAnhSanPham hinhAnhSP = new HinhAnhSanPham();
			hinhAnhSP.setDuongDanHinh(rs.getString("DuongDanHinh"));
			SanPham sp = new SanPham(
					rs.getInt("maSP"), 
					rs.getString("TenSanPham"), 
					rs.getInt("GiaBanDau"), 
					giaHienTai, 
					rs.getInt("SoLuongSP"),
					size,
					color,
					hinhAnhSP);
		
			GioHang gh = new GioHang(sp, rs.getInt("SoLuongGH"));
			
			listGH.add(gh);	
		}
		return listGH;
	}
	public static List<GioHang> DanhSachGioHangThanhToan(Connection conn,String[] listMa) throws SQLException {
		List<GioHang> listGH = new ArrayList<GioHang>();
		
		for(int i=0;i<listMa.length;i+=3) {
			String sql = "{call proc_DanhSachGioHang(?,?,?,?)}";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, AccountDAO.getID());
			ps.setInt(2,Integer.parseInt(listMa[i].trim()));
			ps.setInt(3,Integer.parseInt(listMa[i+1].trim()));
			ps.setInt(4,Integer.parseInt(listMa[i+2].trim()));
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {			
				int giaHienTai = (int)(rs.getFloat("GiaHienTai"));
				
				KichCo size = new KichCo(rs.getInt("MaKichCo"), rs.getString("TenKichCo"));
				MauSac color = new MauSac(rs.getInt("MaMau"), rs.getString("TenMau"));
				HinhAnhSanPham hinhAnhSP = new HinhAnhSanPham();
				hinhAnhSP.setDuongDanHinh(rs.getString("DuongDanHinh"));
				SanPham sp = new SanPham(
						rs.getInt("maSP"), 
						rs.getString("TenSanPham"), 
						rs.getInt("GiaBanDau"), 
						giaHienTai, 
						rs.getInt("SoLuongSP"),
						size,
						color,
						hinhAnhSP);
				GioHang gh = new GioHang(sp, rs.getInt("SoLuongGH"));
				listGH.add(gh);	
			}
		}
		
		return listGH;
	}
}
