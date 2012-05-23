package tjubooks.action.userAction;

import java.util.ArrayList;
import java.util.List;

import tjubooks.biz.IUserBiz;
import tjubooks.po.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class UserRegisterAction extends ActionSupport implements
		ModelDriven<User>, Preparable {

	private User user;
	private IUserBiz userBiz;

	
	
	public void setUser(User user) {
		this.user = user;
	}

	public void setUserBiz(IUserBiz userBiz) {
		this.userBiz = userBiz;
	}

	@Override
	public void prepare() throws Exception {
		user = new User();
	}

	@Override
	public User getModel() {
		return user;
	}
	
	
	//ÓÃ»§×¢²á
	public String execute()throws Exception{
		ActionContext ac = ActionContext.getContext();
		List<String> online  = (List<String>) ac.getApplication().get("online");
		if(online == null){
			online = new ArrayList<String>();
		}
		if(userBiz.isUsernameExist(user)){
			ac.getSession().put("registermsg", 1);
			return "registerFail";
		}
		userBiz.add(user);
		online.add(user.getUsername());
		ac.getApplication().put("online", online);
		ac.getSession().put("user", userBiz.getUserById(userBiz.getUserIdByName(user.getUsername())));
		ac.getSession().put("username", user.getUsername());
		ac.getSession().remove("registermsg");
		return "registerOk";
	}
	
	

}
