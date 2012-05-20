package tjubooks.action.imageAction;

import tjubooks.biz.IImageBiz;
import tjubooks.po.Book;
import tjubooks.po.Bookimage;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Hibernate;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class GetImageAction extends ActionSupport{

	private Integer imageId;
	
	// Spring 框架进行依赖注入
	private IImageBiz imageBiz;
	
	public void setImageId(Integer imageId) {
		this.imageId = imageId;
	}
	
	public void setImageBiz(IImageBiz imageBiz) {
		this.imageBiz = imageBiz;
	}

	//根据图片的id获取图片的信息
	public String execute() {
		Bookimage mybookImage = this.imageBiz.findById(imageId);
		
		if(mybookImage == null){
			return "NoImage";
		}
		Blob image =  mybookImage.getImage();
		
		//获取应用程序的Response级别
		HttpServletResponse response =  ServletActionContext.getResponse();
		
		// 将图片写入输入输出流
		try{
			InputStream	in =  null;
			OutputStream out = response.getOutputStream();
			if(image == null){
				// imageId存在但是不存在图像
				
			}
			else {
				in = image.getBinaryStream(); 
			}		    
		    response.setContentType("image/jpeg");
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
}
