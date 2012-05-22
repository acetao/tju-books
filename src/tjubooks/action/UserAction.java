package tjubooks.action;

import tjubooks.biz.IUserBiz;
import tjubooks.po.User;

import com.opensymphony.xwork2.ActionContext;
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
		user = new User();
	}

	@Override
	public User getModel() {
		return user;
	}
	
	//�û�ע��
	public String register(){
		System.out.println(user.getUsername());
		System.out.println(user.getPassword());
		if(userBiz.isUsernameExist(user)){
			System.out.println("�û����Ѵ���");
			return "nameAlreadyExist";
		}
		System.out.println("������û�");
		userBiz.add(user);
		return "registerOk";
	}
	
	//�û���¼
	public String login(){
		if(!userBiz.isPasswdMatched(user)){
			System.out.println("�û����������");
			return "notMatched";
		}
		ActionContext.getContext().getSession().put("user", userBiz.getUserById(userBiz.getUserIdByName(user.getUsername())));
		return "loginOk";
	}
}
