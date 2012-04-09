package tjubooks.biz;

import tjubooks.po.Bookimage;

// 用于处理Image信息的biz
public interface IImageBiz {
	//根据id查找image
    public abstract Bookimage findById(final int imageId);
    //添加图片信息
    public abstract int addImage(final Bookimage bookImage);
    //删除图片信息
    public abstract void delImage(final int imageId);
    //更新图片信息
    public abstract void updateImage(final Bookimage bookImage);
}
