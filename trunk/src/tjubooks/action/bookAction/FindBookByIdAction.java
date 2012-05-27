package tjubooks.action.bookAction;

import tjubooks.biz.IBookBiz;
import tjubooks.po.Book;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FindBookByIdAction extends ActionSupport {
	private Integer bookid ;
    private IBookBiz bookBiz;
    
    public void setBookid(Integer bookid) {
		this.bookid = bookid;
	}
	public void setBookBiz(IBookBiz bookBiz) {
		this.bookBiz = bookBiz;
	}
	
	// 查找具体某本书籍并显示
	public String execute() throws Exception{
		
		Book myBook = this.bookBiz.findById(bookid);
		if(null != myBook){
			ActionContext.getContext().put("bookDetail", myBook);			
		}
		else{
			return "notFound";
		}
//		System.out.print("Find Book id is: ");
//		System.out.println(myBook.getBookid());
		return "success";
	}
}
