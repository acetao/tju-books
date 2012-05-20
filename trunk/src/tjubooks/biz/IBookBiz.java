package tjubooks.biz;

import tjubooks.po.Book;
import tjubooks.vo.PageBean;

public interface IBookBiz {
	//根据查询数据的关键字来查询书籍信息并返回PageBean
	public abstract PageBean searchBook(String keyWords,
			final int currentPage, final int pageSize);
    // 
	public abstract PageBean findByPage(final int currentPage,
			final int PageSize);
    
    //发布（添加）书籍信息
	public abstract void add(final Book book);
	
	// 查看单本书籍
	public abstract Book findById(final Integer Id);
	
	//yuan
	public abstract PageBean searchBookByUserid(int userid,
			final int currentPage, final int pageSize);
    
	public abstract void UpdateBook(final Book book);
	
	public abstract PageBean findByCategory(final int categoryId,int currentPage,int pageSize);
}
