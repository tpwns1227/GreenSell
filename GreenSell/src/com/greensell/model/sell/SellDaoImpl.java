package com.greensell.model.sell;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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
      List<AuctionVO>   list = sqlSession.selectList("selectauctionitem");
         return list;
   }

   @Override
   public List<String> getImagenames(int no) throws SQLException { // 이미지 불러오기 
      // TODO Auto-generated method stub
	  List<String> list = sqlSession.selectList("sell.selectimgname",no);
      return list;
   }

   @Override
   public boolean itemInsert(ItemSellVO itsv) throws SQLException {//판매 글 추가 
      // TODO Auto-generated method stu
	  int i = sqlSession.insert("insertitem", itsv);
      return (i>0)? true:false;
   }
   
   @Override
 	public boolean auctionInsert(Map<String, Object> map) {
 		// TODO Auto-generated method stub
 	  	 int i = sqlSession.insert("sell.auctioninsert", map);
 		 return (i>0)? true:false;
 	}

   @Override
   public ItemSellVO itemDetail(int no) throws SQLException { // 판매 글 상세보기
      // TODO Auto-generated method stub
	   	ItemSellVO vo = sqlSession.selectOne("sell.selectdetail",no);
	   	return vo;
   }
   
   @Override
 	public AuctionVO auctionitemDetail(int no) throws SQLException {
 		// TODO Auto-generated method stub
 	   AuctionVO vo = sqlSession.selectOne("sell.selectdetailAuction",no); 
 		return vo;
 	}

   @Override
   public boolean itemUpdate(ItemSellVO itsv) throws SQLException {//올린 게시글 수정
      // TODO Auto-generated method stub
	   int i =	sqlSession.update("sell.itemupdate",itsv);
	   return (i>0)? true:false;
   }

   @Override
   public boolean itemDelete(int no) throws SQLException {
      // TODO Auto-generated method stub
      int i = sqlSession.delete("deleteitem", no);
       return (i>0)? true:false;
   }
   
   @Override
	public boolean itemDeleteimg(int no) throws SQLException {
	   int i = sqlSession.delete("deleteitemimg", no);
       return (i>0)? true:false;
	}

   @Override
	public boolean imgupdate(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
			int i = sqlSession.update("sell.imgupdate", map);
	   return (i>0)? true:false;
	}
   
   @Override
	public int selectlastno() throws SQLException {
		// TODO Auto-generated method stub 
	  	int i = sqlSession.selectOne("sell.selectlastno");
	   return i;
	}
 
   @Override
	public boolean imginsert(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
	   	 int i = sqlSession.insert("sell.imginsert", map);
		return (i>0)? true:false;
	}
   
   @Override
	public boolean selectedinsert(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
	   int i = sqlSession.insert("sell.insertselected", map);
	   return (i>0)? true:false;
	}
   
   @Override
	public boolean selectedchk(String itemno) throws SQLException {
		// TODO Auto-generated method stub
	    String result = sqlSession.selectOne("sell.selectedchk", itemno);
		System.out.println(result);
	    if(result==null)
			return false;
		else
			return true;
	}
   
   
   
}