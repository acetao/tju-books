package tjubooks.action.bookAction;

import tjubooks.biz.IBookBiz;
import tjubooks.po.Book;
import tjubooks.vo.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class BookOfCategoryAction extends ActionSupport implements ModelDriven<Book>,
		Preparable {
	//ModelDriven�Զ�����ݲ�����װ���з�װbook���� 
	private Book book;  
	//Spring��ܸ���ʹ����Ҫ��������ע���bookBiz
	private IBookBiz bookBiz;
	
	//ÿҳ��ʾ�Ľ����
	private final int PAGESIZE =  8;
	
	//��ҳ�鿴ʱ��Ч��������Ĳ����к����ֶ�ʱ�Զ�����װ��Ĭ��ֵΪ1,
	//���ֶ��ڷ�������Ͱ��ؼ�������ʱ��ʹ��
	private int currentPage = 1;   
    
	private int  categoryid;

    public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public void setBookBiz(IBookBiz bookBiz) {
		this.bookBiz = bookBiz;
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
		return book;
	}
	
	//����(��ӣ��鼮      /book!add
	public String add() throws Exception{
		this.bookBiz.add(book);
		return SUCCESS;
	}
    
	// �÷����ڷ������ʱʹ��
	public String execute() throws Exception{
//		System.out.print("categoryid is :");
//		System.out.println(categoryid);
		
		PageBean  pageBean =  this.bookBiz.findByCategory(categoryid,currentPage,PAGESIZE);
		
		ActionContext ac = ActionContext.getContext();
		ac.put("pageBean", pageBean);
		ac.put("categoryid", categoryid);
		return SUCCESS;
		// return "bird"
	}
}
