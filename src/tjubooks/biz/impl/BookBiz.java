package tjubooks.biz.impl;

import java.util.List;

import tjubooks.biz.IBookBiz;
import tjubooks.dao.IBookDao;
import tjubooks.po.Book;
import tjubooks.vo.PageBean;

public class BookBiz implements IBookBiz {
	private IBookDao bookDao;

	public void setBookDao(IBookDao bookDao) {
		this.bookDao = bookDao;
	}

	@Override
	//���ݲ�ѯ���ݵĹؼ�������ѯ�鼮��Ϣ������PageBean
	//keyWords: ��ѯʱ�Ĺؼ���
	public PageBean searchBook(String keyWords, int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		String strHQL = "select b from Book as b where b.bookname like ? order by b.bookid";
		String likeWords =  "%"+keyWords+"%";
		Object[] params = new Object[]{likeWords}; 
		return this.bookDao.findByPage(strHQL, params, currentPage, pageSize);
	}
	
	@Override
	//��ҳ��ʾ�ķ���
	public PageBean findByPage(int currentPage, int pageSize) {
		String strHQL = "select b from Book as b order by b.bookid";
		Object[] params = new Object[]{}; 
		return this.bookDao.findByPage(strHQL, params, currentPage, pageSize);
	}

	@Override
	public void add(Book book) {
		this.bookDao.create(book);
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


}
