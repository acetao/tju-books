package tjubooks.biz;

import tjubooks.po.Requestbook;

public interface IRequestBookBiz {
    // ��������ӣ��鼮��Ϣ
	public abstract void add(final Requestbook reqbook);
	
	// ɾ���鼮
	public abstract void del(final Requestbook reqbook);
	
	// �鿴�鼮
	public abstract void findById(final int Id);
	
}
