package jp.co.seproject;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Pattern;

@Entity
@Table(name = "tbcard", uniqueConstraints = { @UniqueConstraint(columnNames = { "cardnumber" }) })
public class CardData {


	@Id
	@Column(length = 40, nullable = false)
	@Pattern(regexp = "^[1-9][0-9]{2,4}$")
	private String cardnumber;

	@Pattern(regexp = "^[1-9][0-9]*$|0")
	@Column(length = 40, nullable = false)
	private String point;



	@OneToOne(mappedBy = "carddata", cascade = CascadeType.ALL)
	private HestiaData hestia;




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

	public HestiaData getHestia() {
		return hestia;
	}

	public void setHestia(HestiaData hestia) {
		this.hestia = hestia;
	}

}
