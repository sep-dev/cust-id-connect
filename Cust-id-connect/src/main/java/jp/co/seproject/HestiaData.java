package jp.co.seproject;


    import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

    @Entity
    @Table(name="tbhestiaS")
    public class HestiaData {

        @Id
        @GeneratedValue(strategy=GenerationType.AUTO)
        @Column
        private int id;

        @Column
        private int cusid;

        @Column
        private int cardnumber;

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public int getCusid() {
            return cusid;
        }

        public void setCusid(int cusid) {
            this.cusid = cusid;
        }

        public int getCardnumber() {
            return cardnumber;
        }

        public void setCardnumber(int cardnumber) {
            this.cardnumber = cardnumber;
        }

}