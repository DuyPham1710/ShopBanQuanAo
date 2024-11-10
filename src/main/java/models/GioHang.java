package models;

public class GioHang {
	private SanPham sanPham;
	private int soLuongGH;
	
	public GioHang(SanPham sanPham, int soLuongGH) {
		this.setSanPham(sanPham);
		this.setSoLuongGH(soLuongGH);
	}

	public int getSoLuongGH() {
		return soLuongGH;
	}

	public void setSoLuongGH(int soLuongGH) {
		this.soLuongGH = soLuongGH;
	}

	public SanPham getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}
}
