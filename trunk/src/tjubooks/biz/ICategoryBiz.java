package tjubooks.biz;

import tjubooks.po.Category;

public interface ICategoryBiz {
	// 根据Id获取分类
	public abstract Category findById(final Integer categoryid);
	
	// 查找某个分类下所有的子分类
	
	// 查找某个分类的父分类
}
