package jp.co.seproject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Autowired
private  SystemDao  SystemDaoInpl;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Model model) {
        return "home";
    }

	@RequestMapping(value = "/top", method = RequestMethod.GET)
	public String top(Model model) {
		return "top";
	}

	@RequestMapping(value = "/entry", method = RequestMethod.GET)
    public String getentry(@ModelAttribute CustomerData cutomerData, Model model) {
	    CustomerData cd = new CustomerData();
        model.addAttribute("cutomerData", cd);
        return "entry";
    }
	@RequestMapping(value = "/entry", method = RequestMethod.POST)
    public String postentry(@ModelAttribute CustomerData cd, Model model) {
            String name = cd.getName().trim();
            String address = cd.getAddress().trim();
            String tel = cd.getTel().trim();
            String mailaddress = cd.getMailaddress().trim();
            String gender = cd.getGender().trim();
            int birth = cd.getBirth().trim();

            SystemDao.insert(name, address, tel);

        return "entry";
    }
	@RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model) {
        return "list";
    }
	@RequestMapping(value = "/update", method = RequestMethod.GET)
    public String update(Model model) {
        return "update";
    }
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String detail (Model model) {
        return "detail";
    }
	@RequestMapping(value = "/cardlist", method = RequestMethod.GET)
    public String cardlist(Model model) {
        return "cardlist";
    }
	@RequestMapping(value = "/mail", method = RequestMethod.GET)
    public String mail(Model model) {
        return "mail";
    }
}
