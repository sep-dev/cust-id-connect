package jp.co.seproject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SystemController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String top(Model model){
		return "top";
	}

	@RequestMapping(value = "/entry", method = RequestMethod.GET)
	public String getentry(Model model){
		CustomerData fuck = new CustomerData();
		model.addAttribute("test", "顧客登録");

		model.addAttribute("customerData",fuck);


		return "entry";

	}

	@RequestMapping(value = "/entry", method = RequestMethod.POST)
	public String postentry(@ModelAttribute CustomerData customerdata, Model model) {
		SystemDao<CustomerData> dao = new SystemDaoImpl();
		dao.add(customerdata);

		return "redirect:/";


	}


}
