package tjubooks.action.userCenterAction;

import java.util.ArrayList;
import java.util.List;

import tjubooks.biz.IUserBiz;
import tjubooks.po.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserPasswordAction extends ActionSupport{

	private String password;
	private String newpassword;
	

	private IUserBiz userBiz;
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}
	
	public void setUserBiz(IUserBiz userBiz) {
		this.userBiz = userBiz;
	}
	
	public String execute(){
		ActionContext ac = ActionContext.getContext();		
		User user = (User)ac.getSession().get("user");
		if(password.equals(user.getPassword())){
		  user.setPassword(newpassword);
		  userBiz.updateUser(user);		
		  ac.getSession().put("user", user);
		  return "changesuccess";
		}
		else{
			ac.getSession().put("changefail", 0);
			return "changefail";
		}
	}
	
}
