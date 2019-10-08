package guest;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import java.util.List;

public class UsersDao implements UsersDaoInterface<Users, String> {

	private Session currentSession;

	private Transaction currentTransaction;

	public UsersDao() {
	}

	public Session openCurrentSession() {
		currentSession = getSessionFactory().openSession();
		return currentSession;
	}

	public Session openCurrentSessionwithTransaction() {
		currentSession = getSessionFactory().openSession();
		currentTransaction = currentSession.beginTransaction();
		return currentSession;
	}

	public void closeCurrentSession() {
		currentSession.close();
	}

	public void closeCurrentSessionwithTransaction() {
		currentTransaction.commit();
		currentSession.close();
	}

	private static SessionFactory getSessionFactory() {
		Configuration configuration = new Configuration().configure();
		StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder()
				.applySettings(configuration.getProperties());
		SessionFactory sessionFactory = configuration.buildSessionFactory(builder.build());
		return sessionFactory;
	}

	public Session getCurrentSession() {
		return currentSession;
	}

	public void setCurrentSession(Session currentSession) {
		this.currentSession = currentSession;
	}

	public Transaction getCurrentTransaction() {
		return currentTransaction;
	}

	public void setCurrentTransaction(Transaction currentTransaction) {
		this.currentTransaction = currentTransaction;
	}

	public void persist(Users entity) {
		getCurrentSession().save(entity);
	}

	public void update(Users entity) {
		getCurrentSession().update(entity);
	}

	public Users findById(String id) {
		Users cities = (Users) getCurrentSession().get(Users.class, id);
		return cities;
	}

	public void delete(Users entity) {
		getCurrentSession().delete(entity);
	}

	@SuppressWarnings("unchecked")
	public List<Users> findAll() {
		List<Users> cities = (List<Users>) getCurrentSession().createQuery("from Cities").list();
		return cities;
	}

	public void deleteAll() {
		List<Users> entityList = findAll();
		for (Users entity : entityList) {
			delete(entity);
		}
	}

}
