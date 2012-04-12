package tjubooks.action;

import tjubooks.biz.IBookBiz;
import tjubooks.biz.IUserBiz;
import tjubooks.po.User;
import tjubooks.vo.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class UserCenterAction extends ActionSupport implements ModelDriven<User>,
		Preparable {
    
	private User user;
	private IUserBiz userBiz;
	
	private IBookBiz bookBiz;
	
	//ÿҳ��ʾ�Ľ����
	private final int PAGESIZE =  1;
	
	//��ҳ�鿴ʱ��Ч��������Ĳ����к����ֶ�ʱ�Զ�����װ��Ĭ��ֵΪ1,
	//���ֶ��ڷ�������Ͱ��ؼ�������ʱ��ʹ��
	private int currentPage = 1;
	
	public void setBookBiz(IBookBiz bookBiz) {
		this.bookBiz = bookBiz;
	}
	
	// ����ѷ����鼮
	public String searchReleasedBooks() throws Exception{
		User u = (User)(ActionContext.getContext().getSession().get("user"));
		System.out.println("UserCenterAction.searchReleasedBooks:"+u.getUserid());
		PageBean  pageBean =  this.bookBiz.searchBookByUserid(u.getUserid(),currentPage,PAGESIZE);
		
		ActionContext ac = ActionContext.getContext();
		ac.put("pageBean", pageBean);
		return "releasedBooks";
	}
	
	//��ע���鼮
	public String searchAttentionBooks() throws Exception{
		User u = (User)(ActionContext.getContext().getSession().get("user"));
		System.out.println("UserCenterAction.searchAttentionBooks:"+u.getUserid());
		PageBean  pageBean =  this.bookBiz.searchBookByUserid(u.getUserid(),currentPage,PAGESIZE);
		
		ActionContext ac = ActionContext.getContext();
		ac.put("pageBean", pageBean);
		return "releasedBooks";
	}
	
	public String userInfo(){
		return "userInfo";
	}
	
	public String releasedBooks(){
		return "releasedBooks";
	}
	
	public String updateUserInfo(){
		System.out.println("UserCenterAction.updateUserInfo:userid="+user.getUserid());
		System.out.println("UserCenterAction.updateUserInfo:username="+user.getUsername());
		
		//��ȥ��userInfo.jsp��hidden��ʹ���¾�
		//user.setUserid(((User)ActionContext.getContext().getSession().get("user")).getUserid());
		
		//����
		userBiz.updateUser(user);
		
		//����session
		ActionContext.getContext().getSession().put("user", user);
		return "updateOk";
	}
	
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
		return user;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
}
