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


	public List<CustomerData> getAll() {
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("from CustomerData");
		@SuppressWarnings("unchecked")
		List<CustomerData> list = query.getResultList();
		manager.close();
		return list;

	}

	public void add(CustomerData customerdata) {
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		manager.persist(customerdata);
		transaction.commit();
		manager.close();

	}
}
