package com.jang.cap.model;

public class WishVO {
	private int wno;
	private int hno;
	private String userid;
	private String img1;
	private String price;
	private String name;

	private char wish_yn;
	
	public int getWno() {
		return wno;
	}
	public void setWno(int wno) {
		this.wno = wno;
	}
	
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public char getWish_yn() {
		return wish_yn;
	}
	public void setWish_yn(char wish_yn) {
		this.wish_yn = wish_yn;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	

	


}
