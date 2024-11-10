package models;

public class KichCo {
	private int maKichCo;
	private String tenKichCo;
	
	public KichCo() {}
	
	public KichCo(int maKichCo, String tenKichCo) {
		this.setMaKichCo(maKichCo);
		this.setTenKichCo(tenKichCo);
	}
	
	public String getTenKichCo() {
		return tenKichCo;
	}
	public void setTenKichCo(String tenKichCo) {
		this.tenKichCo = tenKichCo;
	}
	public int getMaKichCo() {
		return maKichCo;
	}
	public void setMaKichCo(int maKichCo) {
		this.maKichCo = maKichCo;
	}
}
