package com.greensell.sell.beans;

public class AuctionVO {
	
		private int no;
		private String itemname;
	   private int itemprice;
	   private String itemstate;
	   private String category;
	   private String howsell;
	   private String itemdetail;
	   private String email;
	   private String sellstate;
	
	public String getSellstate() {
		return sellstate;
	}
	public void setSellstate(String sellstate) {
		this.sellstate = sellstate;
	}
	private int startprice;
	private int nowprice;
	private String finishtime;
	private int tendernumber;
	private String nowemail;
	
	
	
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public int getItemprice() {
		return itemprice;
	}
	public void setItemprice(int itemprice) {
		this.itemprice = itemprice;
	}
	public String getItemstate() {
		return itemstate;
	}
	public void setItemstate(String itemstate) {
		this.itemstate = itemstate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getHowsell() {
		return howsell;
	}
	public void setHowsell(String howsell) {
		this.howsell = howsell;
	}
	public String getItemdetail() {
		return itemdetail;
	}
	public void setItemdetail(String itemdetail) {
		this.itemdetail = itemdetail;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public int getStartprice() {
		return startprice;
	}
	public void setStartprice(int startprice) {
		this.startprice = startprice;
	}
	public int getNowprice() {
		return nowprice;
	}
	public void setNowprice(int nowprice) {
		this.nowprice = nowprice;
	}
	public String getFinishtime() {
		return finishtime;
	}
	public void setFinishtime(String finishtime) {
		this.finishtime = finishtime;
	}
	public int getTendernumber() {
		return tendernumber;
	}
	public void setTendernumber(int tendernumber) {
		this.tendernumber = tendernumber;
	}
	public String getNowemail() {
		return nowemail;
	}
	public void setNowemail(String nowemail) {
		this.nowemail = nowemail;
	}
	
	
	
}
