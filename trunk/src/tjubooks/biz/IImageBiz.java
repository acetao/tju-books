package tjubooks.biz;

import tjubooks.po.Bookimage;

// ���ڴ���Image��Ϣ��biz
public interface IImageBiz {
	//����id����image
    public abstract Bookimage findById(final int imageId);
    //���ͼƬ��Ϣ
    public abstract int addImage(final Bookimage bookImage);
    //ɾ��ͼƬ��Ϣ
    public abstract void delImage(final int imageId);
    //����ͼƬ��Ϣ
    public abstract void updateImage(final Bookimage bookImage);
}
