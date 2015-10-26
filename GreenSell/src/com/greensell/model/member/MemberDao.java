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
	   

}
