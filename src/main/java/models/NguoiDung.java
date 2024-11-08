package models;

import java.sql.Date;

public class NguoiDung {
	private String cccd; 
    private String hoTen;      
    private String gioiTinh;    
    private String sdt;          
    private Date ngaySinh;      
    private int maDiaChi;     
    private String tenDiaChi;    
    private String email;
    
	public NguoiDung(String cccd, String hoTen, String gioiTinh, String sdt, Date ngaySinh, int maDiaChi, String tenDiaChi, String email) {
		this.cccd = cccd;
		this.hoTen = hoTen;
		this.gioiTinh = gioiTinh;
		this.sdt = sdt;
		this.ngaySinh = ngaySinh;
		this.maDiaChi = maDiaChi;
		this.tenDiaChi = tenDiaChi;
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTenDiaChi() {
		return tenDiaChi;
	}

	public void setTenDiaChi(String tenDiaChi) {
		this.tenDiaChi = tenDiaChi;
	}

	public int getMaDiaChi() {
		return maDiaChi;
	}

	public void setMaDiaChi(int maDiaChi) {
		this.maDiaChi = maDiaChi;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public String getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getCccd() {
		return cccd;
	}

	public void setCccd(String cccd) {
		this.cccd = cccd;
	}
}
