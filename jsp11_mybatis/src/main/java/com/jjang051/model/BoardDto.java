package com.jjang051.model;

public class BoardDto {
	private int no;
	private String userName;
	private String subject;
	private String contents;
	private String regDate;
	private int hit;
	

	public BoardDto() {
		super();
	}

	public BoardDto(int no, String userName, String subject, String contents, String regDate, int hit) {
		super();
		this.no = no;
		this.userName = userName;
		this.subject = subject;
		this.contents = contents;
		this.regDate = regDate;
		this.hit = hit;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "BoardDto [no=" + no + ", userName=" + userName + ", contents=" + contents + ", regDate=" + regDate
				+ "]";
	}

}
