package tjubooks.action.bookAction;

import java.util.ArrayList;
import java.util.List;

import tjubooks.biz.IUserBiz;
import tjubooks.po.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PublishBookAction extends ActionSupport{
	
	public String execute(){
		return "success";
	}
	
}
