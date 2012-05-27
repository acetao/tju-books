package tjubooks.action.userCenterAction;

import java.util.Calendar;

import sun.util.calendar.BaseCalendar.Date;
import tjubooks.biz.IBookBiz;
import tjubooks.po.Book;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserUnlineBookAction extends ActionSupport {
     
    private IBookBiz bookBiz;
    private int bookid;
    
	


	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public void setBookBiz(IBookBiz bookBiz) {
		this.bookBiz = bookBiz;
	}
	
	public String execute(){
		Book book = bookBiz.findById(bookid);
		book.setUnlinedate(new java.sql.Date(System.currentTimeMillis()));
		book.setState("ÏÂÏß");
		bookBiz.UpdateBook(book);
		return "unlinesuccess";
	}
}
