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

	// ModelDriven �Զ���װ
	private Bookimage bookImage;
	// Spring ��ܽ�������ע��
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

	//����ͼƬ��id��ȡͼƬ����Ϣ
	public String getImage() {
		Bookimage mybookImage = this.imageBiz.findById(bookImage.getImageId());
		Blob image =  mybookImage.getImage();
		
		//��ȡӦ�ó����Response����
		HttpServletResponse response =  ServletActionContext.getResponse();
		
		// ��ͼƬд�����������
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
