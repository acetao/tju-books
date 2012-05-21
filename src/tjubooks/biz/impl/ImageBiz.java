package tjubooks.biz.impl;

import tjubooks.biz.IImageBiz;
import tjubooks.dao.IBookimageDao;
import tjubooks.po.Bookimage;

public class ImageBiz implements IImageBiz {
    IBookimageDao bookImageDao;

	public void setBookImageDao(IBookimageDao bookImageDao) {
		this.bookImageDao = bookImageDao;
	}

	@Override
	public Bookimage findById(int imageId) {
		return this.bookImageDao.findById(imageId);
	}

	@Override
	public int addImage(Bookimage bookImage) {
		return this.bookImageDao.save(bookImage);
	}

	@Override
	public void delImage(int imageId) {
		this.bookImageDao.delete(imageId);
	}

	@Override
	public void updateImage(Bookimage bookImage) {
		this.bookImageDao.update(bookImage);
	}
    
}
