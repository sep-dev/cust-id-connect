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

	//全件表示
	public List<CustomerData> getAll() {
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("from CustomerData");
		@SuppressWarnings("unchecked")
		List<CustomerData> list = query.getResultList();
		manager.close();
		return list;

	}

	//検索
	public CustomerData findById(int id){
	    EntityManager manager = factory.createEntityManager();
	    return (CustomerData)manager.createQuery("from CustomerData where id = "+id).getSingleResult();
	}

	// メアド全部
	public List<CardData> getMailaddressall() {
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createNativeQuery("select mailaddress from tbcus ");
		@SuppressWarnings("unchecked")
		List<CardData> list = query.getResultList();
		manager.close();
		return list;
	}

	//登録
	public void add(CustomerData customerdata) {
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		manager.persist(customerdata);
		transaction.commit();
		manager.close();
	}

	//更新
	public void update(CustomerData customerdata) {
        EntityManager manager = factory.createEntityManager();
        EntityTransaction transaction = manager.getTransaction();
        transaction.begin();
        manager.merge(customerdata);
        transaction.commit();
        manager.close();
    }

	//削除
	public void delete(int id){
	    delete(findById(id));
	}

	public void delete(CustomerData customerdata) {
        EntityManager manager = factory.createEntityManager();
        EntityTransaction transaction = manager.getTransaction();
        transaction.begin();
        CustomerData delete = manager.merge(customerdata);
        manager.remove(delete);
        transaction.commit();
        manager.close();
    }
}
