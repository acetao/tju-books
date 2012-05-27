package tjubooks.biz.impl;

import java.util.List;

import tjubooks.biz.IBookBiz;
import tjubooks.dao.IBookDao;
import tjubooks.dao.ICategoryDao;
import tjubooks.po.Book;
import tjubooks.po.Category;
import tjubooks.vo.PageBean;

public class BookBiz implements IBookBiz {
	
	private ICategoryDao categoryDao;
	private IBookDao bookDao;
	
	
	public void setCategoryDao(ICategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}
	public void setBookDao(IBookDao bookDao) {
		this.bookDao = bookDao;
	}

	@Override
	//根据查询数据的关键字来查询书籍信息并返回PageBean
	//keyWords: 查询时的关键字
	public PageBean searchBook(String keyWords, int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		String strHQL = "select b from Book as b where b.bookname like ? order by b.bookid";
		String likeWords =  "%"+keyWords+"%";
		Object[] params = new Object[]{likeWords}; 
		return this.bookDao.findByPage(strHQL, params, currentPage, pageSize);
	}
	
	@Override
	//分页显示的方法
	public PageBean findByPage(int currentPage, int pageSize) {
		String strHQL = "select b from Book as b order by b.bookid";
		Object[] params = new Object[]{}; 
		return this.bookDao.findByPage(strHQL, params, currentPage, pageSize);
	}

	@Override
	public void add(Book book) {
		this.bookDao.save(book);
	}

	@Override
	//yuan
	public PageBean searchBookByUserid(int userid, int currentPage,
			int pageSize) {
		System.out.println("BookBiz.searchBookByUserid:userid="+userid);
		String strHQL = "select b from Book as b where b.user.userid = ? order by b.bookid";	
		//String likeWords =  "%"+String.valueOf(userid)+"%";
		//System.out.println("BookBiz.searchBookByUserid:likeWords="+likeWords);
		Object[] params = new Integer[]{userid}; 
		return this.bookDao.findByPage(strHQL, params, currentPage, pageSize);
	}

	// 删除书籍
    public void delBook(Integer id){
    	this.bookDao.delete(id);
    }
    
    // 根据Id查看单本书籍
    public Book findById(final Integer id){
    	return this.bookDao.findById(id);
    }
    
    // 更新书籍信息
    public void UpdateBook(final Book book){
    	this.bookDao.update(book);
    }
    
    // 查看该分类下的所有书籍
    public PageBean findByCategory(final int categoryId,int currentPage,int pageSize){
		String strHQL = "select b from Book as b where b.category.categoryid = ?";
		
		Object[] params = new Integer[]{categoryId};
		

		return this.bookDao.findByPage(strHQL, params, currentPage, pageSize);
    }
	@Override
	public PageBean recommendBooks() {
		String strHQL = "select b from Book as b order by b.publishdate desc";
		Object[] params =  new Object[]{};
		
		return this.bookDao.findByPage(strHQL, params, 1, 20);
	}
	@Override
	public PageBean recommendReqBooks() {
		String strHQL = "select b from Requestbook as b order by b.reqDate desc";
		Object[] params =  new Object[]{};
		
		return this.bookDao.findByPage(strHQL, params, 1, 20);
	}
	

	public PageBean searchUnlineBookByUserid(int userid , int currentPage,
				int pageSize) {
			System.out.println("BookBiz.searchBookByUserid:userid="+userid);
			String strHQL = "select b from Book as b where b.user.userid = ? and b.state = '下线' order by b.bookid";	
			//String likeWords =  "%"+String.valueOf(userid)+"%";
			//System.out.println("BookBiz.searchBookByUserid:likeWords="+likeWords);
			Object[] params = new Integer[]{userid};
			return this.bookDao.findByPage(strHQL, params,currentPage, pageSize);
		}
}
