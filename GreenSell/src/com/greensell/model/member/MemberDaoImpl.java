package com.greensell.model.member;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.greensell.bbs.beans.BbsVo;
import com.greensell.member.beans.*;
import com.greensell.sell.beans.AuctionVO;
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

	@Override
	public List<ItemSellVO> sellItem(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberVO> membercheck(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ItemSellVO> buyItem(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AuctionVO> AuctionItem(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PointVO> pointcheck(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BbsVo bbscheck(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean logincheck(String email, String password) throws SQLException {
		// TODO Auto-generated method stub
		String pw = sqlSession.selectOne("member.logincheck", email);
		if(pw == null){
			return false;
		}else if(pw.equals(password)){
			return true;
		}
		return false;
	
	}

	@Override
	public boolean idcheck(String email) throws SQLException {
		// TODO Auto-generated method stub
		
		String eml = sqlSession.selectOne("member.idcheck", email);
		
		if(eml == null)
		return false; //아이디가 디비에 없어 시발
		else
		return true; // 아이디가 디비에 존재해
	}

	@Override
	public boolean nickname(String nickname) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}
	
}
