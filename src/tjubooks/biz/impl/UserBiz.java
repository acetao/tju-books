package tjubooks.biz.impl;

import tjubooks.biz.IUserBiz;
import tjubooks.dao.IUserDao;

public class UserBiz implements IUserBiz {
    private IUserDao userDao;

	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
    
}
