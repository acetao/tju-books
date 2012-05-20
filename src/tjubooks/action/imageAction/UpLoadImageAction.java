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


	private IImageBiz imageBiz; // ��spring��������ע��
	
	private File image; // ���ύ�ı��е�s:file����е�name����һ��
	private String imageFileName ; // ���ϴ����ļ����ƣ��̶���ʽxxxFileName��xxx��s:file����е�name����һ�£�
	private String imageContentType; // �ϴ��ļ�������
	
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
			
			// ���û���ϴ�������error,������ҳ����ʹ��js����У��
			if(null == image){
				System.out.println("image is null");
				return "error";
			}
			in = new FileInputStream(image);
			Blob blob = Hibernate.createBlob(in);
			bookImage.setImage(blob);
			Integer id = imageBiz.addImage(bookImage);
			
			// ���鼮ID����ͼƬ��
			ActionContext ac = ActionContext.getContext();
			in.close();
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		return "success";
	}
}
