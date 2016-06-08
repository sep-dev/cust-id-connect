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
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column
	private int id;

	@Column(length=40,nullable=false)
	private int cardnumber;

	@Column(length=40,nullable=false)
	private int point;

	@Column(length=40,nullable=false)
	private int cusid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCardnumber() {
		return cardnumber;
	}

	public void setCardnumber(int cardnumber) {
		this.cardnumber = cardnumber;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getCusid() {
		return cusid;
	}

	public void setCusid(int cusid) {
		this.cusid = cusid;
	}
}
