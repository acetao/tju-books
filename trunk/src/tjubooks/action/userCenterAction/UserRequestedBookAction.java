package tjubooks.action.userCenterAction;


import tjubooks.biz.IRequestBookBiz;
import tjubooks.po.User;
import tjubooks.vo.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserRequestedBookAction extends ActionSupport {

	    private IRequestBookBiz requestBookBiz;
		
		//ÿҳ��ʾ�Ľ����
		private final int PAGESIZE =  4;
		
		//��ҳ�鿴ʱ��Ч��������Ĳ����к����ֶ�ʱ�Զ�����װ��Ĭ��ֵΪ1
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
			//��PageBean ����Session��
			//ac.getSession().put("pageBean", pageBean);
			ac.put("pageBean", pageBean);			
			return "searchsuccess";
		}
}
