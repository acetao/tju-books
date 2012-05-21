package tjubooks.action.bookAction;

import tjubooks.biz.IBookBiz;
import tjubooks.vo.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class SearchBookAction extends ActionSupport {
	//Spring��ܸ���ʹ����Ҫ��������ע���bookBiz
	private IBookBiz bookBiz;
	
	//ÿҳ��ʾ�Ľ����
	private final int PAGESIZE =  4;
	
	//��ҳ�鿴ʱ��Ч��������Ĳ����к����ֶ�ʱ�Զ�����װ��Ĭ��ֵΪ1,
	private int currentPage = 1;
	
	//�����鼮ʱ�Ĺؼ��֣�������search����ʱ����Ч
    private String keyWords =""; 

	public void setBookBiz(IBookBiz bookBiz) {
		this.bookBiz = bookBiz;
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
    	
	// ���ݹؼ��������鼮
	public String execute() throws Exception{
		PageBean  pageBean =  this.bookBiz.searchBook(keyWords,currentPage,PAGESIZE);
		
		System.out.println(pageBean.getTotalPages());
		
		ActionContext ac = ActionContext.getContext();
		//��PageBean ����Session��
		ac.getSession().put("pageBean", pageBean);
		
		//��keyWords ����request,�Ա�ҳ���ȡ��Ӧ��keyWords���������ҳʱʹ��
		ac.put("keyWords", keyWords);
		return "success";
	}
}
