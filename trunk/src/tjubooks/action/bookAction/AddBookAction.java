package tjubooks.action.bookAction;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.util.Date;

import org.hibernate.Hibernate;

import tjubooks.biz.IBookBiz;
import tjubooks.biz.ICategoryBiz;
import tjubooks.biz.IImageBiz;
import tjubooks.po.Book;
import tjubooks.po.Bookimage;
import tjubooks.po.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class AddBookAction extends ActionSupport implements ModelDriven<Book>,
		Preparable {
	//ModelDriven�Զ�����ݲ�����װ���з�װbook���� 
	private Book book;  
	//Spring��ܸ���ʹ����Ҫ��������ע���bookBiz
	private IBookBiz bookBiz;
	private IImageBiz imageBiz;
	private ICategoryBiz categoryBiz;
	
	
	private File image; // ���ύ�ı��е�file����е�name����һ��
	private String imageFileName; //���ϴ����ļ����ƣ��̶���ʽxxxFileName��xxx��file����е�name����һ�£�
	
	private int categoryid;  //�鼮�ķ���
	
	public void setCategoryBiz(ICategoryBiz categoryBiz) {
		this.categoryBiz = categoryBiz;
	}
	
	public void setBookBiz(IBookBiz bookBiz) {
		this.bookBiz = bookBiz;
	}

	public void setImageBiz(IImageBiz imageBiz) {
		this.imageBiz = imageBiz;
	}
	
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public void setBook(Book book) {
		this.book = book;
	}



	@Override
	public void prepare() throws Exception {
		book = new Book();
	}
	
	@Override
	public Book getModel() {
		return book;
	}
	
	//����(��ӣ��鼮
	// �����鼮ǰ��Ҫ��ǰ����image,category,user.
	public String execute() throws Exception{
		
		int imageId = addImage();
		
		// ����ͼƬ��Ϣ
		book.setBookimage(this.imageBiz.findById(imageId));
		
		// ���÷���ʱ��
		book.setPublishdate(new Date());		
		// ���÷�����Ϣ
		book.setCategory(categoryBiz.findById(categoryid));
				
		// ���÷����ߵ���Ϣ
		ActionContext ac = ActionContext.getContext();
		User currentUser =  (User)ac.getSession().get("user");	
		book.setUser(currentUser);
		
		this.bookBiz.add(book);
		return SUCCESS;
	}

	// ���ͼƬ
	private int addImage(){
		try {		
			// ���û���ϴ���ʹ��Ĭ��ͼƬ����Id=1��ͼƬ
			if(null == image){		
				return -1;
			}
			else{
				InputStream in = null;
				
				Bookimage bookImage = new Bookimage();
				in = new FileInputStream(image);
				Blob blob = Hibernate.createBlob(in);
				bookImage.setImage(blob);
				
				int imageid = imageBiz.addImage(bookImage);
				in.close();
				
				return imageid;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
}
