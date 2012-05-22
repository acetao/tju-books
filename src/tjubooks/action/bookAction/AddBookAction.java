package tjubooks.action.bookAction;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Blob;

import org.hibernate.Hibernate;

import tjubooks.biz.IBookBiz;
import tjubooks.biz.IImageBiz;
import tjubooks.po.Book;
import tjubooks.po.Bookimage;

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

	public void setImageBiz(IImageBiz imageBiz) {
		this.imageBiz = imageBiz;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public void setBookBiz(IBookBiz bookBiz) {
		this.bookBiz = bookBiz;
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
		int imageId =  addImage();
		book.setBookimage(imageBiz.findById(imageId));
		
		// ���÷���ʱ��
		// ���÷�����Ϣ
		// ���÷����ߵ���Ϣ
		
		this.bookBiz.add(book);
		return SUCCESS;
	}
	
	
	// �������������ͼƬ�����ݿ�,�������ݿ��в����Id.
	private int addImage(){
		InputStream in = null;
		try {
			Bookimage bookImage = new Bookimage();
			
			// ���û���ϴ�������error,������ҳ����ʹ��js����У��
			if(null == image){
				System.out.println("image is null");
				return -1;
			}
			in = new FileInputStream(image);
			Blob blob = Hibernate.createBlob(in);
			bookImage.setImage(blob);
			
			int imageid = imageBiz.addImage(bookImage);
			in.close();
			
			return imageid;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
}
