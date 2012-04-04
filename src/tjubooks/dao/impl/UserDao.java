package tjubooks.dao.impl;

import java.util.List;

import tjubooks.dao.IUserDao;
import tjubooks.dao.base.AGenericHibernateDao;
import tjubooks.po.User;
import tjubooks.vo.PageBean;

public class UserDao extends AGenericHibernateDao<User, Integer> implements
		IUserDao {
}
