package com.jang.cap.model;

import javax.validation.constraints.NotEmpty;

public class UserVO {

	 private int mno;
	 
	 @NotEmpty(message="이름이 입력되지 않았습니다!")
	  private String name;
	 @NotEmpty(message="비밀번호가 입력되지 않았습니다!")
	  private String passwd;
	 @NotEmpty(message="아이디가 입력되지 않았습니다!")
	  private String userId;
	 @NotEmpty(message="생일이 입력되지 않았습니다!")
	  private String birthday;
	 @NotEmpty(message="이메일이 입력되지 않았습니다!")
	  private String email;	 
	 @NotEmpty(message="전화번호가 입력되지 않았습니다!")
	  private String phone;
	 @NotEmpty(message="우편번호가 입력되지 않았습니다!")
	  private  String zip;
	 @NotEmpty(message="주소가 입력되지 않았습니다!")
	  private  String addr1;
	 @NotEmpty(message="상세주소가 입력되지 않았습니다!")
	  private String addr2;
	  
	  private char del_yn='n';
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public char getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(char del_yn) {
		this.del_yn = del_yn;
	}
	  
	  
	  
}
