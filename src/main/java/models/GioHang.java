package models;

public class GioHang {
	private int ID;
	private int maSP;
	private String TenSP;
	private int giaBanDau;
	private float giaHienTai;
	private int SoLuong;
	private String KichThuoc;
	private String MauSac;
	private String DuongDanHinh;
	
	public GioHang(int ID, int maSP, int SoLuong, String KichThuoc, String MauSac) {
		this.ID = ID;
		this.maSP = maSP;
		this.SoLuong = SoLuong;
		this.KichThuoc = KichThuoc;
		this.MauSac = MauSac;
	}
	
	public GioHang(int maSP, String TenSP, String KichThuoc, String MauSac, int SoLuong, int giaBanDau, float giaHienTai, String DuongDanHinh) {
		this.maSP = maSP;
		this.TenSP = TenSP;
		this.SoLuong = SoLuong;
		this.KichThuoc = KichThuoc;
		this.MauSac = MauSac;
		this.SoLuong = SoLuong;
		this.giaBanDau = giaBanDau;
		this.giaHienTai = giaHienTai;
		this.DuongDanHinh = DuongDanHinh;
	}

	public String getDuongDanHinh() {
		return DuongDanHinh;
	}

	public void setDuongDanHinh(String duongDanHinh) {
		DuongDanHinh = duongDanHinh;
	}

	public String getMauSac() {
		return MauSac;
	}

	public void setMauSac(String mauSac) {
		MauSac = mauSac;
	}

	public String getKichThuoc() {
		return KichThuoc;
	}

	public void setKichThuoc(String kichThuoc) {
		KichThuoc = kichThuoc;
	}

	public int getSoLuong() {
		return SoLuong;
	}

	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}

	public float getGiaHienTai() {
		return giaHienTai;
	}

	public void setGiaHienTai(float giaHienTai) {
		this.giaHienTai = giaHienTai;
	}

	public int getGiaBanDau() {
		return giaBanDau;
	}

	public void setGiaBanDau(int giaBanDau) {
		this.giaBanDau = giaBanDau;
	}

	public String getTenSP() {
		return TenSP;
	}

	public void setTenSP(String tenSP) {
		TenSP = tenSP;
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
	

}
