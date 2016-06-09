package jp.co.seproject;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tbcard")
public class CardData {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column
	private int ids;

	@Column(length=40,nullable=false)
	private String cardnumber;

	@Column(length=40,nullable=false)
	private String point;

	@Column(length=40,nullable=false)
	private int cus;

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
}
