package tjubooks.po;

import java.util.HashSet;
import java.util.Set;

/**
 * Category entity. @author MyEclipse Persistence Tools
 */

public class Category implements java.io.Serializable {

	// Fields

	private Integer categoryid;
	private String cname;
	private Integer level;
	private Set books = new HashSet(0);

	// Constructors

	/** default constructor */
	public Category() {
	}

	/** full constructor */
	public Category(String cname, Integer level, Set books) {
		this.cname = cname;
		this.level = level;
		this.books = books;
	}

	// Property accessors

	public Integer getCategoryid() {
		return this.categoryid;
	}

	public void setCategoryid(Integer categoryid) {
		this.categoryid = categoryid;
	}

	public String getCname() {
		return this.cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Integer getLevel() {
		return this.level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Set getBooks() {
		return this.books;
	}

	public void setBooks(Set books) {
		this.books = books;
	}

}