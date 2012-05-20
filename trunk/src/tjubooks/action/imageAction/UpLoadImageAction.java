package tjubooks.action.imageAction;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Blob;

import org.hibernate.Hibernate;

import tjubooks.biz.IImageBiz;
import tjubooks.po.Bookimage;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class UpLoadImageAction extends ActionSupport{


	private IImageBiz imageBiz; // 由spring进行依赖注入
	
	private File image; // 与提交的表单中的s:file标记中的name属性一致
	private String imageFileName ; // 待上传的文件名称，固定格式xxxFileName（xxx与s:file标记中的name属性一致）
	private String imageContentType; // 上传文件的类型
	
	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public void setImageBiz(IImageBiz imageBiz) {
		this.imageBiz = imageBiz;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}


	public String execute(){
		InputStream in = null;
		try {
			Bookimage bookImage = new Bookimage();
			
			// 如果没有上传，返回error,可以在页面上使用js进行校验
			if(null == image){
				System.out.println("image is null");
				return "error";
			}
			in = new FileInputStream(image);
			Blob blob = Hibernate.createBlob(in);
			bookImage.setImage(blob);
			Integer id = imageBiz.addImage(bookImage);
			
			// 将书籍ID放入图片中
			ActionContext ac = ActionContext.getContext();
			in.close();
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "success";
	}
}
