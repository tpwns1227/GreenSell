package com.greensell.beans;

import java.sql.Date;//

public class ReplyVo {
	private int cmno;//��� ��ȣ
	private int no;//�۹�ȣ
	private String email;//�ۼ���
	private Date cmdate;//��۴� �ð�
	private String cmcontent;//��۳���
	
	public int getCmno() {
		return cmno;
	}
	public void setCmno(int cmno) {
		this.cmno = cmno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getCmdate() {
		return cmdate;
	}
	public void setCmdate(Date cmdate) {
		this.cmdate = cmdate;
	}
	public String getCmcontent() {
		return cmcontent;
	}
	public void setCmcontent(String cmcontent) {
		this.cmcontent = cmcontent;
	}
}
