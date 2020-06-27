package fit.se.session;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import fit.se.bean.LoginUser;
import fit.se.model.TaiKhoan;
import fit.se.service.CRUDService;

@Component
public class LoginSession {
	
	private static CRUDService cr;
	
	@Autowired()
	CRUDService crudService;

	
	@PostConstruct
	public void setKhoanService() {
		LoginSession.cr = crudService;
	}

	public static LoginUser getLoginInSession(HttpServletRequest request) {
		LoginUser login = (LoginUser) request.getSession().getAttribute("login");
		if(login == null) {
			login = new LoginUser();
			request.getSession().setAttribute("login", login);
		}
		return login;
	}
	
	public static List<String> generateHashedPassword(String rawString) {
		SecureRandom sr = new SecureRandom();
		String salt = new String((new Long(sr.nextLong()).toString()));
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-256");
			String concat = rawString+salt;
			md.update(concat.getBytes(StandardCharsets.UTF_8));
			StringBuffer hexString = new StringBuffer();
			byte[] output = md.digest();
	        for (int i = 0; i < output.length; i++) {
	            String hex = Integer.toHexString(0xff & output[i]);
	            if(hex.length() == 1) hexString.append('0');
	            hexString.append(hex);
	        }
	        List<String> res = new ArrayList<String>();
	        res.add(hexString.toString());
	        res.add(salt);
	        return res;
	        
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static boolean signUp(TaiKhoan tk) {
		cr.themTK(tk);
		return true;
	}
	
	@SuppressWarnings("null")
	public static boolean signIn(HttpServletRequest request, String userName, String password) {
		LoginUser login = getLoginInSession(request);
		if(login != null) {
			return true;
		} else {
			List<TaiKhoan> list = cr.getUserbyUsername(userName);
			if(list.size() == 0)
				return false;
			TaiKhoan c = list.get(0);
			MessageDigest md;
			try {
				md = MessageDigest.getInstance("SHA-256");
				String concat = password+c.getPasswordSalt();
				md.update(concat.getBytes(StandardCharsets.UTF_8));
				
				byte[] output = md.digest();
				
				StringBuffer hexString = new StringBuffer();

		        for (int i = 0; i < output.length; i++) {
		            String hex = Integer.toHexString(0xff & output[i]);
		            if(hex.length() == 1) hexString.append('0');
		            hexString.append(hex);
		        }
		        
		        if(hexString.toString().equalsIgnoreCase(c.getHashedPassword())) {
		        	login.setTk(c);
		        	login.setLastLogin(Date.from(Instant.now()));
		        	request.getSession().setAttribute("login", login);
		        	return true;
		        }
		        return false;
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
				return false;
			}
		}
	}
}
