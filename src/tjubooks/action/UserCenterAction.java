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
	
	//每页显示的结果数
	private final int PAGESIZE =  1;
	
	//分页查看时有效，当传入的参数中含该字段时自动被封装，默认值为1,
	//该字段在分类浏览和按关键字搜索时被使用
	private int currentPage = 1;
	
	public void setBookBiz(IBookBiz bookBiz) {
		this.bookBiz = bookBiz;
	}
	
	// 获得已发布书籍
	public String searchReleasedBooks() throws Exception{
		User u = (User)(ActionContext.getContext().getSession().get("user"));
		System.out.println("UserCenterAction.searchReleasedBooks:"+u.getUserid());
		PageBean  pageBean =  this.bookBiz.searchBookByUserid(u.getUserid(),currentPage,PAGESIZE);
		
		ActionContext ac = ActionContext.getContext();
		ac.put("pageBean", pageBean);
		return "releasedBooks";
	}
	
	//关注的书籍
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
		
		//或去掉userInfo.jsp的hidden，使用下句
		//user.setUserid(((User)ActionContext.getContext().getSession().get("user")).getUserid());
		
		//更新
		userBiz.updateUser(user);
		
		//覆盖session
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
