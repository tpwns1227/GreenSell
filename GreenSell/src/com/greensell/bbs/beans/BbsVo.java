package com.greensell.bbs.beans;

import java.sql.Date;

public class BbsVo {

	private int no;//게시글 번호
	private int bbsno;//게시판 분류 번호
	private String title;//게시글제목
	private Date bbsdate;//글쓴 날짜
	private String content;//게시글내용
	private String email;//작성자
	private int hits;//조회수	
	
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
