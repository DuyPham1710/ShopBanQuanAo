package models;

public class ChiTietHoaDon {
	private int maChiTiet;
	private SanPham sp;
	private int soLuongDaMua;
	private int donGia;
	private int giaBan;
	
	public ChiTietHoaDon() {}

	public ChiTietHoaDon(int maChiTiet, SanPham sp, int soLuongDaMua, int donGia, int giaBan) {
		this.setMaChiTiet(maChiTiet);
		this.setSp(sp);
		this.setSoLuongDaMua(soLuongDaMua);
		this.setDonGia(donGia);
		this.setGiaBan(giaBan);
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
	public SanPham getSp() {
		return sp;
	}
	public void setSp(SanPham sp) {
		this.sp = sp;
	}

	public int getDonGia() {
		return donGia;
	}

	public void setDonGia(int donGia) {
		this.donGia = donGia;
	}

	public int getMaChiTiet() {
		return maChiTiet;
	}

	public void setMaChiTiet(int maChiTiet) {
		this.maChiTiet = maChiTiet;
	}
	
}
 