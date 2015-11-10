package com.greensell.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.greensell.member.beans.MemberVO;
import com.greensell.member.beans.MessageVO;
import com.greensell.member.beans.PointVO;
import com.greensell.member.beans.ZipVo;
import com.greensell.model.member.MemberDao;
import com.greensell.model.sell.SellDao;
import com.greensell.sell.beans.AuctionVO;
import com.greensell.sell.beans.ItemSellVO;

@Controller
public class MemberController {

	@Autowired
	MemberDao dao;
	@Autowired
	SellDao sdao;

	@RequestMapping("/result") // 회원가입하면 이동되는 페이지
	public String insert(MemberVO v) {
		// DB연동
		try {

			if (dao.insert(v)) {
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:login_form";
	}

	@RequestMapping("/login_form") // 로그인폼으로 이동
	public String loginView() {
		return "/member/memberinfo/login_form";
	}

	@RequestMapping("/register_form") // 회원가입 폼으로 이동
	public String registerView() {
		return "/member/memberinfo/register_form";
	}

	@RequestMapping("/login_check") // 로그인 여부 확인
	public String loginCheck(@RequestParam String email, @RequestParam String password, Model m, HttpSession session)
			throws SQLException {
		boolean pwchk = false;
		boolean idchk = dao.idcheck(email); // 트루이면 아이디가 존재함
		if (idchk) {
			pwchk = dao.logincheck(email, password);
		} else {
			m.addAttribute("result", "이메일이 존재하지 않습니다.");
			return "member/memberinfo/login_form";
		}
		if (pwchk) {
			m.addAttribute("result", "로그인 성공되었습니다.");
			session.setAttribute("skey", email);
			session.setAttribute("amdin", dao.getadmin(email));
			session.setAttribute("point", dao.selectpoint(email));
			return "redirect:home";
		} else {
			m.addAttribute("result", "로그인에 실패되었습니다.");
			return "member/memberinfo/login_form";
		}
	}

	@RequestMapping("/logout") // 로그아웃
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home";
	}

	@RequestMapping(value = "/idchk", method = RequestMethod.POST)
	public @ResponseBody String idchk(@RequestParam String email) throws SQLException {
		String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
		Pattern p = Pattern.compile(regex);
		if (!p.matcher(email).matches()) {
			return "사용불가";
		} else {
			boolean idchk = dao.idcheck(email);

			if (idchk) {
				return "사용불가";
			} else {
				return "사용가능";
			}
		}
	}
	@RequestMapping(value="/namechk", method=RequestMethod.POST)
	public @ResponseBody String namechk(@RequestParam String name){
		String nm = "[가-힣]{2,7}";
		Pattern p = Pattern.compile(nm);
		if(!p.matcher(name).matches()){
			return "사용불가";
		}else{
			return "사용가능";
		}
	}

	@RequestMapping(value = "/accountchk", method = RequestMethod.POST)
	public @ResponseBody String accountchk(@RequestParam String account,@RequestParam String bank)
			throws SQLException {
		String sinhan = "(^11[016789])-(\\d{3})-(\\d{6})";
		String kb = "(\\d{6})-(\\d{2})-(\\d{6})";
		String nh = "(^35[0-9])-(\\d{4})-(\\d{4})-(\\d{2})";
		Pattern s = Pattern.compile(sinhan);
		Pattern k = Pattern.compile(kb);
		Pattern n = Pattern.compile(nh);
		boolean accountchk = dao.accountchk(account);

		if(bank.equals("신한")){
			if(!s.matcher(account).matches()){
				return "사용불가";
			}else{
				
				if (accountchk) {
					return "사용불가";
				} else {
					return "사용가능";
				}
			}
		}else if (bank.equals("농협")){
			if(!n.matcher(account).matches()){
				return "사용불가";
			}else{
				
				if (accountchk) {
					return "사용불가";
				} else {
					return "사용가능";
				}
			}
		}else{
			if(!k.matcher(account).matches()){
				return "사용불가";
			}else{
				
				if (accountchk) {
					return "사용불가";
				} else {
					return "사용가능";
				}
			}
		}
	} 

	@RequestMapping(value = "/phonechk", method = RequestMethod.POST)
	public @ResponseBody String phonechk(@RequestParam String phone) throws SQLException {
		String ph = "(01[016789])-(\\d{3,4})-(\\d{4})";
		Pattern p = Pattern.compile(ph);
		if (!p.matcher(phone).matches()) {
			return "사용불가";
		} else {
			boolean phonechk = dao.phonechk(phone);
			if (phonechk) {
				return "사용불가";
			} else {
				return "사용가능";
			}
		}
	}

	@RequestMapping("/updatepw")
	public String updatepw(@RequestParam String password, @RequestParam String email) throws SQLException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("password", password);
		dao.updatepw(map);
		return "member/memberinfo/login_form";
	}

	@RequestMapping(value = "/emailchk", method = RequestMethod.POST)
	public @ResponseBody String emailchk(@RequestParam String email) throws SQLException {
		String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
		Pattern p = Pattern.compile(regex);
		if (!p.matcher(email).matches()) {
			return "사용불가";
		} else {
			return dao.getQuestion(email);
		}
	}

	@RequestMapping(value = "/qustion_answer", method = RequestMethod.POST)
	public @ResponseBody String qustion_answerchk(@RequestParam String email, @RequestParam String qanswer)
			throws SQLException {
		if (!qanswer.equals(dao.getanswer(email))) {
			return "질문과 답이 일치하지 않습니다.";
		} else {
			return "ok";
		}
	}

	@RequestMapping(value = "/nickchk", method = RequestMethod.POST)
	public @ResponseBody String nickchk(@RequestParam String nickname) throws SQLException {

		String regex = "[a-zA-Z0-9가-힣]+";
		Pattern p = Pattern.compile(regex);
		if (!p.matcher(nickname).matches()) {
			return "사용불가";
		}
		boolean nickchk = dao.nickcheck(nickname);
		if (nickchk) {
			return "사용불가";
		} else {
			return "사용가능";
		}
	}

	/*
	 * @RequestMapping("/id_check") // 아이디 중복확인 public String
	 * idCheck(@RequestParam String email,@RequestParam String password, Model
	 * m)throws SQLException{
	 * 
	 * boolean ch = dao.idcheck(email); if(ch){ m.addAttribute("check", true);
	 * }else{ m.addAttribute("check",false); } return
	 * "member/memberinfo/register_form"; }
	 */

	@RequestMapping("/idchk") // 아이디 중복검사 (윤세준)
	public String registeridchk(@RequestParam String email, Model m) throws SQLException {

		boolean b = dao.idcheck(email);
		if (!b) { // 아이디가 없어서 중복확인 ok.
			m.addAttribute("chkresult", "사용하셔도 좋은 아이디입니다.");
		} else {// 아이디가 있어서 중복확인 fail
			m.addAttribute("chkresult", "이미 존재하는 아이디입니다.");
		}

		return "member/memberinfo/register_form";
	}

	@RequestMapping(value = "/updateForm") // 회원정보 수정폼띄우기
	public String updateForm(HttpSession session, Model m) {
		MemberVO vo = dao.memberdetail((String) session.getAttribute("skey"));
		m.addAttribute("member", vo);
		return "member/memberinfo/update_form";
	}

	@RequestMapping(value = "/update_form") // 회원정보 수정하기
	public String memberupdate(MemberVO vo, Model m) throws SQLException {
		if (vo.getPassword().equals(dao.passwordget(vo.getEmail()))) {
			if (dao.update(vo)) {
				return "redirect:member_Detail";
			}
		}
		MemberVO memvo = dao.memberdetail(vo.getEmail());
		m.addAttribute("member", memvo);
		m.addAttribute("result", "비밀번호가 일치하지 않습니다.");
		return "member/memberinfo/update_form";
	}

	@RequestMapping("/zip_form") // 우편번호찾기폼띄우기
	public String zipSearch() {
		return "member/memberinfo/zip_form";
	}

	@RequestMapping(value = "/zip_result", method = RequestMethod.POST)
	public String zip_result(@RequestParam String address, Model m, HttpSession session, ZipVo vo) throws SQLException {

		List<ZipVo> list = dao.zipvo(address);
		m.addAttribute("result", list);
		session.setAttribute("zipp", vo.getZipcode());
		return "member/memberinfo/zip_form";
	}

	@RequestMapping("/searchPw_form") // 비밀번호 찾기 폼
	public String pwSearch() {
		return "member/memberinfo/find_form";
	}

	@RequestMapping("/serarchPw")
	public String search_pw(@RequestParam String password, Model m) throws SQLException {
		MemberVO mv = dao.selectpwd(password);
		m.addAttribute("pass", mv);
		return "member/memberinfo/find_form";
	}

	@RequestMapping("/member_Detail") // Detail폼띄우기
	public String member_Detail(HttpSession session, Model m) {
		String skey = (String) session.getAttribute("skey");
		if (skey == null)
			return "redirect:home";
		else {
			MemberVO vo = dao.memberdetail((String) session.getAttribute("skey"));
			m.addAttribute("member", vo);
			return "member/memberinfo/member_Detail";
		}
	}

	@RequestMapping("/cart_form") // 찜목록이동하기
	public String cart_form(@RequestParam String email, Model m) throws SQLException {
		List<ItemSellVO> list = dao.selected(email);
		List<String> fristimg = new ArrayList<String>();
		for (int j = 0; j < list.size(); j++) {
			List<String> imglist = dao.getImagenames(list.get(j).getNo());
			fristimg.add(imglist.get(0));
		}
		m.addAttribute("fristimg", fristimg);
		m.addAttribute("itemlist", list);
		return "member/memberfunction/cart_form";
	}

	@RequestMapping("/selected_delete")
	public String cart_delete(@RequestParam String no, @RequestParam String email) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemno", no);
		map.put("email", email);
		dao.cart_delete(map);
		return "redirect:cart_form?email=" + email;
	}

	@RequestMapping("/delete_form") // 회원탈퇴하기
	public String delete_form() {
		return "member/memberinfo/delete_form";
	}

	@RequestMapping("/delete_result")
	public String delete2(HttpSession session, @RequestParam String password) throws SQLException {
		String email = (String) session.getAttribute("skey");
		boolean pwchk = dao.logincheck(email, password);
		System.out.println(email);
		System.out.println(pwchk);
		if (pwchk == true) {
			dao.delete(email);
			session.invalidate();
			return "/member/memberinfo/login_form";
		}
		return "/home"; // 회원탈퇴할때 비밀번호가 다를경우 수정좀
	}

	@RequestMapping("/pointlist_form") // 포인트내역
	public String pointList(HttpSession session, Model m) throws SQLException {
		String email = (String) session.getAttribute("skey");
		List<PointVO> list = dao.pointList(email);
		m.addAttribute("point", list);
		return "member/memberfunction/pointlist_form";
	}

	@RequestMapping("/point_form") // 포인트충전
	public String point() throws SQLException {
		return "member/memberfunction/point_form";
	}

	@RequestMapping("/mywriteForm")
	public String mywriteview(HttpSession session, Model m,@RequestParam(required=false) String email) throws SQLException {
		if(email==null){
		email = (String) session.getAttribute("skey");
		}
		List<ItemSellVO> list = dao.mywritesell(email);
		List<String> fristimg = new ArrayList<String>();
		for (int j = 0; j < list.size(); j++) {
			List<String> imglist = dao.getImagenames(list.get(j).getNo());
			fristimg.add(imglist.get(0));
		}

		m.addAttribute("fristimg", fristimg);
		m.addAttribute("itemlist", list);

		return "member/memberfunction/mywrite_form";
	}

	@RequestMapping("/point")
	public String updatePoint(HttpSession session, @RequestParam String price, Model m) throws SQLException {
		System.out.println(session.getAttribute("point"));
		String email = (String) session.getAttribute("skey");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("price", price);
		map.put("sort", 0);
		map.put("commission", 0);
		int point;
		point = Integer.parseInt((String) session.getAttribute("point"));
		point += Integer.parseInt(price);
		
		String poin = Integer.toString(point);

		dao.updatePoint(map);
		dao.pointDeposit(map);
		session.setAttribute("point", poin);
		
		return "redirect:home";
	}
	
	@RequestMapping("/collect_form")
	public String viewCollectPoint(HttpSession session,Model m){
		String email = (String) session.getAttribute("skey");
		m.addAttribute("mvo", dao.memberdetail(email));
		return "member/memberfunction/point_collect";
	}
	
	@RequestMapping("/pointcollect")
	public String collectPoint(HttpSession session, @RequestParam String price, Model m) throws SQLException {
		System.out.println(session.getAttribute("point"));
		String email = (String) session.getAttribute("skey");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("price", price);
		map.put("sort", 0);
		
		int pric = Integer.parseInt(price);
		
		map.put("commission", (pric*0.05));
		
		int point;
		point = Integer.parseInt((String) session.getAttribute("point"));
		point -= Integer.parseInt(price);
		
		String poin = Integer.toString(point);

		dao.collectPoint(map);
		dao.pointDeposit(map);
		session.setAttribute("point", poin);
		
		return "redirect:home";
	}
	
	//메시지 리스트 보기
	@RequestMapping("/msglistview")
	public String messagelistview(HttpSession session,Model m) throws SQLException{
		String email = (String) session.getAttribute("skey");	//사용자 정보 넣기
		List<MessageVO> list =	dao.messagelist(email);			//사용자의 email리스트 출력
		m.addAttribute("list",list);
		
		return "member/message/msgList";
	}
	
	//메시지 입력폼 이동
	@RequestMapping("/msgwrite")
	public String messagewrite(HttpSession session, MessageVO mvo,Model m) throws SQLException{
		
		return "member/message/msgWrite";
	}
	
	//메시지 쓰기
	@RequestMapping("/msgwriteok")
	public String messagewrite(HttpSession session, MessageVO mvo,Model m,@RequestParam String title,@RequestParam String content,@RequestParam String rvemail) throws SQLException{
	 	
	String email = (String)session.getAttribute("skey");	
	MemberVO memvo = dao.memberdetail(email);
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("sendemail", email);
	map.put("rvemail", rvemail);
	map.put("content", content);
	map.put("title",title );

	dao.messageinsert(map);
		return "redirect:msglistview";
	}
	
	//메시지 상세보기
	@RequestMapping("/msgview")
	public String msgview(Model m,@RequestParam int no) throws SQLException{
		
		MessageVO mvo = dao.messagedetail(no);
		mvo.getSendemail();
		m.addAttribute("view",mvo);		
		return "member/message/msgView";
	}
	
	//메시지 답장하기
	@RequestMapping("/msgreview")
	public String msgreview(@RequestParam String email,Model m){
		m.addAttribute("email",email);
		return "member/message/remsgWrite";
	}
	
	//메시지 삭제하기
	@RequestMapping("/msgdelete")
	public String msgreview(@RequestParam int no) throws SQLException{
		if(dao.messagedelete(no)) return "redirect:msglistview";
		return "member/message/remsgWrite";
	}
	
	@RequestMapping("/buy_form") // 구매 목록 이동하기
	public String buy_form(@RequestParam String email, Model m) throws SQLException {
		List<ItemSellVO> list = dao.buylist(email);
		List<String> takeoverlist = dao.buyto(email);
		List<String> fristimg = new ArrayList<String>();
		for (int j = 0; j < list.size(); j++) {
			List<String> imglist = dao.getImagenames(list.get(j).getNo());
			fristimg.add(imglist.get(0));
		}
		m.addAttribute("fristimg", fristimg);
		m.addAttribute("itemlist", list);
		m.addAttribute("tolist", takeoverlist);
		return "member/memberfunction/buy_form";
	}
	
	@RequestMapping("/takeoverok")
	public String takeoverok(@RequestParam String no, @RequestParam String email) throws SQLException {
		dao.takeover(no);//인수중을 완료로 바꾸고 
		ItemSellVO item = sdao.itemDetail(Integer.parseInt(no));
		 int price = item.getItemprice();		
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("price", price);
		 map.put("email", item.getEmail());
		 dao.updatePoint(map);//판매자의 포인트를 가격만큼 지불	 
		 map.put("rvemail", item.getEmail());
			String str = "안녕하세요. 관리자 입니다." + email +"님 으로 부터 물품 인수가 확인되었습니다. "+
					"재 접속 하시면 판매 대금을 확인 하실 수 있습니다.";
			map.put("content", str);//판매자 에게 메시지 보내기
			dao.insertMessage(map);//메시지 저장
		 
		return "redirect:buy_form?email=" + email;
	}
	
	
	
}