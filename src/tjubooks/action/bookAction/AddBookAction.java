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
	//ModelDriven自动会根据参数封装进行封装book对象 
	private Book book;  
	//Spring框架根据使用需要进行依赖注入的bookBiz
	private IBookBiz bookBiz;
	private IImageBiz imageBiz;
	private ICategoryBiz categoryBiz;
	
	
	private File image; // 与提交的表单中的file标记中的name属性一致
	private String imageFileName; //待上传的文件名称，固定格式xxxFileName（xxx与file标记中的name属性一致）
	
	private int categoryid;  //书籍的分类
	
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
	
	//发布(添加）书籍
	// 发布书籍前需要提前构造image,category,user.
	public String execute() throws Exception{
		
		int imageId = addImage();
		
		// 设置图片信息
		book.setBookimage(this.imageBiz.findById(imageId));
		
		// 设置发布时间
		book.setPublishdate(new Date());		
		// 设置分类信息
		book.setCategory(categoryBiz.findById(categoryid));
				
		// 设置发布者的信息
		ActionContext ac = ActionContext.getContext();
		User currentUser =  (User)ac.getSession().get("user");	
		book.setUser(currentUser);
		
		this.bookBiz.add(book);
		return SUCCESS;
	}

	// 添加图片
	private int addImage(){
		try {		
			// 如果没有上传，使用默认图片，即Id=1的图片
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
