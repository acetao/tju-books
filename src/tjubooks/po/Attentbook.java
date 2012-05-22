package tjubooks.po;

import java.util.Date;

/**
 * Attentbook entity. @author MyEclipse Persistence Tools
 */

public class Attentbook implements java.io.Serializable {

	// Fields
	private Integer attentionId;
	private User user;
	private Book book;
	private Date attentionTime;

	// Constructors

	/** default constructor */
	public Attentbook() {
	}

	/** full constructor */
	public Attentbook(User user, Book book, Date attentionTime) {
		this.user = user;
		this.book = book;
		this.attentionTime = attentionTime;
	}

	// Property accessors
	public Integer getAttentionId() {
		return this.attentionId;
	}

	public void setAttentionId(Integer attentionId) {
		this.attentionId = attentionId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Book getBook() {
		return this.book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Date getAttentionTime() {
		return this.attentionTime;
	}

	public void setAttentionTime(Date attentionTime) {
		this.attentionTime = attentionTime;
	}

}