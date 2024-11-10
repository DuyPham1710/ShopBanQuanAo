package models;

import java.util.ArrayList;
import java.util.List;

public class SanPham {
	private int maSP;
	private String tenSP;
	private String mota;
	private int giaBanDau;
	private int giamGia;
	private int giaHienTai;
	private int soLuong;
	private DanhMucSanPham danhMuc;
	private List<KichCo> kichCo;
	private List<MauSac> mauSac;
	private HinhAnhSanPham hinhAnhSP;
	private List<DiaChiNhanHang> diaChiNhanHang;
	
	public SanPham() {}
	
	public SanPham(int maSP, String tenSP, String mota, int giaBanDau, int giamGia, int soLuong, DanhMucSanPham danhMuc, HinhAnhSanPham hinhAnhSP) {
		this.maSP = maSP;
		this.tenSP = tenSP;
		this.mota = mota;
		this.giaBanDau = giaBanDau;
		this.giamGia = giamGia;
		this.soLuong = soLuong;
		this.danhMuc = danhMuc;
		this.hinhAnhSP = hinhAnhSP;
		this.giaHienTai = (int)(giaBanDau - (giaBanDau * ((float)giamGia/100)));
	}
	
	public SanPham(int maSP, String tenSP, int giaBanDau, int giaHienTai, int soLuong, KichCo size, MauSac color, HinhAnhSanPham hinhAnhSP) {
		this.setMaSP(maSP);
		this.setTenSP(tenSP);
		this.setGiaBanDau(giaBanDau);
		this.setGiaHienTai(giaHienTai);
		this.setSoLuong(soLuong);
		this.kichCo = new ArrayList<>();
	    this.mauSac = new ArrayList<>(); 
		this.kichCo.add(size);	
		this.mauSac.add(color);
		this.setHinhAnhSP(hinhAnhSP);
	}
	
	public SanPham(int maSP, int maKichCo, int maMauSac) {
		this.setMaSP(maSP);
		this.kichCo = new ArrayList<>();
	    this.mauSac = new ArrayList<>();
		KichCo size = new KichCo();
		size.setMaKichCo(maKichCo);
		this.kichCo.add(size);
		MauSac color = new MauSac();
		color.setMaMau(maMauSac);
		this.mauSac.add(color);
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

	public int getGiamGia() {
		return giamGia;
	}

	public void setGiamGia(int giamGia) {
		this.giamGia = giamGia;
	}

	public int getGiaHienTai() {
		return giaHienTai;
	}

	public void setGiaHienTai(int giaHienTai) {
		this.giaHienTai = giaHienTai;
	}

	public List<DiaChiNhanHang> getDiaChiNhanHang() {
		return diaChiNhanHang;
	}
	public void setDiaChiNhanHang(List<DiaChiNhanHang> diaChiNhanHang) {
		this.diaChiNhanHang = diaChiNhanHang;
	}
	public HinhAnhSanPham getHinhAnhSP() {
		return hinhAnhSP;
	}
	public void setHinhAnhSP(HinhAnhSanPham hinhAnhSP) {
		this.hinhAnhSP = hinhAnhSP;
	}
	public List<MauSac> getMauSac() {
		return mauSac;
	}
	public void setMauSac(List<MauSac> mauSac) {
		this.mauSac = mauSac;
	}
	public List<KichCo> getKichCo() {
		return kichCo;
	}
	public void setKichCo(List<KichCo> kichCo) {
		this.kichCo = kichCo;
	}

	public DanhMucSanPham getDanhMuc() {
		return danhMuc;
	}

	public void setDanhMuc(DanhMucSanPham danhMuc) {
		this.danhMuc = danhMuc;
	}
	
}
