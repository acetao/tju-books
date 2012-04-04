package tjubooks.dao.impl;

import java.util.List;

import tjubooks.dao.IBookDao;
import tjubooks.dao.base.AGenericHibernateDao;
import tjubooks.po.Book;
import tjubooks.vo.PageBean;

public class BookDao extends AGenericHibernateDao<Book, Integer> implements IBookDao {
}
