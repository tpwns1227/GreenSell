package com.greensell.model.member;

import java.sql.SQLException;
import java.util.List;

import com.greensell.member.beans.MemberVO;
import com.greensell.sell.beans.ItemSellVO;


public interface MemberDao {

	   public boolean insert(MemberVO membervo)throws SQLException; //ȸ�� �߰�
	   public boolean delete(String email)throws SQLException; //ȸ�� ����
	   public boolean update(MemberVO membervo)throws SQLException; //ȸ�� ���� ����
	   public MemberVO selectpwd(String email); //�н����� ã��
	   public List<ItemSellVO> selected(String email);
	   

}
