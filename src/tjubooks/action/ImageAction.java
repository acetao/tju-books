package tjubooks.action;

import tjubooks.biz.IImageBiz;
import tjubooks.po.Bookimage;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class ImageAction extends ActionSupport implements
		ModelDriven<Bookimage>, Preparable {

	// ModelDriven 自动封装
	private Bookimage bookImage;
	// Spring 框架进行依赖注入
	private IImageBiz imageBiz;
	public void setBookImage(Bookimage bookImage) {
		this.bookImage = bookImage;
	}

	public void setImageBiz(IImageBiz imageBiz) {
		this.imageBiz = imageBiz;
	}

	@Override
	public void prepare() throws Exception {
        bookImage =  new Bookimage();
	}

	@Override
	public Bookimage getModel() {
		return bookImage;
	}

	//根据图片的id获取图片的信息
	public String getImage() {
		Bookimage mybookImage = this.imageBiz.findById(bookImage.getImageId());
		Blob image =  mybookImage.getImage();
		
		//获取应用程序的Response级别
		HttpServletResponse response =  ServletActionContext.getResponse();
		
		// 将图片写入输入输出流
		try{
		    InputStream	in = image.getBinaryStream(); 
		    OutputStream out = response.getOutputStream();;   
		    byte [] buf=new byte[1024];   
		    int len;   
			while((len=in.read(buf))!=-1){
				out.write(buf, 0, len);
			}
		    in.close();   
		    out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public String addImage(){
		return null;
	}
	
}
