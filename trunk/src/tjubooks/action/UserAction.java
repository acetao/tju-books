package tjubooks.action;

import tjubooks.biz.IUserBiz;
import tjubooks.po.User;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class UserAction extends ActionSupport implements ModelDriven<User>,
		Preparable {
    
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
		// TODO Auto-generated method stub
		user = new User();
	}

	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return null;
	}

}
