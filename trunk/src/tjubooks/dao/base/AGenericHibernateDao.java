package tjubooks.dao.base;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import tjubooks.vo.PageBean;

public abstract class AGenericHibernateDao<T extends Serializable, ID extends Serializable>
		extends HibernateDaoSupport implements IGenericDao<T, ID> {

	private Class<T> persistentClass;

	@SuppressWarnings("unchecked")
	public AGenericHibernateDao() {
		this.persistentClass = (Class<T>) ((ParameterizedType) this.getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
	}

	@SuppressWarnings("unchecked")
	@Override
	public T create(T entity) {
		// TODO Auto-generated method stub
		return (T) this.getHibernateTemplate().save(entity);
	}

	@Override
	public T findById(ID id) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(persistentClass, id);
	}

	@Override
	public void delete(ID id) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(findById(id));
	}

	@Override
	public void update(T entity) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(entity);
	}

	@Override
	public List<T> findALl() {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().loadAll(persistentClass);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> findByHQL(String strHQL, Object[] params) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().find(strHQL, params);
	}

	@Override
	public PageBean findByPage(final String strHQL, final Object[] params,
			final int currentPage, final int pageSize) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().execute(
				new HibernateCallback<PageBean>() {
					@Override
					public PageBean doInHibernate(Session session)
							throws HibernateException, SQLException {
						// TODO Auto-generated method stub
						PageBean pageBean = new PageBean();
						Query query = session.createQuery(strHQL);
						for (int i = 0; i < params.length; i++) {
							query.setParameter(i, params[i]);
						}
						query.setFirstResult((currentPage - 1) * pageSize);
						query.setMaxResults(pageSize);
						pageBean.setData(query.list());
						query = session.createQuery("select count(*) "
								+ strHQL.substring(strHQL.toLowerCase()
										.indexOf("from")));
						for (int i = 0; i < params.length; i++) {
							query.setParameter(i, params[i]);
						}
						pageBean.setTotalRows(Integer.parseInt(query
								.uniqueResult().toString()));

						pageBean.setCurrentPage(currentPage);
						pageBean.setPageSize(pageSize);

						return pageBean;
					}
				});
	}

	@Override
	public void bulkUpdate(String strHQL, Object[] params) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().bulkUpdate(strHQL, params);
	}

}
