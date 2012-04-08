package tjubooks.po;

import java.util.HashSet;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer userid;
	private String username;
	private String password;
	private String gender;
	private String college;
	private String marjor;
	private String grade;
	private String email;
	private String qq;
	private String cellphone;
	private Set books = new HashSet(0);
	private Set requestbooks = new HashSet(0);
	private Set attentbooks = new HashSet(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String username) {
		this.username = username;
	}

	/** full constructor */
	public User(String username, String password, String gender,
			String college, String marjor, String grade, String email,
			String qq, String cellphone, Set books, Set requestbooks,
			Set attentbooks) {
		this.username = username;
		this.password = password;
		this.gender = gender;
		this.college = college;
		this.marjor = marjor;
		this.grade = grade;
		this.email = email;
		this.qq = qq;
		this.cellphone = cellphone;
		this.books = books;
		this.requestbooks = requestbooks;
		this.attentbooks = attentbooks;
	}

	// Property accessors

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCollege() {
		return this.college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getMarjor() {
		return this.marjor;
	}

	public void setMarjor(String marjor) {
		this.marjor = marjor;
	}

	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getCellphone() {
		return this.cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public Set getBooks() {
		return this.books;
	}

	public void setBooks(Set books) {
		this.books = books;
	}

	public Set getRequestbooks() {
		return this.requestbooks;
	}

	public void setRequestbooks(Set requestbooks) {
		this.requestbooks = requestbooks;
	}

	public Set getAttentbooks() {
		return this.attentbooks;
	}

	public void setAttentbooks(Set attentbooks) {
		this.attentbooks = attentbooks;
	}

}