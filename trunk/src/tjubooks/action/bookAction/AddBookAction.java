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
	//ModelDriven自动会根据参数封装进行封装book对象 
	private Book book;  
	//Spring框架根据使用需要进行依赖注入的bookBiz
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
	
	//发布(添加）书籍
	// 发布书籍前需要提前构造
	public String execute() throws Exception{
		
//		Bookimage image = imageBiz.findById(book);
		
		if(null == book){
			return "addError";
		}
		
		this.bookBiz.add(book);
		return SUCCESS;
	}	
}
