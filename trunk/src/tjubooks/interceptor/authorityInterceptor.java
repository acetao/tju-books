package tjubooks.interceptor;

import tjubooks.po.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class authorityInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		ActionContext ac = ActionContext.getContext();
		User user = (User) ac.getSession().get("user");
		
		if(null == user){
			return "login";
		}
		else{
			return invocation.invoke();
		}
	}
}
