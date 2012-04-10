package tjubooks.po;

import java.util.HashSet;
import java.util.Set;
import java.sql.Blob;

/**
 * Bookimage entity. @author MyEclipse Persistence Tools
 */

public class Bookimage implements java.io.Serializable {

	// Fields
	private Integer imageId;
	private Blob image;
	private Set books = new HashSet(0);

	// Constructors

	/** default constructor */
	public Bookimage() {
	}

	/** full constructor */
	public Bookimage(Blob image, Set books) {
		this.image = image;
		this.books = books;
	}

	// Property accessors

	public Integer getImageId() {
		return this.imageId;
	}

	public void setImageId(Integer imageId) {
		this.imageId = imageId;
	}

	public Blob getImage() {
		return this.image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}

	public Set getBooks() {
		return this.books;
	}

	public void setBooks(Set books) {
		this.books = books;
	}
}