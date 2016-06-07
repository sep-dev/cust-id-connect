package jp.co.seproject;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class SystemDaoImpl implements SystemDao<CustomerData> {
	private static final long serialVersionUID = 1L;
	private static EntityManagerFactory factory = Persistence.createEntityManagerFactory("persistenceUnit");

	//CustomerData
	//全件表示
	public List<CustomerData> getCusAll() {
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("from CustomerData");
		@SuppressWarnings("unchecked")
		List<CustomerData> list = query.getResultList();
		manager.close();
		return list;

	}

	//検索
	public CustomerData findByCusId(int id){
	    EntityManager manager = factory.createEntityManager();
	    return (CustomerData)manager.createQuery("from CustomerData where id = "+id).getSingleResult();
	}

	//登録
	public void addCus(CustomerData customerdata) {
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		manager.persist(customerdata);
		transaction.commit();
		manager.close();
	}

	//更新
	public void updateCus(CustomerData customerdata) {
        EntityManager manager = factory.createEntityManager();
        EntityTransaction transaction = manager.getTransaction();
        transaction.begin();
        manager.merge(customerdata);
        transaction.commit();
        manager.close();
    }

	//CardData
	public List<CardData> getCardAll() {
        EntityManager manager = factory.createEntityManager();
        Query query = manager.createQuery("from CardData");
        @SuppressWarnings("unchecked")
        List<CardData> list = query.getResultList();
        manager.close();
        return list;
    }
}
