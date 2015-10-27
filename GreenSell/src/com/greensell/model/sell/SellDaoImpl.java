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
	public List<ItemSellVO> allitemList() throws SQLException { //전체 item리스트 출력
		// TODO Auto-generated method stub
		List<ItemSellVO> list = sqlSession.selectList("selectAll");
		return list;
	}

	@Override
	public List<ItemSellVO> olditemList(String howsell) throws SQLException { //중고 itemlist출력
		// TODO Auto-generated method stub
		List<ItemSellVO> list;
		if(howsell==null){
			howsell = "중고";
		}
		list = sqlSession.selectList("selectolditem", howsell);
		return list;
	}

	@Override
	public List<AuctionVO> auctionitemList() throws SQLException { //경매 itemList출력
		// TODO Auto-generated method stub
		List<AuctionVO>	list = sqlSession.selectList("selectauctionitem");
			return list;
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
		int i = sqlSession.delete("deleteitem", no);
		 return (i>0)? true:false;
	}

	@Override
	public boolean auctionDelete(int no) throws SQLException {
		// TODO Auto-generated method stub
		int i = sqlSession.delete("deleteauction", no);
		return (i>0)? true:false;
	}

	
	
}
