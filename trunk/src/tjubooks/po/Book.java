package tjubooks.po;

import java.util.Date;

/**
 * Book entity. @author MyEclipse Persistence Tools
 */

public class Book implements java.io.Serializable {

	// Fields

	private Integer bookid;
	private Category category;
	private User user;
	private String bookname;
	private String image;
	private String author;
	private String publisher;
	private String isbn;
	private String specialStatement;
	private String introduction;
	private Date publishdate;
	private Date unlinedate;
	private String state;
	private String price;

	// Constructors

	/** default constructor */
	public Book() {
	}

	/** full constructor */
	public Book(Category category, User user, String bookname, String image,
			String author, String publisher, String isbn,
			String specialStatement, String introduction, Date publishdate,
			Date unlinedate, String state, String price) {
		this.category = category;
		this.user = user;
		this.bookname = bookname;
		this.image = image;
		this.author = author;
		this.publisher = publisher;
		this.isbn = isbn;
		this.specialStatement = specialStatement;
		this.introduction = introduction;
		this.publishdate = publishdate;
		this.unlinedate = unlinedate;
		this.state = state;
		this.price = price;
	}

	// Property accessors

	public Integer getBookid() {
		return this.bookid;
	}

	public void setBookid(Integer bookid) {
		this.bookid = bookid;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getBookname() {
		return this.bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return this.publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getIsbn() {
		return this.isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getSpecialStatement() {
		return this.specialStatement;
	}

	public void setSpecialStatement(String specialStatement) {
		this.specialStatement = specialStatement;
	}

	public String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public Date getPublishdate() {
		return this.publishdate;
	}

	public void setPublishdate(Date publishdate) {
		this.publishdate = publishdate;
	}

	public Date getUnlinedate() {
		return this.unlinedate;
	}

	public void setUnlinedate(Date unlinedate) {
		this.unlinedate = unlinedate;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPrice() {
		return this.price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

}