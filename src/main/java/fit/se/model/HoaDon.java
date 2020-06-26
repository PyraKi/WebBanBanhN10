package fit.se.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "HoaDon")
public class HoaDon implements Serializable{
	
	private static final long serialVersionUID = 5937696543736744026L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="MAHD")
	private int maHD;
	@OneToMany(mappedBy="hoaDon", cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private List<ChiTietHoaDon> chiTietHoaDons = new ArrayList<ChiTietHoaDon>();
	@ManyToOne()
	@JoinColumn(referencedColumnName="maKH", name="MAKH")
	private TaiKhoan taiKhoan;
	@Column(name="DIACHI", columnDefinition="nvarchar(255)")
	private String diaChi;
	@Column(name="THANHTOAN")
	private String ThanToan;
	@Column(name="NGAYLAPHD")
	private Date ngayLapHD;
	public int getMaHD() {
		return maHD;
	}
	public void setMaHD(int maHD) {
		this.maHD = maHD;
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
	public double tong() {
		double tong = 0;
		for (ChiTietHoaDon ct : chiTietHoaDons) {
			tong = ct.tong();
		}
		return tong;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + maHD;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		HoaDon other = (HoaDon) obj;
		if (maHD != other.maHD)
			return false;
		return true;
	}
	public HoaDon() {
		super();
	}
	public boolean themBanh(Banh b) {
		for (ChiTietHoaDon ct : chiTietHoaDons) {
			if(ct.getBanh().getMaBanh() == b.getMaBanh()) {
				ct.setSoLuong(ct.getSoLuong() + 1);
				tong();
				return true;
			}
		}
		return chiTietHoaDons.add(new ChiTietHoaDon(b, 1));
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
	@Override
	public String toString() {
		return "HoaDon [maHD=" + maHD + ", chiTietHoaDons=" + chiTietHoaDons + ", taiKhoan=" + taiKhoan + ", diaChi="
				+ diaChi + ", ThanToan=" + ThanToan + ", tong()=" + tong() + "]";
	}
}
