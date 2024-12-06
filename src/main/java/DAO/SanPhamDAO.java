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
	public static List<String> selectedColors = new ArrayList<>();
	public static List<String> selectedSizes = new ArrayList<>();

	public static void resetFilters() {
		selectedColors = new ArrayList<>();  
	    selectedSizes = new ArrayList<>();  
	}
    
	public static List<SanPham> DanhSachSP(Connection conn, int maDanhMuc, int sortType, String searchText) throws SQLException {
		List<SanPham> listSP = new ArrayList<SanPham>();
		if (searchText != "") {
			listSP = Search(conn, searchText);
		}
		else {
			String sql = "";
			if (maDanhMuc == 0) {
				sql = "select * from V_thongTinSP";
			}
			else {
				sql = "select * from V_thongTinSP where maDanhMuc = " + maDanhMuc;
			}

		    switch (sortType) {
		    	case 0:
		    	
		    		break;
		        case 1:
		            sql += " ORDER BY GiaBanDau - (GiaBanDau * GiamGia/100) ASC"; // Giá: Tăng dần
		            break;
		        case 2:
		            sql += " ORDER BY GiaBanDau - (GiaBanDau * GiamGia/100) DESC"; // Giá: Giảm dần
		            break;
		        case 3:
		            sql += " ORDER BY TenSanPham ASC"; // Tên: A-Z
		            break;
		        case 4:
		            sql += " ORDER BY TenSanPham DESC"; // Tên: Z-A
		            break;
		        case 5:
		            sql += " ORDER BY NgayTao ASC"; // Cũ nhất
		            break;
		        case 6:
		            sql += " ORDER BY NgayTao DESC"; // Mới nhất
		            break;
		        case 7:
		            sql += " ORDER BY DaBan DESC"; // Bán chạy nhất
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
						rs.getDate("NgayTao"),
						rs.getString("XuatXu"),
						rs.getString("ChatLieu"),
						rs.getInt("DaBan"), 
						danhMuc,
						hinhAnhSP);
				
				listSP.add(sp);	
			}
			
		}
		return listSP;
	}
	
	public static List<SanPham> Search(Connection conn, String searchText) throws SQLException {
		List<SanPham> listSP = new ArrayList<SanPham>();
		String sql = "SELECT * FROM fn_TimKiemSP(?)";
	
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, searchText);
		
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
					rs.getDate("NgayTao"),
					rs.getString("XuatXu"),
					rs.getString("ChatLieu"),
					rs.getInt("DaBan"), 
					danhMuc,
					hinhAnhSP);
			
			listSP.add(sp);	
		}
		
		return listSP;
	}
	
	public static List<String> DanhSachMaMauHex(Connection conn) throws SQLException {
		List<String> listMauHex = new ArrayList<String>();
		String sql = "select distinct MaMauDangHex from MauSac";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {	
			listMauHex.add(rs.getString("MaMauDangHex"));	
		}
		return listMauHex;
	}
	
	public static List<String> ListAllSize(Connection conn) throws SQLException {
		List<String> listAllSize = new ArrayList<String>();
		String sql = "select distinct TenKichCo from KichCo";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {	
			listAllSize.add(rs.getString("TenKichCo"));	
		}
		return listAllSize;
	}
	public static List<SanPham> LocSPTheoMauVaSize(Connection conn) throws SQLException {
	    List<SanPham> listSP = new ArrayList<>();
	    String sql = "select Distinct V_thongTinSP.* from V_thongTinSP, KichCo, MauSac "
	               + "where V_thongTinSP.maSP = KichCo.MaSanPham and V_thongTinSP.maSP = MauSac.MaSanPham";

	    StringBuilder condition = new StringBuilder();

	    // Thêm điều kiện lọc màu
	    if (selectedColors != null && !selectedColors.isEmpty() && !selectedColors.get(0).equals("")) {
	        condition.append(" and MaMauDangHex IN (");
	        for (int i = 0; i < selectedColors.size(); i++) {
	            condition.append("'").append(selectedColors.get(i)).append("'");
	            if (i < selectedColors.size() - 1) {
	                condition.append(", ");
	            }
	        }
	        condition.append(")");
	    }

	    // Thêm điều kiện lọc kích thước
	    if (selectedSizes != null && !selectedSizes.isEmpty() && !selectedSizes.get(0).equals("")) {
	        condition.append(" and TenKichCo IN (");
	        for (int i = 0; i < selectedSizes.size(); i++) {
	            condition.append("'").append(selectedSizes.get(i)).append("'");
	            if (i < selectedSizes.size() - 1) {
	                condition.append(", ");
	            }
	        }
	        condition.append(")");
	    }

	    // Thêm điều kiện sắp xếp
	    condition.append(" order by maSP");

	    sql += condition.toString();

	    PreparedStatement ps = conn.prepareStatement(sql);
	    ResultSet rs = ps.executeQuery();

	    while (rs.next()) {
	        int giaBanDau = (int) (rs.getFloat("GiaBanDau"));
	        HinhAnhSanPham hinhAnhSP = new HinhAnhSanPham(rs.getInt("MaHinhAnh"), rs.getString("DuongDanHinh"));
	        DanhMucSanPham danhMuc = new DanhMucSanPham(rs.getInt("maDanhMuc"), rs.getString("TenDanhMuc"));
	        SanPham sp = new SanPham(
	                rs.getInt("maSP"),
	                rs.getString("TenSanPham"),
	                rs.getString("MoTa"),
	                giaBanDau,
	                rs.getInt("GiamGia"),
	                rs.getInt("SoLuong"),
	                rs.getDate("NgayTao"),
	                rs.getString("XuatXu"),
	                rs.getString("ChatLieu"),
	                rs.getInt("DaBan"),
	                danhMuc,
	                hinhAnhSP);

	        listSP.add(sp);
	    }
	 //   System.out.println(sql);
	  
	    return listSP;
	}

//	public static List<SanPham> LocSPTheoMau(Connection conn, List<String> selectedColors) throws SQLException {
//		List<SanPham> listSP = new ArrayList<SanPham>();
//		String sql = "select Distinct V_thongTinSP.* from V_thongTinSP, MauSac "
//				+ "where V_thongTinSP.maSP = MauSac.MaSanPham ";
//
//	    if (selectedColors != null && !selectedColors.isEmpty() && !selectedColors.get(0).equals("")) {
//	        StringBuilder colorsCondition = new StringBuilder(" and MaMauDangHex IN (");
//
//	        for (int i = 0; i < selectedColors.size(); i++) {
//	            colorsCondition.append("'").append(selectedColors.get(i)).append("'");
//	            if (i < selectedColors.size() - 1) {
//	                colorsCondition.append(", ");
//	            }
//	        }
//
//	        colorsCondition.append(") order by maSP");
//
//	        sql += colorsCondition.toString();
//	    }
//	    PreparedStatement ps = conn.prepareStatement(sql);
//		ResultSet rs = ps.executeQuery();
//	    while (rs.next()) {	
//			int giaBanDau = (int)(rs.getFloat("GiaBanDau"));
//			HinhAnhSanPham hinhAnhSP = new HinhAnhSanPham(rs.getInt("MaHinhAnh"), rs.getString("DuongDanHinh"));
//			DanhMucSanPham danhMuc = new DanhMucSanPham(rs.getInt("maDanhMuc"), rs.getString("TenDanhMuc"));
//			SanPham sp = new SanPham(
//					rs.getInt("maSP"), 
//					rs.getString("TenSanPham"), 
//					rs.getString("MoTa"), 
//					giaBanDau,
//					rs.getInt("GiamGia"), 
//					rs.getInt("SoLuong"),
//					rs.getDate("NgayTao"),
//					rs.getString("XuatXu"),
//					rs.getString("ChatLieu"),
//					rs.getInt("DaBan"), 
//					danhMuc,
//					hinhAnhSP);
//			
//			listSP.add(sp);	
//		}
//	  
//		return listSP;
//	}
//	
//	public static List<SanPham> LocSPTheoSize(Connection conn, List<String> selectedColors) throws SQLException {
//		List<SanPham> listSP = new ArrayList<SanPham>();
//		String sql = "select Distinct V_thongTinSP.* from V_thongTinSP, KichCo "
//				+ "where V_thongTinSP.maSP = KichCo.MaSanPham ";
//
//	    if (selectedColors != null && !selectedColors.isEmpty() && !selectedColors.get(0).equals("")) {
//	        StringBuilder colorsCondition = new StringBuilder(" and TenKichCo IN (");
//
//	        for (int i = 0; i < selectedColors.size(); i++) {
//	            colorsCondition.append("'").append(selectedColors.get(i)).append("'");
//	            if (i < selectedColors.size() - 1) {
//	                colorsCondition.append(", ");
//	            }
//	        }
//
//	        colorsCondition.append(") order by maSP");
//
//	        sql += colorsCondition.toString();
//	    }
//	    PreparedStatement ps = conn.prepareStatement(sql);
//		ResultSet rs = ps.executeQuery();
//	    while (rs.next()) {	
//			int giaBanDau = (int)(rs.getFloat("GiaBanDau"));
//			HinhAnhSanPham hinhAnhSP = new HinhAnhSanPham(rs.getInt("MaHinhAnh"), rs.getString("DuongDanHinh"));
//			DanhMucSanPham danhMuc = new DanhMucSanPham(rs.getInt("maDanhMuc"), rs.getString("TenDanhMuc"));
//			SanPham sp = new SanPham(
//					rs.getInt("maSP"), 
//					rs.getString("TenSanPham"), 
//					rs.getString("MoTa"), 
//					giaBanDau,
//					rs.getInt("GiamGia"), 
//					rs.getInt("SoLuong"),
//					rs.getDate("NgayTao"),
//					rs.getString("XuatXu"),
//					rs.getString("ChatLieu"),
//					rs.getInt("DaBan"), 
//					danhMuc,
//					hinhAnhSP);
//			
//			listSP.add(sp);	
//		}
//	  
//		return listSP;
//	}
	
	public static List<SanPham> filterByPrice(Connection conn, int min, int max) throws SQLException {
		List<SanPham> listSP = new ArrayList<SanPham>();
		String sql = "select * from V_thongTinSP where GiaBanDau - (GiaBanDau * GiamGia/100) BETWEEN ? AND ?";
		
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
					rs.getDate("NgayTao"),
					rs.getString("XuatXu"),
					rs.getString("ChatLieu"),
					rs.getInt("DaBan"), 
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
		String sql = "select * from V_thongTinSP where maSP = ?";

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
					rs.getDate("NgayTao"),
					rs.getString("XuatXu"),
					rs.getString("ChatLieu"),
					rs.getInt("DaBan"), 
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
		String sql = "select * from V_thongTinSP where maDanhMuc = ? and maSP <> ?";

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
					rs.getDate("NgayTao"),
					rs.getString("XuatXu"),
					rs.getString("ChatLieu"),
					rs.getInt("DaBan"), 
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
	
	public static List<SanPham> DanhSachBanChay(Connection conn, int nam) throws SQLException {
		List<SanPham> listSP = new ArrayList<SanPham>();
		String sql = "SELECT * FROM fn_LietKeSanPhamBanChay(?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, nam);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {	
			SanPham sp = new SanPham(
					rs.getInt("MaSanPham"), 
					rs.getString("TenSanPham"), 
					rs.getInt("TongSoLuongBan"));
			listSP.add(sp);	
		}
		return listSP;
	}
	
	public static List<Integer> ThongKeBanDuocTrongNam(Connection conn, int nam) throws SQLException {
		List<Integer> banDuoc = new ArrayList<>();
		String sql = "SELECT *FROM fn_ThongKeTongSoLuongSanPhamTheoThang(?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, nam);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {	
			int bd = rs.getInt("TongSoLuongBan");
			banDuoc.add(bd);	
		}
		return banDuoc;
	}
	
	public static List<Integer> ThongKeDoanhThuTrongNam(Connection conn, int nam) throws SQLException {
		List<Integer> doanhthu = new ArrayList<>();
		String sql = "SELECT *FROM fn_ThongKeDoanhThuTheoThang(?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, nam);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {	
			int bd = rs.getInt("TongTien");
			doanhthu.add(bd);	
		}
		return doanhthu;
	}
	
	public static List<String> DanhSachMaMauCuaSP(Connection conn,int maSP) throws SQLException {
		List<String> listMauHex = new ArrayList<String>();
		String sql = "select MaMauDangHex from MauSac where MaSanPham = ?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, maSP);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {	
			listMauHex.add(rs.getString("MaMauDangHex"));	
		}
		return listMauHex;
	}
	public static List<String> DanhSachSizeCuaSP(Connection conn,int maSP) throws SQLException {
		List<String> listSizeSP = new ArrayList<String>();
		String sql = "select TenKichCo from KichCo where MaSanPham = ?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, maSP);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {	
			listSizeSP.add(rs.getString("TenKichCo"));	
		}
		return listSizeSP;
	}
	
	public static void SuaMau(Connection conn,int maSP, List<String> listMau) throws SQLException {
		String sql = "DELETE FROM MauSac WHERE MaSanPham = ?;";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, maSP);
		for (int i = 0; i < listMau.size(); i++) {
			String sql1 = "INSERT INTO MauSac (MaMauSac, MaSanPham, TenMau, MaMauDangHex) VALUES (?, ?, ?, ?)";
			PreparedStatement ps1 = conn.prepareStatement(sql1);
			ps1.setInt(1, i+1);
			ps1.setInt(2, maSP);
			ps1.setString(3, listMau.get(i));
			ps1.setString(4, listMau.get(i));
        }
	}
	
	public static void SuaSize(Connection conn,int maSP, List<String> listSize) throws SQLException {
		String sql = "DELETE FROM KichCo WHERE MaSanPham = ?;";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, maSP);
		
		for (int i = 0; i < listSize.size(); i++) {
			String sql1 = "INSERT INTO MauSac (MaKichCo, MaSanPham, TenKichCo) VALUES (?, ?, ?)";
			PreparedStatement ps1 = conn.prepareStatement(sql1);
			ps1.setInt(1, i+1);
			ps1.setInt(2, maSP);
			ps1.setString(3, listSize.get(i));
        }
	}
	
	public static void SuaSanPham(Connection conn, SanPham sp) throws SQLException {
		String sql = "UPDATE SanPham Set TenSanPham = ?, MoTa = ?, GiaBanDau = ?, GiamGia = ?, SoLuong = ?, MaDanhMuc = ?, XuatXu = ?, ChatLieu = ? WHERE MaSanPham = ?;";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setNString(1, sp.getTenSP());
		ps.setNString(2, sp.getMota());
		ps.setInt(3, sp.getGiaBanDau());
		ps.setInt(4, sp.getGiamGia());
		ps.setInt(5, sp.getSoLuong());
		ps.setInt(6, sp.getDanhMuc().getMaDanhMuc());
		ps.setNString(7, sp.getXuatXu());
		ps.setNString(8, sp.getChatLieu());
		ps.setInt(9, sp.getMaSP());
		ps.executeUpdate();
	    
		
	}
	
	public static void SuaHinhAnh(Connection conn, SanPham sp) throws SQLException {
		String sql = "UPDATE HinhAnhSanPham "
				+ " Set DuongDanHinh = ?,"
				+ " MoTaHinh = N'Hình của sản phẩm'"
				+ "WHERE MaSanPham = ?;";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, sp.getHinhAnhSP().getDuongDanHinh());
		ps.setInt(2, sp.getMaSP());
		ps.executeUpdate();
	}
	public static int MaSPTiepTheo(Connection conn) throws SQLException{
		String sql = "SELECT ISNULL(MAX(MaSanPham), 0) + 1 AS NextMaSanPham FROM SanPham";
		try (PreparedStatement ps = conn.prepareStatement(sql);
		     ResultSet rs = ps.executeQuery()) {
		    if (rs.next()) {
		        return rs.getInt("NextMaSanPham");
		    }
		} catch (SQLException e) {
		    e.printStackTrace();
		}
		return 1;
	}
	public static void ThemSanPham(Connection conn, SanPham sp) throws SQLException {
		String sql = "INSERT INTO SanPham "
				+ "(MaSanPham, TenSanPham, MoTa, GiaBanDau, GiamGia, SoLuong, MaDanhMuc, NgayTao, XuatXu, ChatLieu, DaBan) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, sp.getMaSP());
		ps.setString(2, sp.getTenSP());
		ps.setString(3, sp.getMota());
		ps.setInt(4, sp.getGiaBanDau());
		ps.setInt(5, sp.getGiamGia());
		ps.setInt(6, sp.getSoLuong());
		ps.setInt(7, sp.getDanhMuc().getMaDanhMuc());
		ps.setDate(8, sp.getNgayTao());
		ps.setString(9, sp.getXuatXu());
		ps.setString(10, sp.getChatLieu());
		ps.executeUpdate();
	}
	public static void ThemSize(Connection conn, int maSP,List<String> listSize) throws SQLException {
		for (int i = 0; i < listSize.size(); i++) {
			String sql = "INSERT INTO KichCo (MaKichCo, MaSanPham, TenKichCo) VALUES (?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, i+1);
			ps.setInt(2, maSP);
			ps.setString(3, listSize.get(i));
			ps.executeUpdate();
        }
	}
	
	public static int ThemDanhMucMoi(Connection conn, String tenDanhMuc) throws SQLException  {
		String sql = "SELECT MAX(MaDanhMuc) AS MaxMaDanhMuc FROM DanhMucSanPham";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			int index = rs.getInt("MaxMaDanhMuc")+1;
			sql = "INSERT INTO DanhMucSanPham (MaDanhMuc, TenDanhMuc) VALUES (?, ?);";
			PreparedStatement ps1 = conn.prepareStatement(sql);
			ps1.setInt(1, index);
			ps1.setString(2, tenDanhMuc);
			ps1.executeUpdate();
			return index;
		}
		return 0;
	}
	
	public static void ThemMau(Connection conn, int maSP,List<String> listMau) throws SQLException {
		for (int i = 0; i < listMau.size(); i++) {
		//	System.out.println("a = " + listMau.get(i));
			String sqlGetTenMau = "select distinct TenMau from MauSac Where MaMauDangHex = ?";// + listMau.get(i);
			PreparedStatement psGetTenMau = conn.prepareStatement(sqlGetTenMau);
			psGetTenMau.setString(1, listMau.get(i));
			ResultSet rs = psGetTenMau.executeQuery();
			String tenMau1 = listMau.get(i);
			if (rs.next()) {	
				tenMau1 = rs.getString("TenMau");	
			}
			//System.out.println("B = " + tenMau1);
			String sql = "INSERT INTO MauSac (MaMau, MaSanPham, TenMau, MaMauDangHex) VALUES (?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, i+1);
			ps.setInt(2, maSP);
			ps.setString(3, tenMau1);
			ps.setString(4, listMau.get(i));
			ps.executeUpdate();
        }
	}
	public static void ThemMauMoi(Connection conn, int maSP,List<String> listMau,int index) throws SQLException {
		for (int i = 0; i < listMau.size(); i++) {
			
			String[] parts = listMau.get(i).split("-");
			//System.out.println("B = " + tenMau1);
			String sql = "INSERT INTO MauSac (MaMau, MaSanPham, TenMau, MaMauDangHex) VALUES (?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, index+i+1);
			ps.setInt(2, maSP);
			ps.setString(3, parts[1]);
			ps.setString(4, parts[0]);
			ps.executeUpdate();
        }
	}
	public static void ThemHinh(Connection conn, SanPham sp) throws SQLException {
		String sql = "INSERT INTO HinhAnhSanPham(MaHinhAnh, MaSanPham, DuongDanHinh, MoTaHinh) "
				+ " VALUES (?, ?, ?, N'Hình ảnh sản phẩm')";		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, sp.getMaSP());
		ps.setInt(2, sp.getMaSP());
		ps.setString(3, sp.getHinhAnhSP().getDuongDanHinh());
		ps.executeUpdate();
	}
	public static void XoaSanPham(Connection conn, int maSP) throws SQLException {
		String sql = "Delete from GioHang Where MaSanPham =?";		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, maSP);
		ps.executeUpdate();
		
		String sql1 = "Delete from MauSac Where MaSanPham =?";		
		PreparedStatement ps1 = conn.prepareStatement(sql1);
		ps1.setInt(1, maSP);
		ps1.executeUpdate();
		
		String sql2 = "Delete from KichCo Where MaSanPham =?";		
		PreparedStatement ps2 = conn.prepareStatement(sql2);
		ps2.setInt(1, maSP);
		ps2.executeUpdate();
		
		String sql3 = "Delete from HinhAnhSanPham Where MaSanPham =?";		
		PreparedStatement ps3 = conn.prepareStatement(sql3);
		ps3.setInt(1, maSP);
		ps3.executeUpdate();
		
		String sql4 = "Delete from SanPham Where MaSanPham =?";		
		PreparedStatement ps4 = conn.prepareStatement(sql4);
		ps4.setInt(1, maSP);
		ps4.executeUpdate();
		
	}
}

