package models;

import java.sql.Date;

public class DanhGia {
	private NguoiDung nguoiDung;
	private SanPham sp;
	private ChiTietHoaDon chiTietHD;
	private String binhLuan;
	private int soSao;
	private String trangThai;
	private Date ngayDanhGia;
	public DanhGia() {
		
	}
	
	public DanhGia(NguoiDung nguoiDung, SanPham sp, ChiTietHoaDon chiTietHD, String binhLuan, int soSao, Date ngayDanhGia, String trangThai) {
		this.setNguoiDung(nguoiDung);
		this.setSp(sp);
		this.setChiTietHD(chiTietHD);
		this.setBinhLuan(binhLuan);
		this.setSoSao(soSao);
		this.setNgayDanhGia(ngayDanhGia);
		this.setTrangThai(trangThai);
	}
	
	public String getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}
	public int getSoSao() {
		return soSao;
	}
	public void setSoSao(int soSao) {
		this.soSao = soSao;
	}
	public String getBinhLuan() {
		return binhLuan;
	}
	public void setBinhLuan(String binhLuan) {
		this.binhLuan = binhLuan;
	}
	public ChiTietHoaDon getChiTietHD() {
		return chiTietHD;
	}
	public void setChiTietHD(ChiTietHoaDon chiTietHD) {
		this.chiTietHD = chiTietHD;
	}
	public SanPham getSp() {
		return sp;
	}
	public void setSp(SanPham sp) {
		this.sp = sp;
	}

	public Date getNgayDanhGia() {
		return ngayDanhGia;
	}

	public void setNgayDanhGia(Date ngayDanhGia) {
		this.ngayDanhGia = ngayDanhGia;
	}

	public NguoiDung getNguoiDung() {
		return nguoiDung;
	}

	public void setNguoiDung(NguoiDung nguoiDung) {
		this.nguoiDung = nguoiDung;
	}
	
	
}
