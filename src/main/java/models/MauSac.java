package models;

public class MauSac {
	private int maMau;
	private String tenMau;
	private String maMauHex;
	
	public MauSac() {}
	
	public MauSac(int maMau, String tenMau) {
		this.setMaMau(maMau);
		this.setTenMau(tenMau);
	}
	
	public String getTenMau() {
		return tenMau;
	}
	public void setTenMau(String tenMau) {
		this.tenMau = tenMau;
	}
	public int getMaMau() {
		return maMau;
	}
	public void setMaMau(int maMau) {
		this.maMau = maMau;
	}

	public String getMaMauHex() {
		return maMauHex;
	}

	public void setMaMauHex(String maMauHex) {
		this.maMauHex = maMauHex;
	}
}
