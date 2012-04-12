package tjubooks.action;

import tjubooks.biz.IBookBiz;
import tjubooks.po.Book;
import tjubooks.vo.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class BookAction extends ActionSupport implements ModelDriven<Book>,
		Preparable {
	//ModelDriven�Զ�����ݲ�����װ���з�װbook���� 
	private Book book;  
	//Spring��ܸ���ʹ����Ҫ��������ע���bookBiz
	private IBookBiz bookBiz;
	
	//ÿҳ��ʾ�Ľ����
	private final int PAGESIZE =  12;
	
	//��ҳ�鿴ʱ��Ч��������Ĳ����к����ֶ�ʱ�Զ�����װ��Ĭ��ֵΪ1,
	//���ֶ��ڷ�������Ͱ��ؼ�������ʱ��ʹ��
	private int currentPage = 1;
	
	//�����鼮ʱ�Ĺؼ��֣�������search����ʱ����Ч
    private String keyWords =""; 
    
    //
    
	public void setBook(Book book) {
		this.book = book;
	}

	public void setBookBiz(IBookBiz bookBiz) {
		this.bookBiz = bookBiz;
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}

	@Override
	public void prepare() throws Exception {
		book = new Book();
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	@Override
	public Book getModel() {
		// TODO Auto-generated method stub
		return book;
	}
	
	//����(��ӣ��鼮
	public String add() throws Exception{
		this.bookBiz.add(book);
		return SUCCESS;
	}
    
	// �÷����ڷ������ʱʹ��
	public String browseByCategory() throws Exception{
		PageBean  pageBean =  this.bookBiz.findByPage(currentPage,PAGESIZE);
		ActionContext ac = ActionContext.getContext();
		ac.put("pageBean", pageBean);
		return SUCCESS;
	}
	
	// ���ݹؼ��������鼮
	public String search() throws Exception{
		PageBean  pageBean =  this.bookBiz.searchBook(keyWords,currentPage,PAGESIZE);
		
		ActionContext ac = ActionContext.getContext();
		//��PageBean ����Session��
		ac.getSession().put("pageBean", pageBean);
		
		//��keyWords ����request,�Ա�ҳ���ȡ��Ӧ��keyWords���������ҳʱʹ��
		ac.put("keyWords", keyWords);
		return "searchSuccess";
	}
	
	public String findById() throws Exception{
		
		return "findIdOk";
	}
}
