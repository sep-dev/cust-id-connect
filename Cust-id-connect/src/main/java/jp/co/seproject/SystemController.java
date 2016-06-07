package jp.co.seproject;

import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

		return "redirect:/list";
	}
	@RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model) {
        SystemDao<CustomerData> dao = new SystemDaoImpl();
        List<CustomerData> list = dao.getAll();
        model.addAttribute("cuslist", list);
        CustomerData cd = new CustomerData();
        model.addAttribute("customerData", cd);
        return "list";
    }
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String update(@RequestParam int id,Model model) {
        CustomerData cd = new CustomerData();
        SystemDao<CustomerData> dao = new SystemDaoImpl();
        CustomerData iddata = dao.findById(id);
        model.addAttribute("customerData", cd);
        model.addAttribute("iddata", iddata);

        return "update";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String postupdate(@RequestParam int id, @ModelAttribute CustomerData customerdata, Model model) {
        SystemDao<CustomerData> dao = new SystemDaoImpl();
        dao.update(customerdata);

        return "redirect:/list";
    }

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String detail(@RequestParam int id,Model model) {
        SystemDao<CustomerData> dao = new SystemDaoImpl();
        CustomerData iddata = dao.findById(id);
        SystemDao<CardData> daocard = new SystemDaoImplCard();
        List<CardData> list = daocard.getAll(/*id*/);
        model.addAttribute("cardlist", list);
        CardData cd = new CardData();
        model.addAttribute("iddata", iddata);
        model.addAttribute("cardData", cd);

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
        SystemDao<CardData> dao = new SystemDaoImplCard();
        List<CardData> list = dao.getAll();
        model.addAttribute("cardlist", list);
        CardData cd = new CardData();
        model.addAttribute("cardData", cd);
        return "cardlist";
    }

    @RequestMapping(value = "/mail", method = RequestMethod.GET)
    public String mail(Model model) {
        return "mail";
    }
}

