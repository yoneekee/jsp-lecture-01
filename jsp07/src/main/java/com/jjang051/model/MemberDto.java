package com.jjang051.model;

public class MemberDto {
	private int no;
	private String userId;
	private String userPw;
	private String userName;
	private String UserHp;
	private String userEmail;
	private int zipCode;
	private String addres;
	private String regDate;
	
	public MemberDto() {
		super();
	}
	public MemberDto(int no, String userId, String userPw, String userName, String userHp, String userEmail,
			int zipCode, String addres, String regDate) {
		super();
		this.no = no;
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		UserHp = userHp;
		this.userEmail = userEmail;
		this.zipCode = zipCode;
		this.addres = addres;
		this.regDate = regDate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserHp() {
		return UserHp;
	}
	public void setUserHp(String userHp) {
		UserHp = userHp;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getZipCode() {
		return zipCode;
	}
	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}
	public String getAddres() {
		return addres;
	}
	public void setAddres(String addres) {
		this.addres = addres;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "MemberDto [no=" + no + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName
				+ ", UserHp=" + UserHp + ", userEmail=" + userEmail + ", zipCode=" + zipCode + ", addres=" + addres
				+ ", regDate=" + regDate + "]";
	}
	
	
}
