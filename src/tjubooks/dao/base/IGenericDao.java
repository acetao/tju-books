package tjubooks.dao.base;

import java.io.Serializable;
import java.util.List;

import tjubooks.vo.PageBean;

// DAOͨ�ýӿ�
public interface IGenericDao<T extends Serializable, ID extends Serializable> {

	// DAO���ݷ��ʲ��е�ͨ�÷�������

	public abstract ID create(T entity);

	public abstract T findById(ID id);

	public abstract void delete(ID id);

	public abstract void update(T entity);

	public abstract List<T> findALl();

	public abstract List<T> findByHQL(final String strHQL, final Object[] params);

	public abstract PageBean findByPage(final String strHQL,
			final Object[] params, final int currentPage, final int pageSize);
	
	public abstract void bulkUpdate(final String strHQL, final Object[] params);
}
