package tjubooks.action.userAction;

import java.util.ArrayList;
import java.util.List;

import tjubooks.biz.IUserBiz;
import tjubooks.po.User;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class UserLoginAction extends ActionSupport implements ModelDriven<User>,
Preparable{
	
	private User user;
	private IUserBiz userBiz;
	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		user = new User();
	}

	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setUserBiz(IUserBiz userBiz) {
		this.userBiz = userBiz;
	}

	@SuppressWarnings("unchecked")
	public String execute()throws Exception{
		
		ActionContext ac = ActionContext.getContext();
/*		//单点登录验证
		ActionContext ac = ActionContext.getContext();
		List<String> online  = (List<String>) ac.getApplication().get("online");
		if(online == null){
			online = new ArrayList<String>();
		}
		if(online.contains(user.getUsername())){
			ac.getSession().put("msg", 1);
			return "LoginFail";
		}//数据库验证：
		else{*/
			if(userBiz.isPasswdMatched(user)){
				
				//online.add(user.getUsername());
				//ac.getApplication().put("online", online);
				ac.getSession().put("user", userBiz.getUserById(userBiz.getUserIdByName(user.getUsername())));
				ac.getSession().put("username", user.getUsername());
				return "loginOk";
			}else{
				ac.getSession().put("msg", 2);
				return "LoginFail";
			}
	}
}
