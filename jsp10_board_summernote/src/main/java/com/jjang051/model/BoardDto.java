package com.jjang051.model;

public class BoardDto {
	private int no;
	private String userName;
	private String title;
	private String contents;
	private String regDate;

	public BoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardDto(int no, String userName, String contents, String regDate) {
		super();
		this.no = no;
		this.userName = userName;
		this.contents = contents;
		this.regDate = regDate;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "BoardDto [no=" + no + ", userName=" + userName + ", contents=" + contents + ", regDate=" + regDate
				+ "]";
	}

}
