package fit.se.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="TAIKHOAN")
public class TaiKhoan implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="MATK")
	private int id;
	@Column(name="TEN", columnDefinition="nvarchar(255)")
	private String ten;
	@Column(name="HO", columnDefinition="nvarchar(255)")
	private String ho;
	@Column(name="USERNAME")
	private String username;
	@Column(name="HASHEDPASSWORD")
	private String hashedPassword;
	@Column(name="PASSWORDSALT")
	private String passwordSalt;
	@Column(name="LOAITK")
	private boolean loaiTK = false;
	@Column(name="EMAIL", columnDefinition="nvarchar(255)")
	private String email;
	@Column(name="CMND")
	private String cmnd;
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name="NGAYSINH")
	private Date ngaySinh;
	@Column(name="SODT")
	private String soDT;
	@Column(name="DIACHI", columnDefinition="nvarchar(255)")
	private String diachi;
	public int getId() {
		return id;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public String getHo() {
		return ho;
	}
	public void setHo(String ho) {
		this.ho = ho;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getHashedPassword() {
		return hashedPassword;
	}
	public void setHashedPassword(String hashedPassword) {
		this.hashedPassword = hashedPassword;
	}
	public String getPasswordSalt() {
		return passwordSalt;
	}
	public void setPasswordSalt(String passwordSalt) {
		this.passwordSalt = passwordSalt;
	}
	public boolean isLoaiTK() {
		return loaiTK;
	}
	public void setLoaiTK(boolean loaiTK) {
		this.loaiTK = loaiTK;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCmnd() {
		return cmnd;
	}
	public void setCmnd(String cmnd) {
		this.cmnd = cmnd;
	}
	public Date getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	public String getSoDT() {
		return soDT;
	}
	public void setSoDT(String soDT) {
		this.soDT = soDT;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result + ((username == null) ? 0 : username.hashCode());
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
		TaiKhoan other = (TaiKhoan) obj;
		if (id != other.id)
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}
	public TaiKhoan() {
		super();
	}
	public TaiKhoan(String ten, String ho, String username, String hashedPassword, String passwordSalt, boolean loaiTK,
			String email, String cmnd, Date ngaySinh, String soDT, String diachi) {
		super();
		this.ten = ten;
		this.ho = ho;
		this.username = username;
		this.hashedPassword = hashedPassword;
		this.passwordSalt = passwordSalt;
		this.loaiTK = loaiTK;
		this.email = email;
		this.cmnd = cmnd;
		this.ngaySinh = ngaySinh;
		this.soDT = soDT;
		this.diachi = diachi;
	}
}
