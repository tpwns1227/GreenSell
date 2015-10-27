package com.greensell.model.member;

import java.sql.SQLException;
import java.util.List;

import com.greensell.member.beans.MemberVO;
import com.greensell.sell.beans.ItemSellVO;


public interface MemberDao {

	   public boolean insert(MemberVO membervo)throws SQLException; //회원 추가
	   public boolean delete(String email)throws SQLException; //회원 삭제
	   public boolean update(MemberVO membervo)throws SQLException; //회원 정보 수정
	   public MemberVO selectpwd(String email); //패스워드 찾기
	   public List<ItemSellVO> selected(String email);
	   public List<BuyVO> buyItem(String email);//구매목록보기
	   public List<AuctionVO> AuctionItem(String email);//경매한 상품보기
	   public List<PointVO> pointcheck(String email);//포인트 내역조회
	   public BbsVo bbscheck(String email);//입력한 글 찾아보기
	   public List<ItemSellVO> sellItem(String email);// 판매할 상품보기
	   public List<MemberVO> membercheck(String email);//회원 정보 상세보기

}
