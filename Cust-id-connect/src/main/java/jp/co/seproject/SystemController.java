package jp.co.seproject;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SystemController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
        return "home";
    }
    @RequestMapping(value = "/top", method = RequestMethod.GET)
    public String top(Locale locale, Model model) {
        return "top";
    }

	@RequestMapping(value = "/entry", method = RequestMethod.GET)
	public String getentry(Model model){
		CustomerData cd = new CustomerData();
		model.addAttribute("customerData",cd);

		return "entry";

	}

	@RequestMapping(value = "/entry", method = RequestMethod.POST)
	public String postentry(@ModelAttribute CustomerData customerdata, Model model) {
		SystemDao<CustomerData> dao = new SystemDaoImpl();
		dao.add(customerdata);

		return "redirect:/";
	}
	@RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model) {
       /* SystemDao<?> dao = new SystemDaoImpl();
        List<?> list = dao.getAll();
        model.addAttribute("cuslist", list);*/
        CustomerData cd = new CustomerData();
        model.addAttribute("customerData", cd);
        return "list";
    }

    @RequestMapping(value = "/list",params = "detail", method = RequestMethod.POST)
    public String listdetail(@ModelAttribute CustomerData cd, Model model) {
        int id = cd.getId();
        //IDで情報を検索

        return "detail";
    }

    @RequestMapping(value = "/list",params = "update", method = RequestMethod.POST)
    public String listupdate(@ModelAttribute CustomerData cd, Model model) {
        int id = cd.getId();
        //IDで情報を検索

        return "update";
    }
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String update(Model model) {
        CustomerData cd = new CustomerData();
        model.addAttribute("customerData", cd);
        return "update";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String postupdate(@ModelAttribute CustomerData customerdata, Model model) {
        SystemDao<CustomerData> dao = new SystemDaoImpl();
        //dao.update(customerdata);

        return "redirect:/";
    }

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String detail(Model model) {
            CardData cardd = new CardData();
            model.addAttribute("cardData", cardd);

        return "detail";
    }

    @RequestMapping(value = "/detail", method = RequestMethod.POST)
    public String postdetail(@ModelAttribute CardData cd, Model model) {
        int number = cd.getCardnumber();
        int point = cd.getPoint();
        System.out.println(number+"と"+point);
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

