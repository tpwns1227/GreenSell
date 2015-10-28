package com.greensell.bbs.beans;

import java.sql.Date;

public class BbsVo {

	private int no;//글번호
	private int bbsno;//게시판 번호
	private String title;//글이름
	private Date bbsdate;//게시글 날짜
	private String bbscontent;//게시글
	private String email;//유저 네임
	private int hits;//조회수
	
	public BbsVo(){}

	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBbsno() {
		return bbsno;
	}
	public void setBbsno(int bbsno) {
		this.bbsno = bbsno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getBbsdate() {
		return bbsdate;
	}
	public void setBbsdate(Date bbsdate) {
		this.bbsdate = bbsdate;
	}
	public String getBbscontent() {
		return bbscontent;
	}
	public void setBbscontent(String bbscontent) {
		this.bbscontent = bbscontent;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	
}
