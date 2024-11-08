package models;

import java.sql.Date;

public class NguoiDung {
	private String cccd; 
    private String hoTen;      
    private String gioiTinh;    
    private String sdt;          
    private Date ngaySinh;         
    private String email;
    
	public NguoiDung(String cccd, String hoTen, String gioiTinh, String sdt, Date ngaySinh, String email) {
		this.cccd = cccd;
		this.hoTen = hoTen;
		this.gioiTinh = gioiTinh;
		this.sdt = sdt;
		this.ngaySinh = ngaySinh;
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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
