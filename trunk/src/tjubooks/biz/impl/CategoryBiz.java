package tjubooks.biz.impl;

import tjubooks.biz.ICategoryBiz;
import tjubooks.dao.ICategoryDao;
import tjubooks.po.Category;

public class CategoryBiz implements ICategoryBiz {


	private ICategoryDao categoryDao;
	
	public void setCategoryDao(ICategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}
	
	
	@Override
	public Category findById(Integer categoryid) {		
		return categoryDao.findById(categoryid);
	}

}
