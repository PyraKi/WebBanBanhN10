package fit.se.webapp;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fit.se.service.BanhService;

@Controller
public class HomeController {
	
	private BanhService banhService;
	
	@Autowired(required=true)
	@Qualifier(value="banhService")
	public void setPersonService(BanhService bs){
		this.banhService = bs;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		System.out.println("-------test-------");
		System.out.println(banhService.getAllBanh());
		
		return "home";
	}
	
}
