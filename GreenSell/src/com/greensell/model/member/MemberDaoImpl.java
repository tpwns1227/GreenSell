package com.greensell.model.member;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.greensell.member.beans.*;
import com.greensell.sell.beans.ItemSellVO;

public class MemberDaoImpl implements MemberDao {
	
	  @Autowired
	   private SqlSession sqlSession;
	   
	   @Override
	   public boolean insert(MemberVO membervo) throws SQLException {
	      int t = sqlSession.insert("member.insert", membervo);
	      if(t==1)return true;
	      return false;
	   }

	   @Override
	   public boolean delete(String email) throws SQLException {
	      // TODO Auto-generated method stub
	      int t = sqlSession.delete("member.delete", email);
	      if(t>0) return true;
	      return false;
	   }

	   @Override
	   public boolean update(MemberVO membervo) throws SQLException {
	      // TODO Auto-generated method stub
	      int t = sqlSession.update("member.update", membervo);
	      if(t>0) return true;
	      return false;
	   }

	   @Override
	   public MemberVO selectpwd(String email) {
	      // TODO Auto-generated method stub
	      sqlSession.selectOne("member.selectpwd", email);
	      return null;
	   }

	@Override
	public List<ItemSellVO> selected(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
