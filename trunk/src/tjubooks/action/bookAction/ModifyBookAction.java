package tjubooks.action.bookAction;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Blob;

import org.hibernate.Hibernate;

import tjubooks.biz.IBookBiz;
import tjubooks.biz.ICategoryBiz;
import tjubooks.biz.IImageBiz;
import tjubooks.po.Book;
import tjubooks.po.Bookimage;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class ModifyBookAction extends ActionSupport implements ModelDriven<Book>,
		Preparable {
	//ModelDriven�Զ�����ݲ�����װ���з�װbook���� 
	private Book book;  
	//Spring��ܸ���ʹ����Ҫ��������ע���bookBiz
	private IBookBiz bookBiz;
	private IImageBiz imageBiz;
	private ICategoryBiz categoryBiz;
	
	private File image; // ���ύ�ı��е�file����е�name����һ��
	private String imageFileName; // ���ϴ����ļ����ƣ��̶���ʽxxxFileName��xxx��file����е�name����һ�£�
	
	private int categoryid;  //�鼮�ķ���
	
	public void setImage(File image) {
		this.image = image;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}

	public void setBook(Book book) {
		this.book = book;
	}
	
	public void setImageBiz(IImageBiz imageBiz) {
		this.imageBiz = imageBiz;
	}
	
	public void setBookBiz(IBookBiz bookBiz) {
		this.bookBiz = bookBiz;
	}

	public void setCategoryBiz(ICategoryBiz categoryBiz) {
		this.categoryBiz = categoryBiz;
	}

	@Override
	public void prepare() throws Exception {
		book = new Book();
	}
	
	@Override
	public Book getModel() {
		return book;
	}
	
	// �޸��鼮��Ϣ
	// �����鼮ǰ��Ҫ��ǰ����image,category,user.
	public String execute() throws Exception{
		Book oldBook = bookBiz.findById(book.getBookid());
		
		int imageId =  updateImage();
		book.setBookimage(imageBiz.findById(imageId));
		
		// ���÷���ʱ��Ϊԭ���ķ���ʱ��
		book.setPublishdate(oldBook.getPublishdate());
		// ���÷����ߵ���ϢΪ��ǰ�ķ�������Ϣ
		book.setUser(oldBook.getUser());
				
		// ���·�����Ϣ
		book.setCategory(categoryBiz.findById(categoryid));

		this.bookBiz.add(book);
		return SUCCESS;
	}
	
	
	// ����ͼƬ��Ϣ���������Ĭ��ͼƬ��imageid==1)�����½�ͼƬ���������Ĭ�ϣ������ͼƬ��Ϣ,
	// ����ֵΪ���º��ͼƬ��Id
	private Integer updateImage(){
		Book oldBook = bookBiz.findById(book.getBookid());
		Bookimage oldBookImage = oldBook.getBookimage();
		
		
		try {
			// û���ϴ�ͼƬ��������Ϊԭ����ֵ
			if(null == image){
				System.out.println("image is null");
				return oldBookImage.getImageId();
			}
			else {			
				
				InputStream in = new FileInputStream(image);
				Blob blob = Hibernate.createBlob(in);
				
				Integer imageid = null;
				    
				if(oldBookImage.getImageId() == 1){
					// �������Ĭ��ͼƬ��������µ�ͼƬ
					Bookimage bookImage =  new Bookimage();
					bookImage.setImage(blob);				
					imageid = imageBiz.addImage(bookImage);
				}else{
					// ����ͼƬ��Ϣ
					imageid = oldBookImage.getImageId();
					oldBookImage.setImage(blob);
					imageBiz.updateImage(oldBookImage);
				}
					
				in.close();				
				return imageid;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}
	}
}
