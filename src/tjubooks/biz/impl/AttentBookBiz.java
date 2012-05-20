package tjubooks.biz.impl;

import tjubooks.biz.IAttentBookBiz;
import tjubooks.dao.IAttentbookDao;
import tjubooks.vo.PageBean;

public class AttentBookBiz implements IAttentBookBiz {
	private IAttentbookDao attentBookDao;


	public void setAttentBookDao(IAttentbookDao attentBookDao) {
		this.attentBookDao = attentBookDao;
	}


	@Override
	public PageBean searchAttentBook(int userid, int currentPage, int pageSize) {
		System.out.println("BookBiz.searchBookByUserid:userid="+userid);
		String strHQL = "select b from Book as b where b.user.userid = ? order by b.bookid";	
		Object[] params = new Integer[]{userid}; 
		return this.attentBookDao.findByPage(strHQL, params, currentPage, pageSize);
	}
}
