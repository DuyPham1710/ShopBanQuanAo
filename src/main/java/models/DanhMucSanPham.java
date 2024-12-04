package models;

public class DanhMucSanPham {
	private int maDanhMuc;
	private String tenDanhMuc;
	
	public DanhMucSanPham() {}
	
	public DanhMucSanPham(int maDanhMuc, String tenDanhMuc) {
		this.setMaDanhMuc(maDanhMuc);
		this.setTenDanhMuc(tenDanhMuc);
	}
	
	public DanhMucSanPham(int maDanhMuc) {
		this.setMaDanhMuc(maDanhMuc);
	}
	
	public String getTenDanhMuc() {
		return tenDanhMuc;
	}
	public void setTenDanhMuc(String tenDanhMuc) {
		this.tenDanhMuc = tenDanhMuc;
	}
	public int getMaDanhMuc() {
		return maDanhMuc;
	}
	public void setMaDanhMuc(int maDanhMuc) {
		this.maDanhMuc = maDanhMuc;
	}
}
