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
	//ModelDriven自动会根据参数封装进行封装book对象 
	private Book book;  
	//Spring框架根据使用需要进行依赖注入的bookBiz
	private IBookBiz bookBiz;
	
	//每页显示的结果数
	private final int PAGESIZE =  8;
	
	//分页查看时有效，当传入的参数中含该字段时自动被封装，默认值为1,
	//该字段在分类浏览和按关键字搜索时被使用
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
	
	//发布(添加）书籍      /book!add
	public String add() throws Exception{
		this.bookBiz.add(book);
		return SUCCESS;
	}
    
	// 该方法在分类浏览时使用
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
