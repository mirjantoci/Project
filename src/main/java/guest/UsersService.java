package guest;

import java.util.List;

public class UsersService {

	private static UsersDao usersDao;

	public UsersService() {
		usersDao = new UsersDao();
	}

	public void persist(Users entity) {
		usersDao.openCurrentSessionwithTransaction();
		usersDao.persist(entity);
		usersDao.closeCurrentSessionwithTransaction();
	}

	public void update(Users entity) {
		usersDao.openCurrentSessionwithTransaction();
		usersDao.update(entity);
		usersDao.closeCurrentSessionwithTransaction();
	}

	public Users findById(String id) {
		usersDao.openCurrentSession();
		Users cities = usersDao.findById(id);
		usersDao.closeCurrentSession();
		return cities;
	}

	public void delete(String id) {
		usersDao.openCurrentSessionwithTransaction();
		Users cities = usersDao.findById(id);
		usersDao.delete(cities);
		usersDao.closeCurrentSessionwithTransaction();
	}

	public List<Users> findAll() {
		usersDao.openCurrentSession();
		List<Users> users = usersDao.findAll();
		usersDao.closeCurrentSession();
		return users;
	}

	public void deleteAll() {
		usersDao.openCurrentSessionwithTransaction();
		usersDao.deleteAll();
		usersDao.closeCurrentSessionwithTransaction();
	}

	public UsersDao bookDao() {
		return usersDao;
	}
}
