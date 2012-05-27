package tjubooks.action.userCenterAction;


import tjubooks.biz.IRequestBookBiz;
import tjubooks.po.User;
import tjubooks.vo.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserRequestedBookAction extends ActionSupport {

	    private IRequestBookBiz requestBookBiz;
		
		//每页显示的结果数
		private final int PAGESIZE =  4;
		
		//分页查看时有效，当传入的参数中含该字段时自动被封装，默认值为1
		private int currentPage = 1;
		


		public void setRequestBookBiz(IRequestBookBiz requestBookBiz) {
			this.requestBookBiz = requestBookBiz;
		}

		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}
		
		public String execute(){
			ActionContext ac = ActionContext.getContext();
			User user = (User) ac.getSession().get("user");
			int id = user.getUserid();
			PageBean  pageBean =  this.requestBookBiz.searchRequestedBookByUserid(id,currentPage,PAGESIZE);		
			
			System.out.println(pageBean.getTotalPages());				
			//将PageBean 放入Session中
			//ac.getSession().put("pageBean", pageBean);
			ac.put("pageBean", pageBean);			
			return "searchsuccess";
		}
}
