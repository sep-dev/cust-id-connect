package jp.co.seproject;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Component;




@Component
public class SystemDaoImpl implements SystemDao<CustomerData> {

	private static EntityManagerFactory factory =
			Persistence.createEntityManagerFactory("persistenceUnit");
	@Override
	public List<CustomerData> getAll(){
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("FROM CustomerData");
		@SuppressWarnings("unchecked")
		List<CustomerData> list = query.getResultList();
		manager.close();
		return list;
	}
	@Override
	public void add(CustomerData data){
		EntityManager manager = factory.createEntityManager();
		EntityTransaction tran = manager.getTransaction();
		tran.begin();
		manager.persist(data);
		tran.commit();
		manager.close();
	}


}
