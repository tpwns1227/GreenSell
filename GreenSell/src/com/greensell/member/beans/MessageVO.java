package com.greensell.member.beans;

import java.util.Date;

public class MessageVO {
	
	private int no;
	private String sendemail;
	private String rvemail;
	private String nickname;
	private String content;
	private String title;
	private Date mdate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSendemail() {
		return sendemail;
	}
	public void setSendemail(String sendemail) {
		this.sendemail = sendemail;
	}
	public String getRvemail() {
		return rvemail;
	}
	public void setRvemail(String rvemail) {
		this.rvemail = rvemail;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
	
	
	

}
