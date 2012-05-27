package tjubooks.action.userCenterAction;

import java.util.ArrayList;
import java.util.List;

import tjubooks.biz.IUserBiz;
import tjubooks.po.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class ModifyUserInfoAction extends ActionSupport  {
	
	private String email ;
	private String qq ;
	private String cellphone;
	
	
	private IUserBiz userBiz;

	public void setEmail(String email) {
		this.email = email;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public void setUserBiz(IUserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public String execute()throws Exception{
		ActionContext ac = ActionContext.getContext();
		User user = (User)ac.getSession().get("user");
		user.setEmail(email);
		user.setQq(qq);
		user.setCellphone(cellphone);
		userBiz.updateUser(user);
		
		String usernamePre = (String) ac.getSession().get("username");		
		ac.getSession().put("user", user);
		return "success";	
	}
	
}
