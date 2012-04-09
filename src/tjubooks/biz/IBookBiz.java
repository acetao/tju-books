package tjubooks.biz;

import tjubooks.po.Book;
import tjubooks.vo.PageBean;

public interface IBookBiz {
	//���ݲ�ѯ���ݵĹؼ�������ѯ�鼮��Ϣ������PageBean
	public abstract PageBean searchBook(String keyWords,
			final int currentPage, final int pageSize);
    // 
	public abstract PageBean findByPage(final int currentPage,
			final int PageSize);
    
    //��������ӣ��鼮��Ϣ
	public abstract void add(final Book book);

}
