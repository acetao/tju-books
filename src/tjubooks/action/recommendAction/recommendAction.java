package tjubooks.action.recommendAction;

import tjubooks.biz.IBookBiz;
import tjubooks.po.Book;
import tjubooks.vo.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class recommendAction extends ActionSupport {
	//Spring框架根据使用需要进行依赖注入的bookBiz
	private IBookBiz bookBiz;
	

	public void setBookBiz(IBookBiz bookBiz) {
		this.bookBiz = bookBiz;
	}

	// 该方法在推荐书籍时使用
	public String execute() throws Exception{
		
		PageBean  recommendBooks =  this.bookBiz.recommendBooks();
		PageBean  recommendReqBooks = this.bookBiz.recommendReqBooks();
		
		ActionContext ac = ActionContext.getContext();
		ac.getSession().put("recommendBooks", recommendBooks);
		ac.getSession().put("recommendReqBooks", recommendReqBooks);
		return SUCCESS;
	}
}
