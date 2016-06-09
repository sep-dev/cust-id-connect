package jp.co.seproject;

import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.mail.internet.AddressException;

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

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public String postlist(@RequestParam int id, Model model) {
		SystemDao<CustomerData> dao = new SystemDaoImpl();
		dao.delete(id);


		return "redirect:/list";

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
		SystemDaoImplCard daocard = new SystemDaoImplCard();
		// ここまでおｋ
		List<CardData> list = daocard.findByCusId(id);

		model.addAttribute("cardlist", list);
        CardData cd = new CardData();


        model.addAttribute("iddata", iddata);
		model.addAttribute("cardData", cd);

        return "detail";
    }

   @RequestMapping(value = "/detail", params = "add" , method = RequestMethod.POST)
	public String postdetailadd(@ModelAttribute CardData cd, Model model) {
		SystemDao<CardData> dao = new SystemDaoImplCard();



		dao.add(cd);

		return "redirect:/detail?id=" + cd.getCus();
    }

    @RequestMapping(value = "/detail", params = "delete" , method = RequestMethod.POST)
	public String postdetaildelete(@RequestParam int cardid, @RequestParam("cusid") int cus, CardData cd, Model model) {

    	SystemDao<CardData> dao = new SystemDaoImplCard();

		dao.delete(cardid);

		return "redirect:/detail?id=" + cus;
    }

    @RequestMapping(value = "/cardlist", method = RequestMethod.GET)
    public String cardlist(Model model) {
        SystemDao<CardData> dao = new SystemDaoImplCard();
        List<CardData> list = dao.getAll();
        model.addAttribute("cardlist", list);
		CardData cd = new CardData();
        model.addAttribute("cardData", cd);
		SystemDao<CustomerData> daocus = new SystemDaoImpl();
		List<CustomerData> listcus = daocus.getAll();
		model.addAttribute("cuslist", listcus);
        return "cardlist";
    }

    @RequestMapping(value = "/cardlist", method = RequestMethod.POST)
    public String postcardlist(@RequestParam int id,Model model) {

    	SystemDao<CardData> dao = new SystemDaoImplCard();
        dao.delete(id);
        return "redirect:/cardlist";
    }


    @RequestMapping(value = "/mail", method = RequestMethod.GET)
    public String mail(Model model) {
		MailModel mm = new MailModel();
		model.addAttribute("mailModel", mm);

        return "mail";
    }

	@RequestMapping(value = "/mail", method = RequestMethod.POST)
	public String postmail(@ModelAttribute MailModel mm, Model model) throws AddressException {
		Mailer m = new Mailer();
		SystemDaoImpl dao = new SystemDaoImpl();
		List<CardData> list = dao.getMailaddressall();
		String[] Stringarray = (String[]) list.toArray(new String[0]);

		String subject = mm.getSubject();
		String honbun = mm.getHonbun();
		switch (mm.getTo()) {
		case "all":
		for (int i = 0; i < Stringarray.length; i++) {
			String aaa = Stringarray[i];

			if (aaa.equals("")) {
				continue;
			} else {

			m.sendmail(aaa, subject, honbun);
			System.out.println(Stringarray[i]);
			}
		}
		break;
		case "random":
			int fuck = new Random().nextInt(Stringarray.length);
			m.sendmail(Stringarray[fuck], subject, honbun);
			System.out.println(fuck);
			break;

		case "gomi":

		}
		return "redirect:/mail";
	}
}

