package fit.se.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "BANH")
public class Banh implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="MABANH")
	private int maBanh;
	@Column(name="TENBANH", columnDefinition="nvarchar(255)")
	private String tenBanh;
	@Column(name="LOAIBANH", columnDefinition="nvarchar(255)")
	private String loaiBanh;
	@Column(name="MOTA", columnDefinition="nvarchar(255)")
	private String moTa;
	@Column(name="SOLUONG")
	private int soLuong;
	@Column(name="GIA")
	private double gia;
	@Column(name="PATHHINHANH")
	private String urlImg;
	@Column(name="GIAMGIA")
	private float giamGia;
	public int getMaBanh() {
		return maBanh;
	}
	public void setMaBanh(int maBanh) {
		this.maBanh = maBanh;
	}
	public String getTenBanh() {
		return tenBanh;
	}
	public void setTenBanh(String tenBanh) {
		this.tenBanh = tenBanh;
	}
	public String getLoaiBanh() {
		return loaiBanh;
	}
	public void setLoaiBanh(String loaiBanh) {
		this.loaiBanh = loaiBanh;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public String getUrlImg() {
		return urlImg;
	}
	public void setUrlImg(String urlImg) {
		this.urlImg = urlImg;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public double getGia() {
		return gia;
	}
	public void setGia(double gia) {
		this.gia = gia;
	}
	public float getGiamGia() {
		return giamGia;
	}
	public void setGiamGia(float giamGia) {
		this.giamGia = giamGia;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + maBanh;
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
		Banh other = (Banh) obj;
		if (maBanh != other.maBanh)
			return false;
		return true;
	}
	public Banh() {
		super();
	}
	public double giaSauGiam() {
		return gia - gia*giamGia;
	}
	@Override
	public String toString() {
		return "Banh [maBanh=" + maBanh + ", tenBanh=" + tenBanh + ", loaiBanh=" + loaiBanh + ", moTa=" + moTa + ", soLuong="
				+ soLuong + ", gia=" + gia + ", urlImg=" + urlImg + ", giamGia=" + giamGia + ", giaSauGiam()="
				+ giaSauGiam() + "]";
	}
}
