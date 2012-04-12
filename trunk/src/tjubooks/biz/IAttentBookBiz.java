package tjubooks.biz;

import tjubooks.vo.PageBean;

public interface IAttentBookBiz {
	//yuan
	public abstract PageBean searchAttentBook(int userid,
			final int currentPage, final int pageSize);
}
