package com.greensell.bbs.beans;

import java.sql.Date;

public class BbsVo {

	private int no;//�Խñ� ��ȣ
	private int bbsno;//�Խ��� �з� ��ȣ
	private String title;//�Խñ�����
	private Date bbsdate;//�۾� ��¥
	private String content;//�Խñ۳���
	private String email;//�ۼ���
	private int hits;//��ȸ��	
	
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
