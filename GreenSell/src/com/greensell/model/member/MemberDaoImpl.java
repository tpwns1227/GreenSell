package com.greensell.model.member;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.greensell.bbs.beans.BbsVo;
import com.greensell.member.beans.*;
import com.greensell.sell.beans.AuctionVO;
import com.greensell.sell.beans.ItemSellVO;

public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean insert(MemberVO membervo) throws SQLException { // 회원정보 입력
		int t = sqlSession.insert("member.insert", membervo);
		if (t == 1)
			return true;
		return false;
	}

	@Override
	public boolean delete(String email) throws SQLException {

		int i = sqlSession.delete("member.delete", email);
		return (i > 0) ? true : false;

	};
	
	@Override
	public int getadmin(String email) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.getadmin",email);
	}

	@Override
	public String selectpoint(String email) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectpoint", email);
	}

	@Override
	public boolean update(MemberVO membervo) throws SQLException {// 회원정보업데이트
		// TODO Auto-generated method stub
		int t = sqlSession.update("member.update", membervo);
		return (t > 0) ? true : false;
	}

	@Override
	public MemberVO selectpwd(String password) {// 비밀번호찾기
		// TODO Auto-generated method stub
		sqlSession.selectOne("member.selectpwd", password);
		return null;
	}
	
	@Override
	public String passwordget(String email) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getpassword", email);
	}
	
	@Override
	public List<ItemSellVO> selected(String email) {// 찜목록보기
		// TODO Auto-generated method stub
		List<String> list = sqlSession.selectList("member.selectedlist",email);
		List<ItemSellVO> itemsellvo=new ArrayList<ItemSellVO>();
		for(int i=0;i<list.size();i++){	
		String no = list.get(i);
		itemsellvo.add((ItemSellVO) sqlSession.selectOne("member.getitem",no));
		}
		return itemsellvo;
	}

	@Override
	public List<ItemSellVO> sellItem(String email) {// 판매할 상품보기
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO memberdetail(String email) {// 회원정보 상세보기
		// TODO Auto-generated method stub
		MemberVO mem = sqlSession.selectOne("member.selectDetail", email);
		return mem;
	}

	@Override
	public List<ItemSellVO> buyItem(String email) {// 구매목록보기
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AuctionVO> AuctionItem(String email) {// 경매한 상품보기
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PointVO> pointcheck(String email) {// 포인트내역
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BbsVo> bbsidcheck(String email) throws SQLException {// 게시판에 있는
																		// 글을
																		// 이메일로
																		// 찾기
		// TODO Auto-generated method stub
		List<BbsVo> list = sqlSession.selectList("member.bbsidcheck", email);
		return list;

	}

	@Override
	public boolean logincheck(String email, String password) throws SQLException {// 로그인
																					// 성공
		// TODO Auto-generated method stub
		String pw = sqlSession.selectOne("member.logincheck", email);
		if (pw == null) {
			return false;
		} else if (pw.equals(password)) {
			return true;
		}
		return false;

	}

	@Override
	public boolean phonechk(String phone) throws SQLException {// 휴대폰중복번호
		// TODO Auto-generated method stub
		String ph = sqlSession.selectOne("member.phonechk", phone);
		if (ph == null)
			return false;
		else
			return true;

	}

	@Override
	public boolean idcheck(String email) throws SQLException {// 아이디 중복여부
		// TODO Auto-generated method stub

		String eml = sqlSession.selectOne("member.idcheck", email);

		if (eml == null)
			return false; // 아이디가 디비에 없어 시발
		else
			return true; // 아이디가 디비에 존재해
	}

	@Override
	public boolean nickcheck(String nickname) throws SQLException {// 닉네임 존재여부
		// TODO Auto-generated method stub
		String nick = sqlSession.selectOne("member.nickcheck", nickname);
		if (nick == null)
			return false;
		else
			return true;
	}

	@Override
	public List<ZipVo> zipvo(String address) throws SQLException {// 우편번호찾기
		// TODO Auto-generated method stub
		List<ZipVo> list = sqlSession.selectList("member.getPost", address);
		return list;
	}

	@Override
	public String getQuestion(String email) throws SQLException {// 질문얻어오기
		// TODO Auto-generated method stub
		String question = sqlSession.selectOne("member.getquestion", email);
		return question;
	}

	@Override
	public String getanswer(String email) throws SQLException {// 답얻어오기
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.getanswer", email);
	}

	@Override
	public boolean updatepw(Map<String, String> map) throws SQLException {// 패스워드수정하기
		// TODO Auto-generated method stub
		int i = sqlSession.update("member.updatepw", map);
		return (i > 0) ? true : false;
	}

	/*
	 * @Override public List<ItemSellVO> olditemselectList(String email) throws
	 * SQLException { // TODO Auto-generated method stub List<ItemSellVO> list;
	 * 
	 * list = sqlSession.selectList("member.selectoldlist", email); return list;
	 * }
	 * 
	 * @Override public List<AuctionVO> auctionitemselectList() throws
	 * SQLException { // TODO Auto-generated method stub List<AuctionVO> list =
	 * sqlSession.selectList("member.selectauctionitemlist"); return list; }
	 */

	@Override
	public List<String> getImagenames(int no) throws SQLException { // 이미지 불러오기
		// TODO Auto-generated method stub
		List<String> list = sqlSession.selectList("member.selectimgname", no);
		return list;
	}

	@Override
	public List<ItemSellVO> allitemList(String email) throws SQLException {
		// TODO Auto-generated method stub
		List<ItemSellVO> list = sqlSession.selectList("member.allselectitemList", email);
		return list;
	}
	
	
	@Override
	public boolean cart_delete(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		int i = sqlSession.delete("cartdelete", map);
		return (i>0)? true:false;
	}
	
	@Override
	public List<ItemSellVO> mywritesell(String email) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("member.mywritesell", email);
	}

	@Override
	public List<PointVO> pointList(String email) {
		return sqlSession.selectList("member.point", email);
	      
	}

	@Override
	public boolean updatePoint(Map<String, Object> map) throws SQLException {
		int i = sqlSession.update("member.updatePoint", map);
		return (i > 0) ? true : false;
	}

	@Override
	public boolean pointDeposit(Map<String, Object> map) throws SQLException {
		int t = sqlSession.insert("member.pointDeposit", map);
		if (t == 1)
			return true;
		return false;
	}
	
	

}
