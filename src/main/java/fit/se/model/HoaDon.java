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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "HoaDon")
@NamedQueries ({
	@NamedQuery(name="getAllHoaDon", query="select hd from HoaDon hd order by hd.ngayLapHD desc"),
	@NamedQuery(name="getHoaDonByMa", query="select hd from HoaDon hd where hd.maHD = :ma")
})
public class HoaDon implements Serializable{
	
	private static final long serialVersionUID = 5937696543736744026L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="MAHD")
	private int maHD;
	@OneToMany(mappedBy="hoaDon", cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private List<ChiTietHoaDon> chiTietHoaDons = new ArrayList<ChiTietHoaDon>();
	@ManyToOne()
	@JoinColumn(referencedColumnName="id", name="ID")
	private TaiKhoan taiKhoan;
	@Column(name="TENKH")
	private String tenKH;
	@Column(name="HOKH")
	private String hoKH;
	@Column(name="SODT")
	private String soDT;
	@Column(name="DIACHI", columnDefinition="nvarchar(255)")
	private String diaChi;
	@Column(name="THANHTOAN")
	private String thanhToan;
	@Column(name="NGAYLAPHD")
	private Date ngayLapHD;
	@Column(name="TONGTIEN")
	private double tongTien;
	@Column(name="SOTHE")
	private String soThe;
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
	public String getThanhToan() {
		return thanhToan;
	}
	public void setThanhToan(String thanhToan) {
		this.thanhToan = thanhToan;
	}
	public Date getNgayLapHD() {
		return ngayLapHD;
	}
	public void setNgayLapHD(Date ngayLapHD) {
		this.ngayLapHD = ngayLapHD;
	}
	public double getTongTien() {
		return tongTien;
	}
	public void setTongTien(double tongTien) {
		this.tongTien = tongTien;
	}
	public String getSoThe() {
		return soThe;
	}
	public void setSoThe(String soThe) {
		this.soThe = soThe;
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
	public HoaDon(TaiKhoan taiKhoan, String tenKH, String hoKH, String soDT,
			String diaChi, String thanhToan, String soThe, Date ngayLapHD, double tongTien, List<ChiTietHoaDon> chiTietHoaDons) {
		super();
		this.taiKhoan = taiKhoan;
		this.tenKH = tenKH;
		this.hoKH = hoKH;
		this.soDT = soDT;
		this.diaChi = diaChi;
		this.thanhToan = thanhToan;
		this.soThe = soThe;
		this.ngayLapHD = ngayLapHD;
		this.tongTien = tongTien;
		this.chiTietHoaDons = chiTietHoaDons;
	}
	@Override
	public String toString() {
		return "HoaDon [maHD=" + maHD + ", chiTietHoaDons=" + chiTietHoaDons + ", taiKhoan=" + taiKhoan + ", tenKH="
				+ tenKH + ", hoKH=" + hoKH + ", soDT=" + soDT + ", diaChi=" + diaChi + ", thanhToan=" + thanhToan
				+ ", ngayLapHD=" + ngayLapHD + ", tongTien=" + tongTien + ", soThe=" + soThe + "]";
	}
}
