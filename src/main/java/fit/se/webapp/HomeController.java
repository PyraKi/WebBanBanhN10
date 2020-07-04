package fit.se.webapp;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fit.se.bean.GioHang;
import fit.se.bean.LoginUser;
import fit.se.exception.ResourceNotFoundException;
import fit.se.model.Banh;
import fit.se.model.TaiKhoan;
import fit.se.service.CRUDService;
import fit.se.service.EmailService;
import fit.se.session.GioHangSession;
import fit.se.session.LoginSession;

@Controller
public class HomeController {
	
	private CRUDService cr;
	
	@Autowired()
	public void setKhoanService(CRUDService cr) {
		this.cr = cr;
	}
	
	@RequestMapping(value = {"/home","/"}, method = RequestMethod.GET)
	public String homeRedirect(Locale locale, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		LoginUser log = LoginSession.getLoginInSession(request);
		if(log.getTk() == null) {
			redirectAttributes.addAttribute("PageBanh", 1);
			return "redirect:/index";
		}else {
			if(log.getTk().isLoaiTK()) {
				return "redirect:/adminIndex";
			} else {
				redirectAttributes.addAttribute("PageBanh", 1);
				return "redirect:/index";
			}
				
		}
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
		LoginUser login = LoginSession.getLoginInSession(request);
		if(login.getTk() != null) {
			return "redirect:/usernavigation";
		} else {
			return "login";
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logout(Locale locale, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		LoginSession.logout(request);
		redirectAttributes.addAttribute("PageBanh", 1);
		return "redirect:/home";
	}
	
	@RequestMapping(value = "/usernavigation", method = RequestMethod.GET)
	public String usernavigation(HttpServletRequest request, Model model) {
		LoginUser login = LoginSession.getLoginInSession(request);
		model.addAttribute("user", login.getTk());
		return "usernavigation";
	}
	
	@RequestMapping(value = "/editprofilePage", method = RequestMethod.GET)
	public String editProfilePage(HttpServletRequest request, Model model) {
		LoginUser login = LoginSession.getLoginInSession(request);
		model.addAttribute("user", login.getTk());
		return "editprofile";
	}
	
	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
	public String editProfile(@RequestParam Map<String, String> requestParams, HttpServletRequest request, 
			Model model, RedirectAttributes redirectAttributes) {
		java.sql.Date entered = java.sql.Date.valueOf(requestParams.get("ngaySinh").toString());
		java.sql.Date min18 = java.sql.Date.valueOf(LocalDate.now().minusYears(18));
		if (entered.after(min18)) {
			model.addAttribute("errorBirthSub18", "Tuổi của người đăng ký phải từ 18 tuổi trở lên");
			return "editprofile";
		}
		List<String> a = LoginSession.generateHashedPassword(requestParams.get("password"));
		TaiKhoan tk = LoginSession.getLoginInSession(request).getTk();
		tk.setTen(requestParams.get("ten"));		
		tk.setHo(requestParams.get("ho"));
		tk.setHashedPassword(a.get(0));
		tk.setPasswordSalt(a.get(1));
		tk.setEmail(requestParams.get("email"));		
		tk.setCmnd(requestParams.get("cmnd"));
		tk.setNgaySinh(java.sql.Date.valueOf(requestParams.get("ngaySinh")));		
		tk.setSoDT(requestParams.get("soDT"));		
		tk.setDiachi(requestParams.get("diachi"));
		System.out.println("pass: "+requestParams.get("password"));
		cr.SuaTK(tk);
		return "redirect:/home";	
	}
	
	@RequestMapping(value = "/signIn", method = RequestMethod.POST)
	public String signIn(@RequestParam String username, @RequestParam String pass, HttpServletRequest request, Model model) {
		boolean state = LoginSession.signIn(request, username, pass);
		if(!state) {
			model.addAttribute("errorNotFound", "Username hoặc password không đúng");
			return "login";
		}
		else {
			LoginUser log = LoginSession.getLoginInSession(request);
			if(log.getTk().isLoaiTK()) 
				return "redirect:/adminIndex";
			else
				return "redirect:/home";
		}
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
	public String homeAddGioHang(@RequestParam Integer PageBanh, @RequestParam Integer maBanh, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		GioHang gh = GioHangSession.getGioHangInSession(request);
//		System.out.println("timBanh: " + cr.timBanh(maBanh));
		gh.themBanh(cr.timBanh(maBanh).get(0));
		redirectAttributes.addAttribute("PageBanh", PageBanh);
		return "redirect:/home";
	}
	
	@RequestMapping(value = "/shoppingCart", method = RequestMethod.GET)
	public String cartShow(HttpServletRequest request, Model model) {
		GioHang gh = GioHangSession.getGioHangInSession(request);
//		System.out.println("cart detail: " + gh.getChiTietHoaDons().toString());
		model.addAttribute("gioHang", gh.getChiTietHoaDons());
		model.addAttribute("tongDonHang", gh.tong());
		return "cart";
	}
	
	@RequestMapping(value = "/shoppingCart", method = RequestMethod.POST)
	public String cartUpdateQuantity(@RequestParam Integer index, @RequestParam Integer soLuong, HttpServletRequest request, Model model) {
		GioHang gh = GioHangSession.getGioHangInSession(request);
		gh.capNhatSP(index - 1, soLuong);
		return "redirect:/shoppingCart";
	}
	
	@RequestMapping(value = "/removeGioHang", method = RequestMethod.POST)
	public String cartRemoveGioHang(@RequestParam Integer index, HttpServletRequest request) {
		GioHang gh = GioHangSession.getGioHangInSession(request);
		gh.xoaSP(index - 1);
		return "redirect:/shoppingCart";
	}
	
	@RequestMapping(value = "/checkoutCart", method = RequestMethod.GET)
	public String checkoutCart(HttpServletRequest request, Model model) {
		LoginUser log = LoginSession.getLoginInSession(request);
		TaiKhoan tk = log.getTk();
		if(tk == null) {
			return "redirect:/signInForm";
		}
		
		if(request.getSession().getAttribute("code") == null) {
			Random random = new Random();
		    int code = random.nextInt(999999 - 100000) + 100000;
		    request.getSession().setAttribute("code", code);
		    new EmailService().sendEmail(tk.getEmail(), "Xac nhan thanh toan", "Code xac nhan: " + code);
		    System.out.println(code);
		}

		GioHang gh = GioHangSession.getGioHangInSession(request);
		model.addAttribute("gioHang", gh.getChiTietHoaDons());
		model.addAttribute("tongDonHang", gh.tong());
		model.addAttribute("khachHang", tk);
		return "checkout";
	}
	
	@RequestMapping(value = "/confirmCheckout", method = RequestMethod.POST)
	public String checkout(@RequestParam Map<String, String> requestParams, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		LoginUser log = LoginSession.getLoginInSession(request);
		TaiKhoan tk = log.getTk();
		if(tk == null) {
			return "redirect:/signInForm";
		}
		
	
		GioHang gh = GioHangSession.getGioHangInSession(request);
//		System.out.println(gh);
		
		String hoKH = requestParams.get("lastName");
		String tenKH = requestParams.get("firstName");
		String diaChi = requestParams.get("address");
		String soDT = requestParams.get("phone");
		String soThe = requestParams.get("creditCardNumber") != "" ? requestParams.get("creditCardNumber") : "N/A";
		String payment = requestParams.get("payment");
		int errorCount = 0;
		// Phase 1: Check no credit cart info errorVerify
		if(payment.equalsIgnoreCase("creditCard")) {
			if(soThe.trim().equals("")) {
				redirectAttributes.addAttribute("errorCreditCard", "Số thẻ không được trống đối với thanh toán qua thẻ tín dụng");
				errorCount++;
			}
		}
		// Phase 2: Check errorVerify
		if(requestParams.get("codeVerify") == (request.getSession().getAttribute("code"))) {
			redirectAttributes.addAttribute("errorVerify", "Mã verify không đúng vui lòng kiểm tra lại");
			errorCount++;
		}
		if(errorCount > 0) {
			redirectAttributes.addAttribute("wrongInput", "Có thông tin nhập sai. Các trường nhập đã bị khôi phục thành mặc định, vui lòng nhập lại");
			return "redirect:/checkoutFormFailed";
		}
//		System.out.println(log.getTaiKhoanInfo().getId());
		boolean state = GioHangSession.thanhToan(gh, log.getTk(), hoKH, tenKH, soDT, diaChi, payment, soThe);
		if(state) {
			GioHangSession.removeCartInSession(request);
			request.getSession().setAttribute("code", null);
			redirectAttributes.addAttribute("PageBanh", 1);
			return "redirect:/home";
		}
		else {
			redirectAttributes.addAttribute("wrongInput", "Có thông tin nhập sai. Các trường nhập đã bị khôi phục thành mặc định, vui lòng nhập lại");
			return "redirect:/checkoutFormFailed";
		}
	}
	
	@RequestMapping(value = "/indexSuccess", method = RequestMethod.GET)
	public String homeChangePage(@RequestParam String orderSuccess, @RequestParam Integer PageBanh, Locale locale, Model model) {
		List<Banh> list = cr.getAllBanh();
		Integer f = new Integer(PageBanh);
		if(list == null)
			list = new ArrayList<Banh>();
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
		model.addAttribute("orderSuccess", orderSuccess);
		return "index";
	}
	
	// ADMIN
	@RequestMapping(value = "/adminIndex", method = RequestMethod.GET)
	public String adminindex(Model model) {
		model.addAttribute("ds", cr.getAllBanh());
		return "admin";
	}
	
	@RequestMapping(value = "/adminUpdate", method = RequestMethod.POST)
	public String adminUpdateBanh(@RequestParam int maBanhSua, @RequestParam int soLuong, @RequestParam String action, Model model) {
		if(action.equalsIgnoreCase("edit")) {
			Banh banh = cr.timBanh(maBanhSua).get(0);
			model.addAttribute("banh", banh);
			return "edit";
		}else {
			Banh banh = cr.timBanh(maBanhSua).get(0);
			banh.setSoLuong(soLuong);
			cr.suaBanh(banh);
			return "redirect:/adminIndex";
		}
	}
	
	@RequestMapping(value = "/adminEdit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("banh") Banh banh, Model model, RedirectAttributes redirectAttributes) {
		System.out.println("adminEdit");
		cr.suaBanh(banh);
		model.addAttribute("editSuccess", "Sửa thông tin bánh thành công");
		model.addAttribute("ds", cr.getAllBanh());
		return "redirect:/adminIndex";
	}
	
	@RequestMapping(value = "/adminInsertPage", method = RequestMethod.GET)
	public String insertForm(Model model) {
		Banh banh = new Banh();
		model.addAttribute("banh", banh);
		
		model.addAttribute("dsloaiBanh",cr.getAllBanh());
		return "insert";
	}
	
	@RequestMapping(value = "/adminInsert", method = RequestMethod.POST)
	public String insert(@ModelAttribute("banh") Banh banh, Model model, RedirectAttributes redirectAttributes) {
		cr.themBanh(banh);
		if(banh != null) {
			redirectAttributes.addAttribute("addSuccess", "Thêm thông tin bánh thành công");
			
			model.addAttribute("editSuccess", "Sửa thông tin bánh thành công");
			model.addAttribute("ds", cr.getAllBanh());
			return "redirect:/adminIndex";
		}
		else
		{
			redirectAttributes.addAttribute("errorFailed", "Không thể thêm thông tin bánh");
			model.addAttribute("banh", banh);
			model.addAttribute("dsloaiBanh", cr.getAllBanh());
			return "insert";
		}
	}
	
	//handle exception
	@ExceptionHandler(ResourceNotFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handleResourceNotFoundException(Model model) {
		System.out.println("404");
		model.addAttribute("error", "Lỗi 404 không tìm thấy trang");
		return "error";
	}
	
}
