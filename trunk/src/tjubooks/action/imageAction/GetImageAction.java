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

	// Spring ��ܽ�������ע��
	private IImageBiz imageBiz;

	public void setImageId(Integer imageId) {
		this.imageId = imageId;
	}

	public void setImageBiz(IImageBiz imageBiz) {
		this.imageBiz = imageBiz;
	}

	// ����ͼƬ��id��ȡͼƬ����Ϣ
	public String execute() {
		if(null == imageId){
			imageId = 1;
		}
		Bookimage mybookImage = this.imageBiz.findById(imageId);

		try{
			// ��ȡӦ�ó����Response����
			HttpServletResponse response = ServletActionContext.getResponse();
			
			// ��ͼƬд�����������
			InputStream in = null;
			OutputStream out = response.getOutputStream();
			// ���ͼƬ
			Blob image = null;
			
			if (null == mybookImage ) {
				// imageId�����ڣ�����Ĭ��ͼƬ
				String defaultImagePath = ServletActionContext
						.getServletContext().getRealPath("/bookimage/images/default.jpg");
				File defaultImage = new File(defaultImagePath);
				in = new FileInputStream(defaultImage);
			}else{
				image = mybookImage.getImage();

				if (image == null) {
					// imageId���ڵ��ǲ�����ͼ�񣬷���Ĭ��ͼƬ
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
		}
		return null;
	}
}
