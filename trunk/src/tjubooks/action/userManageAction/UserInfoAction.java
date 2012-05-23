package tjubooks.action.userManageAction;

import tjubooks.biz.IUserBiz;
import tjubooks.po.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


@SuppressWarnings("serial")
public class UserInfoAction extends ActionSupport {

	private IUserBiz userBiz;	
	private Integer userid;
	
	public void setUserBiz(IUserBiz userBiz) {
		this.userBiz = userBiz;
	}


	public void setUserid(Integer useid) {
		this.userid = useid;
	}
	
	// ����Id����û���Ϣ
	public String execute() throws Exception{
		
		if(null == userid){
			return "emptyid";
		}
		
		User user =  this.userBiz.getUserById(userid);
		
		if(null ==  user){
			return "notFound";
		}
		// ��session����������û�
		ActionContext ac = ActionContext.getContext();
		ac.put("userInfo",user);
		
		return SUCCESS;
	}
	
}
