package jp.co.seproject;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Pattern;

@Entity
@Table(name = "tbcard", uniqueConstraints = { @UniqueConstraint(columnNames = { "cardnumber" }) })
public class CardData {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column
	private int ids;

	@Column(length = 40, nullable = false, unique = true)
	@Pattern(regexp = "^[1-9][0-9]{2,4}$")
	private String cardnumber;

	/* @Pattern(regexp = "^[1-9][0-9]+$|0") */
	@Column(length = 40, nullable = false)
	private String point;

	@Column(length = 40, nullable = false)
	private int cus;

	@ManyToOne
	private CustomerData customerdata;

	public int getIds() {
		return ids;
	}

	public void setIds(int ids) {
		this.ids = ids;
	}

	public int getCus() {
		return cus;
	}

	public void setCus(int cus) {
		this.cus = cus;
	}

	public void setCardnumber(String cardnumber) {
		this.cardnumber = cardnumber;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public String getCardnumber() {
		return cardnumber;
	}

	public String getPoint() {
		return point;
	}

	public CustomerData getCustomerdata() {
		return customerdata;
	}

	public void setCustomerdata(CustomerData customerdata) {
		this.customerdata = customerdata;
	}
}
