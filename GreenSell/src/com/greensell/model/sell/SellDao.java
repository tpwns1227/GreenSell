package com.greensell.model.sell;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSessionException;

import com.greensell.sell.beans.AuctionVO;
import com.greensell.sell.beans.ItemSellVO;

public interface SellDao {
	
	public List<ItemSellVO> allitemList() throws SQLException; //모든 판매글 리스트 출력  
	
	public List<ItemSellVO> olditemList(String howsell) throws SQLException; //중고물품 리스트 출력
	
	public List<AuctionVO> auctionitemList() throws SQLException; //경매물품 리스트 출력
	
	public List<String> getImagenames(int no) throws SQLException; //이미지의 이름을 가져오기
	
	public boolean itemInsert(ItemSellVO itsv) throws SQLException; //물품 등록
	
	public List<ItemSellVO> itemDetail(int no) throws SQLException;//물품 상세보기
	
	public boolean itemUpdate(int no) throws SQLException; //물품 글 업데이트
	
	public boolean itemDelete(int no) throws SQLException;//물품 게시글 삭제
	
	public boolean auctionDelete(int no) throws SQLException;//경매일 경우 삭제 
	
}
