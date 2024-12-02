package models;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class DonMua {
	private int maHoaDon;
	private SanPham sp;
	private String trangThai;
	private int soLuongDaMua;
	private int giaBan;
	private int tongTien;
	private String diaChiNhanHang;
	private Date ngayDat;
	private List<ChiTietHoaDon> chiTietHD;
	
	public DonMua() {}
	
	public DonMua(int maHoaDon, SanPham sp, String trangThai, int soLuongDaMua, int giaBan, int tongTien, String diaChiNhanHang, Date ngayDat) {
		this.setMaHoaDon(maHoaDon);
		this.setSp(sp);
		this.setTrangThai(trangThai);
		this.setSoLuongDaMua(soLuongDaMua);
		this.setGiaBan(giaBan);
		this.setTongTien(tongTien);
		this.setDiaChiNhanHang(diaChiNhanHang);
		this.setNgayDat(ngayDat);
	}
	
	public DonMua(int maHoaDon, String trangThai, int tongTien, List<ChiTietHoaDon> chiTietHoaDon) {
		this.setMaHoaDon(maHoaDon);
		this.setTrangThai(trangThai);
		this.setTongTien(tongTien);
		chiTietHD = new ArrayList<ChiTietHoaDon>();
		this.setChiTietHD(chiTietHoaDon);
	}
	public Date getNgayDat() {
		return ngayDat;
	}
	public void setNgayDat(Date ngayDat) {
		this.ngayDat = ngayDat;
	}
	public String getDiaChiNhanHang() {
		return diaChiNhanHang;
	}
	public void setDiaChiNhanHang(String diaChiNhanHang) {
		this.diaChiNhanHang = diaChiNhanHang;
	}
	public int getGiaBan() {
		return giaBan;
	}
	public void setGiaBan(int giaBan) {
		this.giaBan = giaBan;
	}
	public int getSoLuongDaMua() {
		return soLuongDaMua;
	}
	public void setSoLuongDaMua(int soLuongDaMua) {
		this.soLuongDaMua = soLuongDaMua;
	}
	public String getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}
	public SanPham getSp() {
		return sp;
	}
	public void setSp(SanPham sp) {
		this.sp = sp;
	}
	public int getMaHoaDon() {
		return maHoaDon;
	}
	public void setMaHoaDon(int maHoaDon) {
		this.maHoaDon = maHoaDon;
	}

	public int getTongTien() {
		return tongTien;
	}

	public void setTongTien(int tongTien) {
		this.tongTien = tongTien;
	}
	
	public List<ChiTietHoaDon> getChiTietHD() {
		return chiTietHD;
	}

	public void setChiTietHD(List<ChiTietHoaDon> chiTietHD) {
		this.chiTietHD = chiTietHD;
	}
}
