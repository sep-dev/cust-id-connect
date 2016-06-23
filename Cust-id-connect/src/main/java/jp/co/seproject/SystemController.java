package jp.co.seproject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SystemController {


	@ExceptionHandler(javax.persistence.RollbackException.class)
	public String rollbackHandler() {

		return "error";
	}

	@ExceptionHandler(javax.persistence.PersistenceException.class)
	public String persistenceHandler() {

		return "error";
	}

	// プロパティエディター
	/*
	 * @InitBinder protected void initBinder(HttpServletRequest request,
	 * ServletRequestDataBinder binder) throws Exception {
	 * binder.registerCustomEditor(CustomerData.class, new CCPropertyEditor());
	 * }
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "home";
	}

	@RequestMapping(value = "/top", method = RequestMethod.GET)
	public String top(Locale locale, Model model) {

		return "top";
	}

	@RequestMapping(value = "/entry", method = RequestMethod.GET)
	public String getentry(Model model) {
		CustomerData cd = new CustomerData();

		model.addAttribute("customerData", cd);

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
	public String update(@RequestParam int id, Model model) {
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
	public String detail(@RequestParam int id, Model model) {

		SystemDaoImpl dao = new SystemDaoImpl();
		CustomerData cusdata = dao.findById(id);
		// ここまでおｋ
		HestiaDaoImpl hestia = new HestiaDaoImpl();
		List<HestiaData> list = hestia.findByCusId(id);
		System.out.println(list);
		CardData cd = new CardData();
		model.addAttribute("cusdata", cusdata);
		model.addAttribute("hestialist", list);
		model.addAttribute("command", cd);

		model.addAttribute("cardData", cd);

		return "detail";
	}

	@RequestMapping(value = "/detail", params = "add", method = RequestMethod.POST)
	public String postdetailadd(@RequestParam int id, @Valid @ModelAttribute CardData cd, BindingResult result,
			Model model) {

		SystemDaoImplCard dao = new SystemDaoImplCard();
		HestiaDaoImpl hestiadao = new HestiaDaoImpl();
		dao.add(cd);

		System.out.println(cd.getCardnumber());

		hestiadao.cardnumberupdate(id, cd.getCardnumber());

		return "redirect:/detail?id=" + id;// 仮
	}

	@RequestMapping(value = "/detail", params = "delete", method = RequestMethod.POST)
	public String postdetaildelete(@RequestParam int cardid, @RequestParam("cusid") int cus, CardData cd, Model model) {

		SystemDao<CardData> dao = new SystemDaoImplCard();
		HestiaDaoImpl hesdao = new HestiaDaoImpl();
		hesdao.himodelete(cardid);
		dao.delete(cardid);

		return "redirect:/detail?id=" + cus;
	}

	@RequestMapping(value = "/detail", params = "fuck", method = RequestMethod.POST)
	public String postdetailpoint(@Valid @RequestParam int cardid, @RequestParam("cusid") int cus,
			@ModelAttribute CardData cd, BindingResult result, Model model) {
		if (result.hasErrors()) {
			SystemDaoImpl dao = new SystemDaoImpl();
			CustomerData cusdata = dao.findById(cus);
			// ここまでおｋ
			HestiaDaoImpl hestia = new HestiaDaoImpl();
			List<HestiaData> list = hestia.findByCusId(cus);
			System.out.println(list);

			model.addAttribute("cusdata", cusdata);
			model.addAttribute("hestialist", list);
			model.addAttribute("command", cd);

			model.addAttribute("cardData", cd);

			model.addAttribute("fuck", "カードナンバーとポイントを確認してください♡");
			return "detail";
		} else {
			SystemDaoImplCard dao = new SystemDaoImplCard();

			dao.update(cd);
		}
		return "redirect:/detail?id=" + cus;
	}

	@RequestMapping(value = "/cardlist", method = RequestMethod.GET)
	public String cardlist(Model model) {
		HestiaDaoImpl hestiadao = new HestiaDaoImpl();
		List<HestiaData> list = hestiadao.getAll();
		model.addAttribute("cardlist", list);
		CardData cd = new CardData();
		model.addAttribute("cardData", cd);
		/*
		 * SystemDao<CustomerData> daocus = new SystemDaoImpl();
		 * List<CustomerData> listcus = daocus.getAll();
		 * model.addAttribute("cuslist", listcus);
		 */
		return "cardlist";
	}

	@RequestMapping(value = "/cardlist", method = RequestMethod.POST)
	public String postcardlist(@RequestParam("id") int cardnumber, Model model) {

		HestiaDaoImpl hestiadao = new HestiaDaoImpl();
		hestiadao.himodelete(cardnumber);
		SystemDaoImplCard cardao = new SystemDaoImplCard();
		cardao.delete(cardnumber);
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
		// ランダム1件の送信
		case "random":
			int fuck = new Random().nextInt(Stringarray.length);
			m.sendmail(Stringarray[fuck], subject, honbun);
			System.out.println(fuck);
			break;

		case "gomi":

		}
		return "redirect:/mail";
	}

	@RequestMapping(value = "/postdelete", method = RequestMethod.GET)
	public String postdeleteget(Model model){
		return "home";
	}

	@RequestMapping(value = "/postdelete", method = RequestMethod.POST)
	public String deleteconfi(@RequestParam("id") int id, Model model) {
		SystemDaoImpl dao1 = new SystemDaoImpl();
		HestiaDaoImpl dao2 = new HestiaDaoImpl();
		List<HestiaData> hes = dao2.cardsearch(id);//
		CustomerData cusdata = dao1.findById(id);
		model.addAttribute("name", cusdata);
		model.addAttribute("cards", hes);
		System.out.println(hes);
		return "deleteconfi";
	}

	@RequestMapping("/download")
	public void csvDownload(HttpServletResponse response) {

		// 文字コードと出力するCSVファイル名を設定
		response.setContentType("text/csv;charset=sjis");
		response.setHeader("Content-Disposition", "attachment; filename=\"test.csv\"");
		HestiaDaoImpl hestia = new HestiaDaoImpl();
		// try-with-resources文を使うことでclose処理を自動化
		String midashi = "ID,名前,住所,電話番号,メールアドレス,性別,誕生月,カード番号,ポイント数\r\n";

		try (PrintWriter pw = response.getWriter()) {
			pw.print(midashi);
			List<HestiaData> all_users = hestia.getAll();
			for (int i = 0; i < all_users.size(); i++) {
				long id = all_users.get(i).getCustomerdata().getId();
				String name = all_users.get(i).getCustomerdata().getName();
				String address = all_users.get(i).getCustomerdata().getAddress();
				String tel = all_users.get(i).getCustomerdata().getTel();
				String mailaddress = all_users.get(i).getCustomerdata().getMailaddress();
				String gender = all_users.get(i).getCustomerdata().getGender();
				String birth = all_users.get(i).getCustomerdata().getBirth();
				String cardnumber = all_users.get(i).getCarddata().getCardnumber();
				String point = all_users.get(i).getCarddata().getPoint();

				String outputString = id + "," + name + "," + address + "," + tel + "," + mailaddress + "," + gender
						+ "," + birth + "," + cardnumber + "," + point
						+ "\r\n";

				// CSVファイルに書き込み
				pw.print(outputString);
				System.out.println(outputString);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
