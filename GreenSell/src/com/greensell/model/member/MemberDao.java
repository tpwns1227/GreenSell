package com.greensell.model.member;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.tomcat.jni.Mmap;

import com.greensell.bbs.beans.BbsVo;
import com.greensell.member.beans.MemberPSVO;
import com.greensell.member.beans.MemberVO;
import com.greensell.member.beans.MessageVO;
import com.greensell.member.beans.PointVO;
import com.greensell.member.beans.ZipVo;
import com.greensell.sell.beans.AuctionVO;
import com.greensell.sell.beans.ItemSellVO;


public interface MemberDao {

		public boolean updatePoint(Map<String, Object> map) throws SQLException;
		public boolean pointDeposit(Map<String, Object> map) throws SQLException;
		public List<PointVO> pointList(String email);
	   public boolean insert(MemberVO membervo)throws SQLException; //회원 추가
	   public boolean delete(String email)throws SQLException; //회원 삭제
	   public boolean update(MemberVO membervo)throws SQLException; //회원 정보 수정
	   public MemberVO selectpwd(String password); //패스워드 찾기
	   public List<ItemSellVO> selected(String email);//찜목록보기
	   public List<ItemSellVO> buyItem(String email);//구매목록보기
	   public List<AuctionVO> AuctionItem(String email);//경매한 상품보기
	   public List<PointVO> pointcheck(String email);//포인트 내역조회
	   public List<BbsVo> bbsidcheck(String email)throws SQLException;//입력한 글 찾아보기
	   public List<ItemSellVO> sellItem(String email);// 판매할 상품보기
	   public MemberVO memberdetail(String email);//회원 정보 상세보기
	   public boolean logincheck(String email,String password)throws SQLException;//로그인 확인
	   public boolean idcheck(String email)throws SQLException;//아이디중복확인
	   public boolean phonechk(String phone) throws SQLException; // 중복번호있는지 확인
	   public boolean nickcheck(String nickname) throws SQLException;//닉네임중복확인
	   public List<ZipVo> zipvo(String address) throws SQLException;//우편번호찾기
	   public String getQuestion(String email) throws SQLException; //이메일을 입력하면 비밀번호 찾기 질문을 가져옴
	   public String getanswer(String email) throws SQLException; //이메일을 통해 비밀번호 찾기 답을 가져옴
	   public boolean updatepw(Map<String, String> map) throws SQLException;//패스워드 수정하기
	   //public List<ItemSellVO> olditemselectList(String email) throws SQLException; //중고 판매 리스트
	   public List<String> getImagenames(int no) throws SQLException; //게시글에 포함된 이미지 이름들 가져오기
	   //public List<AuctionVO> auctionitemselectList() throws SQLException; //경매 리스트 출력
	   public List<ItemSellVO> allitemList(String email) throws SQLException; //홈에서 중고 및 경매 리스트 통합 출력
	   public String selectpoint(String email) throws SQLException;
	   public boolean cart_delete(Map<String, Object> map) throws SQLException;
	   public String passwordget(String email) throws SQLException;
	   public List<ItemSellVO> mywritesell(String email) throws SQLException;
	   public int getadmin(String email) throws SQLException;
	   public boolean accountchk(String account) throws SQLException;//계좌번호조회다
	   public List<MessageVO> messagelist(String email) throws SQLException;	//메세지 리스트 출력
	   public boolean messageinsert(Map<String, Object> map) throws SQLException;	//메시지 입력하기
	   public MessageVO messagedetail(int no) throws SQLException; //메시지 상세보기
	   public boolean messagedelete(int no) throws SQLException; //메세지 삭제하기
}