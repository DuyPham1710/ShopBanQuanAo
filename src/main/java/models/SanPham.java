package models;

public class SanPham {
	private int maSP;
	private String tenSP;
	private String mota;
	private float gia;
	private int soLuong;
	private int maDanhMuc;
	private int maKichCo;
	private int maMau;
	private int maHinhAnh;
	private String duongDanHinh;
	
	public SanPham(int maSP, String tenSP, String mota, float gia, int soLuong, int maDanhMuc, int maKichCo, int maMau, int maHinhAnh, String duongDanHinh) {
		this.maSP = maSP;
		this.tenSP = tenSP;
		this.mota = mota;
		this.gia = gia;
		this.soLuong = soLuong;
		this.maDanhMuc = maDanhMuc;
		this.maKichCo = maKichCo;
		this.maMau = maMau;
		this.maHinhAnh = maHinhAnh;
		this.duongDanHinh = duongDanHinh;
	}
	
	public int getMaKichCo() {
		return maKichCo;
	}
	public void setMaKichCo(int maKichCo) {
		this.maKichCo = maKichCo;
	}
	public int getMaDanhMuc() {
		return maDanhMuc;
	}
	public void setMaDanhMuc(int maDanhMuc) {
		this.maDanhMuc = maDanhMuc;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public float getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public String getMota() {
		return mota;
	}
	public void setMota(String mota) {
		this.mota = mota;
	}
	public String getTenSP() {
		return tenSP;
	}
	public void setTenSP(String tenSP) {
		this.tenSP = tenSP;
	}
	public int getMaSP() {
		return maSP;
	}
	public void setMaSP(int maSP) {
		this.maSP = maSP;
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

	public int getMaMau() {
		return maMau;
	}

	public void setMaMau(int maMau) {
		this.maMau = maMau;
	}
	
}
