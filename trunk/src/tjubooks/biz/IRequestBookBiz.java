package tjubooks.biz;

import tjubooks.po.Requestbook;

public interface IRequestBookBiz {
    // 发布（添加）书籍信息
	public abstract void add(final Requestbook reqbook);
	
	// 删除书籍
	public abstract void del(final Requestbook reqbook);
	
	// 查看书籍
	public abstract void findById(final int Id);
	
}
