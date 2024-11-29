package models;

import java.sql.Date;
import java.util.List;

public class NguoiDung {
	private Account account;
	private String cccd; 
    private String hoTen;      
    private String gioiTinh;    
    private String sdt;          
    private Date ngaySinh;         
    private String email;
    private List<DiaChiNhanHang> diaChiNhanHang;
    
    public NguoiDung() {}
    

    public NguoiDung(Account account, String cccd, String hoTen, String gioiTinh, String sdt, Date ngaySinh, String email) {
    	this.setAccount(account);
    	this.setCccd(cccd);
    	this.setHoTen(hoTen);
    	this.setGioiTinh(gioiTinh);
    	this.setSdt(sdt);
    	this.setNgaySinh(ngaySinh);
    	this.setEmail(email);
    }
    
	public NguoiDung(String cccd, String hoTen, String gioiTinh, String sdt, Date ngaySinh, String email, List<DiaChiNhanHang> diaChiNhanHang) {
		this.cccd = cccd;
		this.hoTen = hoTen;
		this.gioiTinh = gioiTinh;
		this.sdt = sdt;
		this.ngaySinh = ngaySinh;
		this.email = email;
		this.setDiaChiNhanHang(diaChiNhanHang);
	}
	
	public NguoiDung(String hoTen, String sdt, String email, List<DiaChiNhanHang> diaChiNhanHang) {
		this.hoTen = hoTen;
		this.sdt = sdt;
		this.email = email;
		this.setDiaChiNhanHang(diaChiNhanHang);
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

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public List<DiaChiNhanHang> getDiaChiNhanHang() {
		return diaChiNhanHang;
	}

	public void setDiaChiNhanHang(List<DiaChiNhanHang> diaChiNhanHang) {
		this.diaChiNhanHang = diaChiNhanHang;
	}
	
}
