package com.greensell.model.sell;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSessionException;

import com.greensell.sell.beans.AuctionVO;
import com.greensell.sell.beans.ItemSellVO;

public interface SellDao {
	
	public List<ItemSellVO> allitemList() throws SQLException; //홈에서 중고 및 경매 리스트 통합 출력
	public List<ItemSellVO> olditemList(String howsell) throws SQLException; //중고 판매 리스트 출력
	public List<AuctionVO> auctionitemList() throws SQLException; //경매 리스트 출력
	public List<String> getImagenames(int no) throws SQLException; //게시글에 포함된 이미지 이름들 가져오기
	public boolean itemInsert(ItemSellVO itsv) throws SQLException; //판매 게시글 올리기
	public ItemSellVO itemDetail(int no) throws SQLException;//판매글 상세보기	
	public boolean itemUpdate(ItemSellVO itsv) throws SQLException; //중고 게시물 수정	
	public boolean itemDelete(int no) throws SQLException;//중고 물품 및 경매 게시물 글 삭제	
	public boolean auctionDelete(int no) throws SQLException;//경매 게시물 글 삭제
}