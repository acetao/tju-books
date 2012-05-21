package tjubooks.biz.impl;

import java.util.List;

import tjubooks.biz.IUserBiz;
import tjubooks.dao.IUserDao;
import tjubooks.po.User;

public class UserBiz implements IUserBiz {
    private IUserDao userDao;

	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public void add(User user) {
		userDao.save(user);
	}

	@Override
	public boolean isUsernameExist(User user) {
		String hql= "from User u where u.username = ?" ;
		List<User> users = this.userDao.findByHQL(hql, new Object[]{user.getUsername()});
		if(users != null && users.size() > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean isPasswdMatched(User user) {
		String hql= "from User u where u.username=? and u.password=?" ;
		List<User> users = this.userDao.findByHQL(hql, new Object[]{user.getUsername(), user.getPassword()});
		if(users != null && users.size() > 0) {
			return true;
		}
		return false;
	}

	@Override
	public User getUserById(int id) {
		return userDao.findById(id);
	}

	@Override
	public int getUserIdByName(String username) {
		String hql= "from User u where u.username=?" ;
		List<User> users = this.userDao.findByHQL(hql, new Object[]{username});
		return users.get(0).getUserid();
	}

	@Override
	public void updateUser(User user) {
		System.out.println("UserBiz.updateUser:userid="+user.getUserid());
		this.userDao.update(user);
	}
}
