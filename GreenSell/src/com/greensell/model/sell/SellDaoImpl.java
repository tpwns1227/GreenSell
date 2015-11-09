package com.greensell.model.sell;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.greensell.bbs.beans.ReplyVo;
import com.greensell.member.beans.MemberPSVO;
import com.greensell.sell.beans.AuctionVO;
import com.greensell.sell.beans.ItemSellVO;
import com.greensell.sell.beans.Postbean;

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
   public List<ItemSellVO> olditemList(Map<String, Object> map) throws SQLException { //중고 itemlist출력
      // TODO Auto-generated method stub
      List<ItemSellVO> list = sqlSession.selectList("selectolditem", map);
      return list;
   }

   /*@Override
   public List<AuctionVO> auctionitemList() throws SQLException { //경매 itemList출력
      // TODO Auto-generated method stub
      List<AuctionVO>   list = sqlSession.selectList("selectauctionitem");
         return list;
   }*/

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
   
   @Override//이메일도 필요함.
	public boolean selectedchk(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
	    String result = sqlSession.selectOne("sell.selectedchk", map);
		System.out.println(result);
	    if(result==null)
			return false;
		else
			return true;
	}
   
   @Override
	public List<ItemSellVO> selectlistcategory(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
	   List<ItemSellVO> list = sqlSession.selectList("selectcategory", map);
	   return list;
	}
   
   @Override
	public boolean bidupdate(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
	   	int i = sqlSession.update("bidupdate",map);
		return (i>0)? true:false;
	}
   
   @Override
	public AuctionVO selectbid(int itemno) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bidselect", itemno);
	}
   
   @Override
	public List<ItemSellVO> searchitemList(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("searchlist", map);
	}

@Override
public boolean insertpost(MemberPSVO mp) throws SQLException {//후기게시판
	int t = sqlSession.insert("sell.postinsert", mp);
    if(t==1){return true;}
	return false;
}

@Override
	public List<ItemSellVO> writerlist(String email) throws SQLException {
		// TODO Auto-generated method stub
	List<ItemSellVO> list = sqlSession.selectList("sell.writerlist",email);
    return list;
	}

@Override
	public Postbean selectreview(String email) throws SQLException {
		// TODO Auto-generated method stub
		Postbean reviews = sqlSession.selectOne("sell.selectreview",email);
		return reviews;
	}
	
@Override
		public List<Integer> selectpointlist(String email) throws SQLException {
			// TODO Auto-generated method stub
			List<Integer> list = sqlSession.selectList("getpointlist", email);
			return list;
		}
	
	@Override
		public List<MemberPSVO> selectPS(String email) throws SQLException {
			// TODO Auto-generated method stub
			List<MemberPSVO> psList = sqlSession.selectList("selectPS", email);
			return psList;
		}
	@Override
	public boolean returnbidprice(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		int i = sqlSession.update("returnbidprice", map);
		return (i>0)? true:false;
	}
	
@Override
		public boolean bidpriceminus(Map<String, Object> map) throws SQLException {
			// TODO Auto-generated method stub
			int i = sqlSession.update("bidpriceminus", map);
			return (i>0)? true:false;
		}

@Override
	public boolean insertbuy(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		int i = sqlSession.insert("sell.insertbuy", map);
		return (i>0)? true:false;
	}

@Override
	public boolean insertMessage(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
	int i = sqlSession.insert("sell.insertmessage", map);
	return (i>0)? true:false;
	}

@Override
	public boolean updatesellstate(String itemno) throws SQLException {
		// TODO Auto-generated method stub
	int i = sqlSession.update("sell.updatesellstate", itemno);
	return (i>0)? true:false;
	}

	
}