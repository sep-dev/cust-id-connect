package jp.co.seproject;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class SystemDaoImplCard implements SystemDao<CardData> {
	private static final long serialVersionUID = 1L;
	private static EntityManagerFactory factory = Persistence.createEntityManagerFactory("persistenceUnit");

	// 全件表示
	public List<CardData> getAll() {
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("from CardData ");
		@SuppressWarnings("unchecked")
		List<CardData> list = query.getResultList();
		manager.close();
		return list;
	}

	// カードナンバー取得
	public List<CardData> getAllcard() {
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("select cardnumber from CardData ");
		@SuppressWarnings("unchecked")
		List<CardData> list = query.getResultList();
		manager.close();
		return list;
	}

	// ｼﾞｮｲﾝｼﾞｮｲﾝ
	public List<CardData> joinjoin() {
		EntityManager manager = factory.createEntityManager();
		Query query = manager
				.createNativeQuery("select * from tbcard left join tbcus on tbcard.customerdata_id = tbcus.id");

		@SuppressWarnings("unchecked")
		List<CardData> list = query.getResultList();
		manager.close();
		return list;
	}
	// 検索
	public CardData findById(int id) {
		EntityManager manager = factory.createEntityManager();
		return (CardData) manager.createQuery("from CardData where id = " + id).getSingleResult();
	}

	// 登録
	public void add(CardData carddata) {

		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		manager.persist(carddata);
		transaction.commit();
		manager.close();
	}

	// 更新
	public void update(CardData carddata) {
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		manager.merge(carddata);
		transaction.commit();
		manager.close();
	}

	// 削除
	public void delete(int id) {
		delete(findById(id));
	}

	public void delete(CardData Carddata) {
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		CardData delete = manager.merge(Carddata);
		manager.remove(delete);
		transaction.commit();
		manager.close();
	}

	// cusidから検索
	public List<CardData> findByCusId(int cus) {
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("from CardData where customerdata = " + cus);

		@SuppressWarnings("unchecked")
		List<CardData> list = query.getResultList();
		manager.close();
		return list;
	}

	// 重複検索
	public int findByCardnumber(String cn) {
		EntityManager manager = factory.createEntityManager();
		return manager.createQuery("from CardData where cardnumber =" + cn).getMaxResults();



	}

	@Override
	public CardData findById(Long l) {
		EntityManager manager = factory.createEntityManager();
		return (CardData) manager.createQuery("from CardData where id = " + l).getSingleResult();
	}



}
