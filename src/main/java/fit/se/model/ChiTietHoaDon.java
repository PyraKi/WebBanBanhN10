package fit.se.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ChiTietHoaDon")
public class ChiTietHoaDon implements Serializable{
	
	private static final long serialVersionUID = -3261812533918752608L;
	
	@Id
	@ManyToOne()
	@JoinColumn(referencedColumnName="maHD", name="MAHD")
	private HoaDon hoaDon;
	@Id
	@ManyToOne()
	@JoinColumn(referencedColumnName="maBanh", name="MABANH")
	private Banh banh;
	@Column(name="SOLUONG")
	private int soLuong;
	public HoaDon getHoaDon() {
		return hoaDon;
	}
	public void setHoaDon(HoaDon hoaDon) {
		this.hoaDon = hoaDon;
	}
	public Banh getBanh() {
		return banh;
	}
	public void setBanh(Banh banh) {
		this.banh = banh;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((banh == null) ? 0 : banh.hashCode());
		result = prime * result + ((hoaDon == null) ? 0 : hoaDon.hashCode());
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
		ChiTietHoaDon other = (ChiTietHoaDon) obj;
		if (banh == null) {
			if (other.banh != null)
				return false;
		} else if (!banh.equals(other.banh))
			return false;
		if (hoaDon == null) {
			if (other.hoaDon != null)
				return false;
		} else if (!hoaDon.equals(other.hoaDon))
			return false;
		return true;
	}
	public ChiTietHoaDon(Banh banh, int soLuong) {
		super();
		this.banh = banh;
		this.soLuong = soLuong;
	}
	public ChiTietHoaDon() {
		super();
	}
	public double tong() {
		return banh.getGia() * soLuong;
	}
}
