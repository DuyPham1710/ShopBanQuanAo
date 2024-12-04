package models;

import java.sql.Date;

public class HoaDon {
	private int maHD;
	private int idNguoiDung;
	private Date ngayTao;
	private int tongTien;
	private String diachi;
	private String trangThai;
	private ChiTietHoaDon chiTietHoaDon;
    public HoaDon(int maHD, int idNguoiDung, Date ngayTao, int tongTien, String diaChi, String trangThai) {
        this.maHD = maHD;
        this.idNguoiDung = idNguoiDung;
        this.ngayTao = ngayTao;
        this.tongTien = tongTien;
        this.diachi = diaChi;
        this.trangThai = trangThai;
    }
    
    public HoaDon(ChiTietHoaDon chiTietHoaDon,int maHD, int idNguoiDung, Date ngayTao, int tongTien, String diaChi, String trangThai) {
        this.chiTietHoaDon = chiTietHoaDon;
    	this.maHD = maHD;
        this.idNguoiDung = idNguoiDung;
        this.ngayTao = ngayTao;
        this.tongTien = tongTien;
        this.diachi = diaChi;
        this.trangThai = trangThai;
    }
	public String getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public int getTongTien() {
		return tongTien;
	}
	public void setTongTien(int tongTien) {
		this.tongTien = tongTien;
	}
	public Date getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(Date ngayTao) {
		this.ngayTao = ngayTao;
	}
	public int getIdNguoiDung() {
		return idNguoiDung;
	}
	public void setIdNguoiDung(int idNguoiDung) {
		this.idNguoiDung = idNguoiDung;
	}
	public int getMaHD() {
		return maHD;
	}
	public void setMaHD(int mHD) {
		this.maHD = maHD;
	}
	public ChiTietHoaDon getChiTietHoaDon() {
		return chiTietHoaDon;
	}
	public void setChiTietHoaDon(ChiTietHoaDon chiTietHoaDon) {
		this.chiTietHoaDon = chiTietHoaDon;
	}
}
