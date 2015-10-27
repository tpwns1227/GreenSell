package com.greensell.model.sell;

import java.sql.SQLException;
import java.util.List;

import com.greensell.sell.beans.AuctionVO;
import com.greensell.sell.beans.ItemSellVO;

public interface SellDao {
	
	public List<ItemSellVO> allitemList() throws SQLException; //전체 목록 뿌리기 
	
	public List<ItemSellVO> olditemList(String category) throws SQLException; //중고 리스트
	
	public List<AuctionVO> auctionitemList(String category) throws SQLException; //경매 리스트
	
	public List<String> getImagenames(int no) throws SQLException; //상품 이미지 이름 가져오기
	
	public boolean itemInsert(ItemSellVO itsv) throws SQLException; //상품 추가하기
	
	public List<ItemSellVO> itemDetail(int no) throws SQLException;//상품 상세보기
	
	public boolean itemUpdate(int no) throws SQLException; //상품 게시글 업데이트
	
	public boolean itemDelete(int no) throws SQLException;//상품 게시글 삭제
}
