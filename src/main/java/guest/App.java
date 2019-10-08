package guest;

import guest.Users;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.List;

public class App {

	public static void main(String[] args) {

		SessionFactory factory;

		try {
			factory = new Configuration().configure().buildSessionFactory();
		} catch (Throwable ex) {
			System.err.println("Failed to create sessionFactory object." + ex);
			throw new ExceptionInInitializerError(ex);
		}

		Session session = factory.openSession();

		Criteria criteria = session.createCriteria(Users.class);
		List<Users> list = criteria.add(Restrictions.eq("resetToken", "e7b6ee3a-27d1-452e-a280-7360bc6e718b")).list();
		String line ;
		if (list.size() != 0)
		{
			System.out.println("Size "+ list.size());
			line = list.get(0).toString();
			String dateRec = line.split(",")[1];
			System.out.println(dateRec);
		}
		else
		{
			System.out.println("Does not exist");
		}
		//System.out.println("Book found with id " + email + " is =>" + another.toString());
		System.out.println("*** Find - end ***");


/*

		/*

		List<Users> books1 = UsersService.findAll();
		System.out.println("Books Persisted are :");
		for (Users b : books1) {
			System.out.println("-" + b.toString());
		}
		System.out.println("*** Persist - end ***");
		System.out.println("*** Update - start ***");
		book1.setTitle("The Idiot");
		bookService.update(book1);
		System.out.println("Book Updated is =>" +bookService.findById(book1.getId()).toString());
		System.out.println("*** Update - end ***");
		System.out.println("*** Find - start ***");
		String id1 = book1.getId();
		Book another = bookService.findById(id1);
		System.out.println("Book found with id " + id1 + " is =>" + another.toString());
		System.out.println("*** Find - end ***");
		System.out.println("*** Delete - start ***");
		String id3 = book3.getId();
		bookService.delete(id3);
		System.out.println("Deleted book with id " + id3 + ".");
		System.out.println("Now all books are " + bookService.findAll().size() + ".");
		System.out.println("*** Delete - end ***");
		System.out.println("*** FindAll - start ***");
		List<Book> books2 = bookService.findAll();

		System.out.println("Books found are :");
		for (Users b : city1) {
			System.out.println("-" + b.toString());
		}
		System.out.println("*** FindAll - end ***");
		System.out.println("*** DeleteAll - start ***");
		UsersService.deleteAll();

		for (Users b : UsersService.findAll()) {
			System.out.println("- City: " + b.getcityname());
		}
		System.out.println("Books found are now " + UsersService.findAll().size());
		System.out.println("*** DeleteAll - end ***");
		 System.exit(0);
		 */

	}

	/** table creation statement:
	 CREATE TABLE `library`.`book` ( id VARCHAR(50) NOT NULL, title
	 VARCHAR(20) default NULL, author VARCHAR(50) default NULL, PRIMARY KEY
	 (id) );
	 */
}
