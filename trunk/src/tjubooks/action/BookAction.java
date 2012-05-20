package tjubooks.action;

import tjubooks.biz.IBookBiz;
import tjubooks.po.Book;
import tjubooks.po.Bookimage;
import tjubooks.po.Category;
import tjubooks.po.User;
import tjubooks.vo.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class BookAction extends ActionSupport implements ModelDriven<Book>,
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
	
	//搜索书籍时的关键字，当调用search方法时才有效
    private String keyWords =""; 
    
    // 分类浏览的分类
    private int category;
    
    
    // 更新时操作的信息
    //private int imageId;
    private int  CategoryId;
//	private Bookimage bookimage;
//	private Category category;
//	private User user;
    
	public void setCategory(int category) {
		this.category = category;
	}

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
		return book;
	}
	
	//发布(添加）书籍      /book!add
	public String add() throws Exception{
		this.bookBiz.add(book);
		return SUCCESS;
	}
    
	// 该方法在分类浏览时使用
	public String browseByCategory() throws Exception{
		PageBean  pageBean =  this.bookBiz.findByPage(currentPage,PAGESIZE);
		ActionContext ac = ActionContext.getContext();
		ac.put("pageBean", pageBean);
		return SUCCESS;
		// return "bird"
	}
	
	// 根据关键字搜索书籍
	public String search() throws Exception{
		PageBean  pageBean =  this.bookBiz.searchBook(keyWords,currentPage,PAGESIZE);
		
		ActionContext ac = ActionContext.getContext();
		//将PageBean 放入Session中
		ac.getSession().put("pageBean", pageBean);
		
		//将keyWords 放入request,以便页面获取相应的keyWords点击其他分页时使用
		ac.put("keyWords", keyWords);
		return "searchSuccess";
	}
	
	// 查找具体某本书籍并显示
	public String findById() throws Exception{
		Book myBook = this.bookBiz.findById(book.getBookid());
		ActionContext.getContext().getSession().put("bookDetail", book);
		return "findIdOk";
	}
}
