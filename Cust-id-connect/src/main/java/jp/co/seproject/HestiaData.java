package jp.co.seproject;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbhestia")
public class HestiaData {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@ManyToOne(cascade = CascadeType.ALL)
	private CustomerData customerdata;

	@OneToOne(cascade = CascadeType.ALL)
	private CardData carddata;

	public HestiaData() {
		super();

	}






	public CustomerData getCustomerdata() {
		return customerdata;
	}

	public void setCustomerdata(CustomerData customerdata) {
		this.customerdata = customerdata;
	}

	public CardData getCarddata() {
		return carddata;
	}

	public void setCarddata(CardData carddata) {
		this.carddata = carddata;
	}

}
