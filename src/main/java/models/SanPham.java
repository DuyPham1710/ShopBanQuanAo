package models;

public class SanPham {
	private int maSP;
	private String tenSP;
	private String mota;
	private int giaBanDau;
	private int giamGia;
	private float giaHienTai;
	private int soLuong;
	private int maMau;
	private String tenMau;
	private int maKichThuoc;
	private String tenKichThuoc;
	private int maDanhMuc;
	private int maHinhAnh;
	private String duongDanHinh;
	
	public SanPham() {
	
	}
	public SanPham(int maSP, String tenSP, String mota, int giaBanDau, int giamGia, int soLuong, int maDanhMuc, int maHinhAnh, String duongDanHinh) {
		this.maSP = maSP;
		this.tenSP = tenSP;
		this.mota = mota;
		this.giaBanDau = giaBanDau;
		this.giamGia = giamGia;
		this.soLuong = soLuong;
		this.maDanhMuc = maDanhMuc;
	
		this.maHinhAnh = maHinhAnh;
		this.duongDanHinh = duongDanHinh;
		this.giaHienTai = (giaBanDau - (giaBanDau * ((float)giamGia/100)));
	}
	
	public SanPham(int maMau, String tenMau) {
		this.maMau = maMau;
		this.tenMau = tenMau;
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
	public int getGiaBanDau() {
		return giaBanDau;
	}
	public void setGiaBanDau(int giaBanDau) {
		this.giaBanDau = giaBanDau;
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

	

	public int getGiamGia() {
		return giamGia;
	}

	public void setGiamGia(int giamGia) {
		this.giamGia = giamGia;
	}

	public float getGiaHienTai() {
		return giaHienTai;
	}

	public void setGiaHienTai(float giaHienTai) {
		this.giaHienTai = giaHienTai;
	}


	public String getTenKichThuoc() {
		return tenKichThuoc;
	}


	public void setTenKichThuoc(String tenKichThuoc) {
		this.tenKichThuoc = tenKichThuoc;
	}


	public int getMaKichThuoc() {
		return maKichThuoc;
	}


	public void setMaKichThuoc(int maKichThuoc) {
		this.maKichThuoc = maKichThuoc;
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
	
}
