package tjubooks.biz.impl;

import tjubooks.biz.IRequestBookBiz;
import tjubooks.dao.IRequestbookDao;
import tjubooks.po.Requestbook;

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

}
