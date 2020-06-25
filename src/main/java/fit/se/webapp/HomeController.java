package fit.se.webapp;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fit.se.model.Banh;
import fit.se.model.TaiKhoan;
import fit.se.service.CRUDService;
import fit.se.session.LoginSession;

@Controller
public class HomeController {
	
	private CRUDService cr;
	
	@Autowired()
	public void setKhoanService(CRUDService cr) {
		this.cr = cr;
	}
	
	@RequestMapping(value = {"/home","/"}, method = RequestMethod.GET)
	public String homeRedirect(Locale locale, RedirectAttributes redirectAttributes) {
		redirectAttributes.addAttribute("PageBanh", 1);
		return "redirect:/index";
	}

	

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String homeChangePage(@RequestParam Integer PageBanh, Locale locale, Model model) {
		List<Banh> list = cr.getAllBanh();
		Integer f = new Integer(PageBanh);
		if(list == null)
			list = new ArrayList<Banh>();
		
//		list.forEach(x -> {System.out.println(x);});
		List<Banh> listOut = new ArrayList<Banh>();
		for(int i = (f-1)*15; i < f*15 ; i++) {
			if(i < list.size())
				listOut.add(list.get(i));
		}

		double tempTT = list.size() / 15.0;
		Integer tt = new Integer((int)Math.ceil(tempTT));
		model.addAttribute("ListBanh", listOut);
		model.addAttribute("PageBanh", PageBanh);
		model.addAttribute("TotalPage", tt);
		return "index";
	}
	
	@RequestMapping(value = "/signInForm", method = RequestMethod.GET)
	public String login(HttpServletRequest request, Model model) {
		return "login";
	}
	
	@RequestMapping(value = "/signIn", method = RequestMethod.POST)
	public String signIn() {
		
		return "";
	}
	
	@RequestMapping(value = "/signUpForm", method = RequestMethod.GET)
	public String signUpForm(HttpServletRequest request, ModelMap model) {
		if(!model.containsAttribute("userKH")) {
			model.addAttribute("userKH", new TaiKhoan());
		}
		return "createaccount";
	}
	
	@RequestMapping(value = "/signUpForm", method = RequestMethod.POST)
	public String signUp(@RequestParam Map<String, String> requestParams, HttpServletRequest request, Model model) {
		java.sql.Date entered = java.sql.Date.valueOf(requestParams.get("ngaySinh").toString());
		java.sql.Date min18 = java.sql.Date.valueOf(LocalDate.now().minusYears(18));
		int errorCount = 0;
		if (entered.after(min18)) {
			model.addAttribute("errorBirthSub18", "Tuổi của người đăng ký phải từ 18 tuổi trở lên");
			errorCount++;
		}
		if(cr.getUserbyUsername(requestParams.get("userName")).size() > 0) {
			model.addAttribute("errorUserNameExists", "Username đã được sử dụng, hãy chọn username khác");
			errorCount++;
		}
		if(errorCount > 0) {
			return "createaccount";
		}
		List<String> a = LoginSession.generateHashedPassword(requestParams.get("hashedPassword"));
		TaiKhoan tk = new TaiKhoan(requestParams.get("tenKH"), 
				requestParams.get("hoKH"),
				request.getParameter("userName"),
				a.get(0), //HashedPassword
				a.get(1), //PasswordSalt
				false,
				requestParams.get("email"),
				requestParams.get("soCMND"),
				java.sql.Date.valueOf(requestParams.get("ngaySinh")),
				requestParams.get("soDT"),
				requestParams.get("diaChi"));
		
		if(LoginSession.signUp(tk)) {
			return "redirect:/home";
		}
		else {
			model.addAttribute("errorUnknown", "Không thể đăng ký, có lỗi không rõ đã xảy ra");
			return "createaccount";
		}
	}
	
	@RequestMapping(value = "/addGioHang", method = RequestMethod.POST)
	public String themGioHang() {
		
		return "";
	}
	
}
