package com.greensell.model.sell;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionException;

import com.greensell.sell.beans.AuctionVO;
import com.greensell.sell.beans.ItemSellVO;
import com.greensell.sell.beans.Postbean;
import com.greensell.bbs.beans.ReplyVo;
import com.greensell.member.beans.*;

public interface SellDao {
	
	public List<ItemSellVO> allitemList() throws SQLException; //홈에서 중고 및 경매 리스트 통합 출력
	public List<ItemSellVO> olditemList(Map<String, Object> map) throws SQLException; //중고 판매 리스트 출력
	/*public List<AuctionVO> auctionitemList() throws SQLException; //경매 리스트 출력
*/	public List<String> getImagenames(int no) throws SQLException; //게시글에 포함된 이미지 이름들 가져오기
	public boolean itemInsert(ItemSellVO itsv) throws SQLException; //판매 게시글 올리기
	public ItemSellVO itemDetail(int no) throws SQLException;//판매글 상세보기	
	public AuctionVO auctionitemDetail(int no) throws SQLException;
	public boolean itemUpdate(ItemSellVO itsv) throws SQLException; //중고 게시물 수정
	public boolean itemDelete(int no) throws SQLException;//중고 물품 게시물 글 삭제
	public boolean itemDeleteimg(int no) throws SQLException;//중고 물품 이미지 삭제
	public int selectlastno() throws SQLException;
	public boolean imginsert(Map<String, Object> map) throws SQLException;
	public boolean auctionInsert(Map<String, Object> map) throws SQLException;
	public boolean imgupdate(Map<String, Object> map) throws SQLException;
	public boolean selectedinsert(Map<String, Object> map) throws SQLException;
	public boolean selectedchk(Map<String, Object> map) throws SQLException;
	public List<ItemSellVO> selectlistcategory(Map<String, Object> map) throws SQLException;
	public boolean bidupdate(Map<String, Object> map) throws SQLException;
	public AuctionVO selectbid(int itemno) throws SQLException;
	public List<ItemSellVO> searchitemList(Map<String, Object> map) throws SQLException;
	public List<ItemSellVO> writerlist(String email) throws SQLException; //홈에서 중고 및 경매 리스트 통합 출력
	public boolean insertpost(MemberPSVO m) throws SQLException;//후기게시판 넣기
	public List<Postbean> selectreview(String email) throws SQLException;	//후기 게시판 출력하기

}