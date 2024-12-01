package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import DBConnection.ConnectJDBC;
import models.ChiTietHoaDon;
import models.DonMua;
import models.HinhAnhSanPham;
import models.KichCo;
import models.MauSac;
import models.SanPham;

public class DonHangDAO {
	public static List<DonMua> DanhSachDonHang(Connection conn, String trangThai) throws SQLException {
		List<DonMua> danhSachDonHang = new ArrayList<>();
	    Map<Integer, DonMua> donMuaMap = new HashMap<>(); 
	    String sql = "{call proc_LoadThongTinDonHang(?, ?)}";

	    PreparedStatement ps = conn.prepareStatement(sql);
	    ps.setInt(1, AccountDAO.getID());
	    ps.setString(2, trangThai);
	    ResultSet rs = ps.executeQuery();

	    while (rs.next()) {
	        int maHoaDon = rs.getInt("maHoaDon");

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

	        if (donMuaMap.containsKey(maHoaDon)) {
	            donMuaMap.get(maHoaDon).getChiTietHD().add(chiTietHD);
	        } 
	        else {
	            List<ChiTietHoaDon> listChiTietHD = new ArrayList<>();
	            listChiTietHD.add(chiTietHD);

	            DonMua donMua = new DonMua(
	                    maHoaDon,
	                    rs.getString("TrangThai"),
	                    rs.getInt("TongTien"),
	                    rs.getString("diachi"),
	                    rs.getDate("ngayDat"),
	                    listChiTietHD
	            );

	            donMuaMap.put(maHoaDon, donMua);
	        }
	    }

	    danhSachDonHang.addAll(donMuaMap.values());
	    danhSachDonHang.sort((o1, o2) -> Integer.compare(o2.getMaHoaDon(), o1.getMaHoaDon()));
	    return danhSachDonHang;
	}
	
	public static DonMua LoadThongTinMotDonHang(Connection conn, int maHoaDon) throws SQLException {
		List<ChiTietHoaDon> listChiTietHD = new ArrayList<ChiTietHoaDon>();
	    String sql = "{call proc_LoadThongTinMotDonHang(?, ?)}";

	    PreparedStatement ps = conn.prepareStatement(sql);
	    ps.setInt(1, AccountDAO.getID());
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
	    DonMua donMua = new DonMua(maHoaDon, trangThai, tongTien, listChiTietHD);
	    return donMua;
	}
//	public static void main(String[] args) {
//		Connection conn = null;
//		try {
//			conn = new ConnectJDBC().getConnection();
//		}
//		catch (Exception e) {
//			e.printStackTrace();
//		}
//		List<DonMua> DanhSachDonHang = null;
//		try {
//			DanhSachDonHang = DonHangDAO.DanhSachDonHang(conn);
//		}
//		catch (Exception e) {
//			e.printStackTrace();
//		
//			
//		}
//		for (DonMua donMua : DanhSachDonHang) {
//            System.out.println("Mã hóa đơn: " + donMua.getMaHoaDon());
//            System.out.println("Trạng thái: " + donMua.getTrangThai());
//            System.out.println("Tổng tiền: " + donMua.getTongTien());
//            System.out.println("Địa chỉ nhận hàng: " + donMua.getDiaChiNhanHang());
//            System.out.println("Ngày đặt: " + donMua.getNgayDat());
//
//            System.out.println("số lượng Chi tiết hóa đơn:" + (donMua.getChiTietHD().size()-1));
//            System.out.println("Chi tiết hóa đơn:");
//            // Xuất thông tin chi tiết hóa đơn
//            for (ChiTietHoaDon chiTiet : donMua.getChiTietHD()) {
//                SanPham sp = chiTiet.getSp();
//                System.out.println("\tMã sản phẩm: " + sp.getMaSP());
//                System.out.println("\tTên sản phẩm: " + sp.getTenSP());
//           //     System.out.println("\tĐơn giá: " + sp.getGiaBan());
//             //   System.out.println("\tSố lượng đã mua: " + chiTiet.getSoLuong());
//               // System.out.println("\tGiá bán: " + chiTiet.getGiaBan());
//            //    System.out.println("\tKích cỡ: " + sp.getSize().getTenKichCo());
//             //   System.out.println("\tMàu sắc: " + sp.getColor().getTenMau());
//             //   System.out.println("\tHình ảnh: " + sp.getHinhAnh().getDuongDanHinh());
//                System.out.println("-----------------------------");
//            }
//            System.out.println("=========================================");
//        }
//	}
}
