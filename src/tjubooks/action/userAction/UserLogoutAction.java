package tjubooks.action.userAction;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import tjubooks.biz.IUserBiz;
import tjubooks.po.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class UserLogoutAction extends ActionSupport  {

	public String execute()throws Exception{
		ActionContext ac = ActionContext.getContext();
		String username = (String) ac.getSession().get("username");		
		ac.getSession().remove("username");
		ac.getSession().clear();
		HttpSession ses = ServletActionContext.getRequest().getSession();
		ses.invalidate();
		return "goto";
	}
}
