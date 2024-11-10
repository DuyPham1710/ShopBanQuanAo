package models;

public class HinhAnhSanPham {
	private int maHinhAnh;
	private String duongDanHinh;
	private String moTaHinh;
	
	public HinhAnhSanPham() {}
	
	public HinhAnhSanPham(int maHinhAnh, String duongDanHinh) {
		this.setMaHinhAnh(maHinhAnh);
		this.setDuongDanHinh(duongDanHinh);
	}
	
	public String getMoTaHinh() {
		return moTaHinh;
	}
	public void setMoTaHinh(String moTaHinh) {
		this.moTaHinh = moTaHinh;
	}
	public String getDuongDanHinh() {
		return duongDanHinh;
	}
	public void setDuongDanHinh(String duongDanHinh) {
		this.duongDanHinh = duongDanHinh;
	}
	public int getMaHinhAnh() {
		return maHinhAnh;
	}
	public void setMaHinhAnh(int maHinhAnh) {
		this.maHinhAnh = maHinhAnh;
	}
}
