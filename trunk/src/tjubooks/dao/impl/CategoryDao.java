package tjubooks.dao.impl;

import java.util.List;

import tjubooks.dao.ICategoryDao;
import tjubooks.dao.base.AGenericHibernateDao;
import tjubooks.po.Category;
import tjubooks.vo.PageBean;

public class CategoryDao extends AGenericHibernateDao<Category, Integer> implements
		ICategoryDao {
}
