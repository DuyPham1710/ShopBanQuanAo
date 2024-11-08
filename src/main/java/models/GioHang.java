package models;

public class GioHang {
	private int ID;
	private int maSP;
	private String tenSP;
	private int giaBanDau;
	private int giaHienTai;
	private int soLuongSP;
	private int soLuongGH;
	private int maKichThuoc;
	private String tenKichThuoc;
	private int maMau;
	private String tenMau;
	private String duongDanHinh;
	
	public GioHang(int ID, int maSP, int maKichThuoc, int maMau, int soLuongGH) {
		this.ID = ID;
		this.maSP = maSP;
		this.maKichThuoc = maKichThuoc;
		this.maMau = maMau;
		this.soLuongGH = soLuongGH;
	}
	
	public GioHang(int maSP, String tenSP, int maKichThuoc, String tenKichThuoc, int maMau, String tenMau, int soLuongSP, int soLuongGH, int giaBanDau, int giaHienTai, String duongDanHinh) {
		this.maSP = maSP;
		this.tenSP = tenSP;
		this.maKichThuoc = maKichThuoc;
		this.tenKichThuoc = tenKichThuoc;
		this.maMau = maMau;
		this.tenMau = tenMau;
		this.soLuongSP = soLuongSP;
		this.soLuongGH = soLuongGH;
		this.giaBanDau = giaBanDau;
		this.giaHienTai = giaHienTai;
		this.duongDanHinh = duongDanHinh;
	}

	public String getDuongDanHinh() {
		return duongDanHinh;
	}

	public void setDuongDanHinh(String duongDanHinh) {
		this.duongDanHinh = duongDanHinh;
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

	public int getGiaHienTai() {
		return giaHienTai;
	}

	public void setGiaHienTai(int giaHienTai) {
		this.giaHienTai = giaHienTai;
	}

	public int getGiaBanDau() {
		return giaBanDau;
	}

	public void setGiaBanDau(int giaBanDau) {
		this.giaBanDau = giaBanDau;
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

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public int getSoLuongGH() {
		return soLuongGH;
	}

	public void setSoLuongGH(int soLuongGH) {
		this.soLuongGH = soLuongGH;
	}

	public int getSoLuongSP() {
		return soLuongSP;
	}

	public void setSoLuongSP(int soLuongSP) {
		this.soLuongSP = soLuongSP;
	}

	
}
