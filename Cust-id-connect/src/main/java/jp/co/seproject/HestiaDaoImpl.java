package jp.co.seproject;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class HestiaDaoImpl implements SystemDao<HestiaData> {
	private static final long serialVersionUID = 1L;

	private static EntityManagerFactory factory = Persistence.createEntityManagerFactory("persistenceUnit");
	@Override
	public List<HestiaData> getAll() {
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("from HestiaData");
		@SuppressWarnings("unchecked")
		List<HestiaData> list = query.getResultList();
		manager.close();
		return list;
	}

	@Override
	public HestiaData findById(Long l) {
		// TODO 自動生成されたメソッド・スタブ
		return null;
	}

	@Override
	public void add(HestiaData data) {
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		manager.persist(data);
		transaction.commit();
		manager.close();

	}

	@Override
	public void update(HestiaData data) {
		// TODO 自動生成されたメソッド・スタブ

	}

	@Override
	public void delete(int id) {
		delete(findById(id));
	}

	@Override
	public void delete(HestiaData data) {
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		HestiaData delete = manager.merge(data);
		manager.remove(delete);
		System.out.println("さくじょちゅ");
		transaction.commit();
		manager.close();

	}

	@Override
	public HestiaData findById(int id) {
		EntityManager manager = factory.createEntityManager();
		Query query = manager
				.createQuery("from HestiaData where customerdata =" + id);
		System.out.println("けんさくちゅ");
		HestiaData data = (HestiaData) query.getSingleResult();
		System.out.println(data);
		manager.close();
		return data;
	}

	public void idadd(int id) {
		EntityManager manager = factory.createEntityManager();

		Query query = manager.createNativeQuery("insert into tbhestia(customerdata_id)value(" + id + ")");
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		query.executeUpdate();
		transaction.commit();
		manager.close();
	}

	public List<HestiaData> findByCusId(int cus) {
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("from HestiaData where customerdata = " + cus);

		@SuppressWarnings("unchecked")
		List<HestiaData> list = query.getResultList();
		manager.close();
		return list;
	}

	public void cardnumberupdate(int id, String cardnumber) {
		EntityManager manager = factory.createEntityManager();
		Query query = manager
				.createNativeQuery
		("insert into tbhestia(customerdata_id,carddata_cardnumber)values(" + id + "," + cardnumber + ")");
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		query.executeUpdate();
		transaction.commit();
		manager.close();
	}

	public void himodelete(int cardnumber) {
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createNativeQuery("delete from tbhestia where carddata_cardnumber =" + cardnumber);
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		query.executeUpdate();
		transaction.commit();
		manager.close();
	}

	public List<HestiaData> cardsearch(int id) {
		EntityManager manager = factory.createEntityManager();
		Query query = manager
				.createQuery("from HestiaData where customerdata =" + id);
		System.out.println("けんさくちゅ");
		@SuppressWarnings("unchecked")
		List<HestiaData> data = query.getResultList();
		System.out.println(data);
		manager.close();
		return data;

	}

	public List<HestiaData> findAllUsers() {
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("select tbhestia.customerdata_id,tbcus.name,tbcus.address,"
				+ "tbcus.tel,tbcus.mailaddress,tbcus.birth,tbcus.gender,tbhestia.carddata_cardnumber,tbcard.pointfrom tbhestia"
				+ " left join tbcard on tbcard.cardnumber = tbhestia.carddata_cardnumber"
				+ " left join tbcus on tbcus.id = tbhestia.customerdata_id");
		System.out.println("けんさくちゅ");
		@SuppressWarnings("unchecked")
		List<HestiaData> data = query.getResultList();
		System.out.println(data);
		manager.close();
		return data;

	}
}
