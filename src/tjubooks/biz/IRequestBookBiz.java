package tjubooks.biz;

import tjubooks.po.Requestbook;
import tjubooks.vo.PageBean;

public interface IRequestBookBiz {
    // 发布（添加）书籍信息
	public abstract Integer add(final Requestbook reqbook);
	
	// 删除书籍
	public abstract void del(final Integer reqbookid);
	
	// 查看书籍
	public abstract Requestbook findById(final int id);
	
	public abstract PageBean searchRequestedBookByUserid(int userid,
			final int currentPage, final int pageSize);
	
}
