package tjubooks.action.imageAction;

import tjubooks.biz.IImageBiz;
import tjubooks.po.Book;
import tjubooks.po.Bookimage;

import java.io.DataInputStream;
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

public class GetImageAction extends ActionSupport {

	private Integer imageId = 1;

	// Spring 框架进行依赖注入
	private IImageBiz imageBiz;

	public void setImageId(Integer imageId) {
		this.imageId = imageId;
	}

	public void setImageBiz(IImageBiz imageBiz) {
		this.imageBiz = imageBiz;
	}

	// 根据图片的id获取图片的信息
	public String execute() {
		final int  DefaultImageId = 1;
		
		// 如果imageId 属性为空，发送默认图片
		if(null == imageId){
			imageId = DefaultImageId;
		}
		Bookimage mybookImage = this.imageBiz.findById(imageId);
		
		// 如果imageId属性不为空但是不在数据库id范围内（即查找不出结果),也发送id为1的图片
		if( null == mybookImage){
			mybookImage =  this.imageBiz.findById(DefaultImageId);
		}
		
		// imageId存在但是不存在对应的图像，发送默认图片
		if(null == mybookImage.getImage()){
			mybookImage = this.imageBiz.findById(DefaultImageId);
		}
		
		try{
			// 得到图片
			Blob image = mybookImage.getImage();
			
			// 将图片写入输入输出流
			InputStream in = image.getBinaryStream();
			
			// 获取应用程序的Response级别
			HttpServletResponse response = ServletActionContext.getResponse();
			OutputStream out = response.getOutputStream();
			response.setContentType("image/jpeg");
			
			byte[] buf = new byte[1024];
			int len;
			while ((len = in.read(buf)) != -1) {
				out.write(buf, 0, len);
			}
			in.close();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
/*		try{
			// 获取应用程序的Response级别
			HttpServletResponse response = ServletActionContext.getResponse();
			
			// 将图片写入输入输出流
			InputStream in = null;
			OutputStream out = response.getOutputStream();
			// 存放图片
			Blob image = null;
			
			if (null == mybookImage ) {
				// imageId不存在，发送默认图片
				String defaultImagePath = ServletActionContext
						.getServletContext().getRealPath("/bookimage/images/default.jpg");
				File defaultImage = new File(defaultImagePath);
				in = new FileInputStream(defaultImage);
			}else{
				image = mybookImage.getImage();

				if (image == null) {
					// imageId存在但是不存在图像，发送默认图片
					String defaultImagePath = ServletActionContext
							.getServletContext().getRealPath("/bookimage/images/default.jpg");
					File defaultImage = new File(defaultImagePath);
					in = new FileInputStream(defaultImage);
				} else {
					in = image.getBinaryStream();
				}
			}
			
			response.setContentType("image/jpeg");
			byte[] buf = new byte[1024];
			int len;
			while ((len = in.read(buf)) != -1) {
				out.write(buf, 0, len);
			}
			in.close();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}*/
		return null;
	}
}
