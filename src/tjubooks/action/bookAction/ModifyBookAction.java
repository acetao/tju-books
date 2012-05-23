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
	//ModelDriven自动会根据参数封装进行封装book对象 
	private Book book;  
	//Spring框架根据使用需要进行依赖注入的bookBiz
	private IBookBiz bookBiz;
	private IImageBiz imageBiz;
	private ICategoryBiz categoryBiz;
	
	private File image; // 与提交的表单中的file标记中的name属性一致
	private String imageFileName; // 待上传的文件名称，固定格式xxxFileName（xxx与file标记中的name属性一致）
	
	private int categoryid;  //书籍的分类
	
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
	
	// 修改书籍信息
	// 发布书籍前需要提前构造image,category,user.
	public String execute() throws Exception{
		Book oldBook = bookBiz.findById(book.getBookid());
		
		int imageId =  updateImage();
		book.setBookimage(imageBiz.findById(imageId));
		
		// 设置发布时间为原来的发布时间
		book.setPublishdate(oldBook.getPublishdate());
		// 设置发布者的信息为以前的发布者信息
		book.setUser(oldBook.getUser());
				
		// 更新分类信息
		book.setCategory(categoryBiz.findById(categoryid));

		this.bookBiz.add(book);
		return SUCCESS;
	}
	
	
	// 更新图片信息，如果采用默认图片（imageid==1)，则新建图片，如果不是默认，则更新图片信息,
	// 返回值为更新后的图片的Id
	private Integer updateImage(){
		Book oldBook = bookBiz.findById(book.getBookid());
		Bookimage oldBookImage = oldBook.getBookimage();
		
		
		try {
			// 没有上传图片，则设置为原来的值
			if(null == image){
				System.out.println("image is null");
				return oldBookImage.getImageId();
			}
			else {			
				
				InputStream in = new FileInputStream(image);
				Blob blob = Hibernate.createBlob(in);
				
				Integer imageid = null;
				    
				if(oldBookImage.getImageId() == 1){
					// 如果采用默认图片，则插入新的图片
					Bookimage bookImage =  new Bookimage();
					bookImage.setImage(blob);				
					imageid = imageBiz.addImage(bookImage);
				}else{
					// 更新图片信息
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
