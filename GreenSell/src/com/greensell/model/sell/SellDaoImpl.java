package com.greensell.model.sell;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.greensell.sell.beans.AuctionVO;
import com.greensell.sell.beans.ItemSellVO;

public class SellDaoImpl implements SellDao {

	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public List<ItemSellVO> allitemList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ItemSellVO> olditemList(String category) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AuctionVO> auctionitemList(String category) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> getImagenames(int no) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean itemInsert(ItemSellVO itsv) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<ItemSellVO> itemDetail(int no) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean itemUpdate(int no) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean itemDelete(int no) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	
	
}
