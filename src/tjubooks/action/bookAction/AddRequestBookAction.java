package tjubooks.action.bookAction;

import java.util.Date;

import tjubooks.biz.IRequestBookBiz;
import tjubooks.po.Requestbook;
import tjubooks.po.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class AddRequestBookAction extends ActionSupport implements
		ModelDriven<Requestbook>, Preparable {
	
	IRequestBookBiz requestBookBiz;
	Requestbook requestBook;


	public void setRequestBookBiz(IRequestBookBiz requestBookBiz) {
		this.requestBookBiz = requestBookBiz;
	}

	public void setRequestBook(Requestbook requestBook) {
		this.requestBook = requestBook;
	}
	
	@Override
	public void prepare() throws Exception {
		requestBook =  new Requestbook();
	}

	@Override
	public Requestbook getModel() {
		return requestBook;
	}

	
	public String execute(){
		
		// 设置用户
		ActionContext ac = ActionContext.getContext();
		User currentUser =  (User)ac.getSession().get("user");
		
		requestBook.setUser(currentUser);
		
		// 设置时间
		requestBook.setReqDate(new Date());
		
		requestBookBiz.add(requestBook);
		return SUCCESS;
	}
}
