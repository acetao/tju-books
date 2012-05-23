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

	@Override
	
	
	public String execute()throws Exception{
		//单点登录验证
		ActionContext ac = ActionContext.getContext();
		List<String> online  = (List<String>) ac.getApplication().get("online");
		String username = (String) ac.getSession().get("username");		
		online.remove(username);
		ac.getApplication().put("online",online);
		ac.getSession().remove("username");
		ac.getSession().clear();
		HttpSession ses = ServletActionContext.getRequest().getSession();
		ses.invalidate();
		return "goto";
		
		
	}
}
