package tjubooks.po;

import java.util.Date;

/**
 * Requestbook entity. @author MyEclipse Persistence Tools
 */

public class Requestbook implements java.io.Serializable {

	// Fields

	private Integer requestId;
	private User user;
	private String reqBookName;
	private String reqBookIntroduce;
	private Date reqDate;
	private Boolean hasResponse;

	// Constructors

	/** default constructor */
	public Requestbook() {
	}

	/** full constructor */
	public Requestbook(User user, String reqBookName, String reqBookIntroduce,
			Date reqDate, Boolean hasResponse) {
		this.user = user;
		this.reqBookName = reqBookName;
		this.reqBookIntroduce = reqBookIntroduce;
		this.reqDate = reqDate;
		this.hasResponse = hasResponse;
	}

	// Property accessors

	public Integer getRequestId() {
		return this.requestId;
	}

	public void setRequestId(Integer requestId) {
		this.requestId = requestId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getReqBookName() {
		return this.reqBookName;
	}

	public void setReqBookName(String reqBookName) {
		this.reqBookName = reqBookName;
	}

	public String getReqBookIntroduce() {
		return this.reqBookIntroduce;
	}

	public void setReqBookIntroduce(String reqBookIntroduce) {
		this.reqBookIntroduce = reqBookIntroduce;
	}

	public Date getReqDate() {
		return this.reqDate;
	}

	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}

	public Boolean getHasResponse() {
		return this.hasResponse;
	}

	public void setHasResponse(Boolean hasResponse) {
		this.hasResponse = hasResponse;
	}

}