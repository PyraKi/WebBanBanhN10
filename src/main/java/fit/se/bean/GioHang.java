package fit.se.bean;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import fit.se.model.Banh;
import fit.se.model.ChiTietHoaDon;
import fit.se.model.TaiKhoan;

public class GioHang {
	private int maHD;
	private List<ChiTietHoaDon> chiTietHoaDons = new ArrayList<ChiTietHoaDon>();
	private TaiKhoan taiKhoan;
	private String tenKH;
	private String hoKH;
	private String soDT;
	private String diaChi;
	private String ThanToan;
	private Date ngayLapHD;
	public int getMaHD() {
		return maHD;
	}
	
	public List<ChiTietHoaDon> getChiTietHoaDons() {
		return chiTietHoaDons;
	}

	public void setChiTietHoaDons(List<ChiTietHoaDon> chiTietHoaDons) {
		this.chiTietHoaDons = chiTietHoaDons;
	}

	public TaiKhoan getTaiKhoan() {
		return taiKhoan;
	}

	public void setTaiKhoan(TaiKhoan taiKhoan) {
		this.taiKhoan = taiKhoan;
	}

	public String getTenKH() {
		return tenKH;
	}

	public void setTenKH(String tenKH) {
		this.tenKH = tenKH;
	}

	public String getHoKH() {
		return hoKH;
	}

	public void setHoKH(String hoKH) {
		this.hoKH = hoKH;
	}

	public String getSoDT() {
		return soDT;
	}

	public void setSoDT(String soDT) {
		this.soDT = soDT;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getThanToan() {
		return ThanToan;
	}

	public void setThanToan(String thanToan) {
		ThanToan = thanToan;
	}

	public Date getNgayLapHD() {
		return ngayLapHD;
	}

	public void setNgayLapHD(Date ngayLapHD) {
		this.ngayLapHD = ngayLapHD;
	}

	public void setMaHD(int maHD) {
		this.maHD = maHD;
	}

	public boolean themBanh(Banh b) {
//		System.out.println("check add banh: " + b);
		for (ChiTietHoaDon ct : chiTietHoaDons) {
			if(ct.getBanh().getMaBanh() == b.getMaBanh()) {
				ct.setSoLuong(ct.getSoLuong() + 1);
				tong();
				return true;
			}
		}
		return chiTietHoaDons.add(new ChiTietHoaDon(null, b, 1));
	}
	public boolean capNhatSP(int index, int soLuong) {
		try {
			ChiTietHoaDon ct = chiTietHoaDons.get(index);
			ct.setSoLuong(soLuong);
			chiTietHoaDons.set(index, ct);
			tong();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public boolean xoaSP(int index) {
		try {
			chiTietHoaDons.remove(index);
			tong();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public double tong() {
		double tong = 0;
		for (ChiTietHoaDon ct : chiTietHoaDons) {
			tong = ct.tong();
		}
		return tong;
	}

	@Override
	public String toString() {
		return "GioHang [maHD=" + maHD + ", chiTietHoaDons=" + chiTietHoaDons + ", taiKhoan=" + taiKhoan + ", tenKH="
				+ tenKH + ", hoKH=" + hoKH + ", soDT=" + soDT + ", diaChi=" + diaChi + ", ThanToan=" + ThanToan
				+ ", ngayLapHD=" + ngayLapHD + "]";
	}
	
}
