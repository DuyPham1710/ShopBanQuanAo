package models;

public class DiaChiNhanHang {
	private int maDiaChi;
	private String tenDiaChi;
	
	public DiaChiNhanHang() {}
	
	public DiaChiNhanHang(int madiachi, String tenDiaChi) {
		this.setMadiachi(madiachi);
		this.setTenDiaChi(tenDiaChi);
	}
	
	public String getTenDiaChi() {
		return tenDiaChi;
	}
	public void setTenDiaChi(String tenDiaChi) {
		this.tenDiaChi = tenDiaChi;
	}
	public int getMadiachi() {
		return maDiaChi;
	}
	public void setMadiachi(int maDiaChi) {
		this.maDiaChi = maDiaChi;
	}
}
