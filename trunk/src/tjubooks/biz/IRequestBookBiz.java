package tjubooks.biz;

import tjubooks.po.Requestbook;

public interface IRequestBookBiz {
    // ��������ӣ��鼮��Ϣ
	public abstract Integer add(final Requestbook reqbook);
	
	// ɾ���鼮
	public abstract void del(final Integer reqbookid);
	
	// �鿴�鼮
	public abstract Requestbook findById(final int id);
	
}
