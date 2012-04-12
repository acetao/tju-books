package tjubooks.biz;

import tjubooks.po.User;

public interface IUserBiz {
	public abstract void add(final User user);
	
	public abstract boolean isUsernameExist(final User user);
	
	public abstract boolean isPasswdMatched(final User user);
	
	public abstract User getUserById(final int id);
	
	public abstract int getUserIdByName(final String username);
	
	public abstract void updateUser(final User user);
}
