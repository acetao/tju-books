package tjubooks.biz.impl;

import tjubooks.biz.IRequestBookBiz;
import tjubooks.dao.IRequestbookDao;
import tjubooks.po.Requestbook;
import tjubooks.vo.PageBean;

public class RequestBookBiz implements IRequestBookBiz {

	IRequestbookDao requestBookDao;

	public void setRequestBookDao(IRequestbookDao requestBookDao) {
		this.requestBookDao = requestBookDao;
	}


	@Override
	public Integer add(Requestbook reqbook) {
		return this.requestBookDao.save(reqbook);
	}

	@Override
	public void del(final Integer reqbookid) {
		this.requestBookDao.delete(reqbookid);
	}

	@Override
	public Requestbook findById(final int id) {
		return this.requestBookDao.findById(id);
	}

	public PageBean searchRequestedBookByUserid(int userid, int currentPage,
			int pageSize) {
		System.out.println("BookBiz.searchRequestedBookByUserid:userid="+userid);
		String strHQL = "select b from Requestbook as b where b.user.userid = ? order by b.requestId";	
		//String likeWords =  "%"+String.valueOf(userid)+"%";
		//System.out.println("BookBiz.searchBookByUserid:likeWords="+likeWords);
		Object[] params = new Integer[]{userid}; 
		return this.requestBookDao.findByPage(strHQL, params, currentPage, pageSize);
	}
}
