package fit.se.bean;

import java.util.Date;

import fit.se.model.TaiKhoan;


public class LoginUser {

	private TaiKhoan tk;
	private Date lastLogin;
	
    
	public LoginUser() {
		super();
	}

	public TaiKhoan getTk() {
		return tk;
	}

	public void setTk(TaiKhoan tk) {
		this.tk = tk;
	}

	public Date getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

	public TaiKhoan getTaiKhoanInfo() {
		if(lastLogin != null) {
			TaiKhoan temp = new TaiKhoan();
			temp.setId(tk.getId());
			return temp;
		}
		else
			return null;
	}
}
