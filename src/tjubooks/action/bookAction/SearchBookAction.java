package tjubooks.action.bookAction;

import tjubooks.biz.IBookBiz;
import tjubooks.vo.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class SearchBookAction extends ActionSupport {
	//Spring框架根据使用需要进行依赖注入的bookBiz
	private IBookBiz bookBiz;
	
	//每页显示的结果数
	private final int PAGESIZE =  4;
	
	//分页查看时有效，当传入的参数中含该字段时自动被封装，默认值为1,
	private int currentPage = 1;
	
	//搜索书籍时的关键字，当调用search方法时才有效
    private String keyWords =""; 

	public void setBookBiz(IBookBiz bookBiz) {
		this.bookBiz = bookBiz;
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
    	
	// 根据关键字搜索书籍
	public String execute() throws Exception{
		PageBean  pageBean =  this.bookBiz.searchBook(keyWords,currentPage,PAGESIZE);
		
		System.out.println(pageBean.getTotalPages());
		
		ActionContext ac = ActionContext.getContext();
		//将PageBean 放入Session中
		ac.getSession().put("pageBean", pageBean);
		
		//将keyWords 放入request,以便页面获取相应的keyWords点击其他分页时使用
		ac.put("keyWords", keyWords);
		return "success";
	}
}
