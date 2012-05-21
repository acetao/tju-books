package tjubooks.action.bookAction;

import tjubooks.biz.IBookBiz;
import tjubooks.biz.IImageBiz;
import tjubooks.po.Book;
import tjubooks.po.Bookimage;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class AddBookAction extends ActionSupport implements ModelDriven<Book>,
		Preparable {
	//ModelDriven�Զ�����ݲ�����װ���з�װbook���� 
	private Book book;  
	//Spring��ܸ���ʹ����Ҫ��������ע���bookBiz
	private IBookBiz bookBiz;
	private IImageBiz imageBiz;

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
	
	@Override
	public Book getModel() {
		return book;
	}
	
	//����(��ӣ��鼮
	// �����鼮ǰ��Ҫ��ǰ����
	public String execute() throws Exception{
		
//		Bookimage image = imageBiz.findById(book);
		
		if(null == book){
			return "addError";
		}
		
		this.bookBiz.add(book);
		return SUCCESS;
	}	
}
