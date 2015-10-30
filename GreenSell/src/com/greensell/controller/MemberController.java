package com.greensell.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.greensell.member.beans.MemberVO;
import com.greensell.member.beans.ZipVo;
import com.greensell.model.member.MemberDao;

@Controller
public class MemberController {
	
	   @Autowired
	   MemberDao dao;
	   
	   @RequestMapping("/result") //회원가입하면 이동되는 페이지
	    public String insert(MemberVO v, Model m){
	      //DB연동      
	      try {
	    	  
	         if(dao.insert(v)){
	            m.addAttribute("msg","가입을 축하해 !!^^*");
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      
	      return "/member/memberinfo/result";
	   }
	
	   @RequestMapping("/login_form") //로그인폼으로 이동
	   public String loginView(){
		   return "/member/memberinfo/login_form";
	   }
	   
	   @RequestMapping("/cart_form") //카트폼으로 이동
	   public String cartView(){
		   return "/member/memberinfo/cart_form";
	   }
	   
	   @RequestMapping("/register_form") // 회원가입 폼으로 이동
	   public String registerView(){
		   return "/member/memberinfo/register_form";
	   }
	   
	   @RequestMapping("/login_check") // 로그인 여부 확인
	   public String loginCheck(@RequestParam String email, @RequestParam String password,
			   					Model m, HttpSession session) throws SQLException{
		   	boolean pwchk = false;
		    boolean idchk =	dao.idcheck(email); //트루이면 아이디가 존재함
		   	if(idchk){
		   	  	pwchk = dao.logincheck(email, password);
		   	}else{
		   		m.addAttribute("result","이메일이 존재하지 않습니다.");
				 return "member/memberinfo/login_form";
		   	}
		  if(pwchk) {
			  m.addAttribute("result", "로그인 성공되었습니다.");
			  session.setAttribute("skey", email);
			  return "/main/home";
		  }else{
			  m.addAttribute("result","로그인에 실패되었습니다.");
			  return "member/memberinfo/login_form";
		  }  
	   }
	   
	   
	   @RequestMapping("/logout") //로그아웃
	   public String logout(HttpSession session){
			   session.invalidate();
		   return "main/home";
	   }
	   
	   @RequestMapping(value = "/idchk", method = RequestMethod.POST)
	    public @ResponseBody String idchk(@RequestParam String email) throws SQLException {
		   String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
		   Pattern p = Pattern.compile(regex);
		   if(!p.matcher(email).matches()){	return "사용불가"; 
		   }else{
			   boolean idchk = dao.idcheck(email);
				  
				  if(idchk){
					  return "사용불가";
				  }else{
				   return "사용가능";
				  }
		   }
	   }
	   
	   @RequestMapping("/updatepw")
	   public String updatepw(@RequestParam String password,
			   				  @RequestParam String email) throws SQLException{
		   Map<String, String> map = new HashMap<String, String>();
		   map.put("email", email);
		   map.put("password", password);
		   dao.updatepw(map);
		   return "member/memberinfo/login_form";
	   }
	   
	   @RequestMapping(value = "/emailchk", method = RequestMethod.POST)
	   public @ResponseBody String emailchk(@RequestParam String email) throws SQLException{
		   String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
		   Pattern p = Pattern.compile(regex);
		   if(!p.matcher(email).matches()){	return "사용불가"; 
		   }else{
		   return dao.getQuestion(email);
		   }
	   }
	   
	   @RequestMapping(value = "/qustion_answer", method = RequestMethod.POST)
	   public @ResponseBody String qustion_answerchk(@RequestParam String email,
			   @RequestParam String qanswer) throws SQLException{
		   if(!qanswer.equals(dao.getanswer(email))){
			  return "질문과 답이 일치하지 않습니다.";
		  }else{ 
		  return "ok";
		  }
	   }
	   
	   
	   @RequestMapping(value = "/nickchk", method = RequestMethod.POST)
	    public @ResponseBody String nickchk(@RequestParam String nickname) throws SQLException {
			   boolean idchk = dao.nickcheck(nickname);  
				  if(idchk){
					  return "사용불가";
				  }else{
				   return "사용가능";
				  }
		   }
	   
	   
	 /*  @RequestMapping("/id_check") // 아이디 중복확인
	   public String idCheck(@RequestParam String email,@RequestParam String password,
			   				Model m)throws SQLException{
		   
		   boolean ch = dao.idcheck(email);
		   if(ch){
			  m.addAttribute("check", true);
		   }else{
			   m.addAttribute("check",false);
		   }   
		   return "member/memberinfo/register_form";
	   }*/
	   
	   @RequestMapping("/idchk") //아이디 중복검사 (윤세준)
	   public String registeridchk(@RequestParam String email, Model m) throws SQLException{
		  
		   boolean b = dao.idcheck(email);
		   System.out.println(b);
		   if(!b){ //아이디가 없어서 중복확인 ok.
			   m.addAttribute("chkresult", "사용하셔도 좋은 아이디입니다.");
		   }else{//아이디가 있어서 중복확인 fail
			   m.addAttribute("chkresult", "이미 존재하는 아이디입니다.");
		   }
		   
		   return "member/memberinfo/register_form";
	   }
	   
	   @RequestMapping("/updateForm")//회원정보 수정폼띄우기
	   public String updateForm(HttpSession session, Model m){
		   
		   MemberVO vo=dao.memberdetail((String)session.getAttribute("skey"));
		   m.addAttribute("member",vo);
//		   session.setAttribute("addr",vo.getAddress());
//		   session.setAttribute("bank",vo.getBank());
//		   session.setAttribute("account", vo.getAccount());
//		   session.setAttribute("question", vo.getQuestion());
//		   session.setAttribute("answer", vo.getAnswer());
		   return "member/memberinfo/update_form";
		   
	   }

	   @RequestMapping("/update_form")//회원정보 수정하기
	   public String memberupdate(MemberVO membervo,HttpSession session) throws SQLException{
		   if(dao.update(membervo))
			   return "member/memberinfo/login_form";
		   else
			   session.setAttribute("skey",membervo.getEmail());
			   return "member/memberinfo/update_form";
	   }
	   @RequestMapping("/zip_form")//우편번호찾기폼띄우기
	   public String zipSearch(){
		 
		   return "member/memberinfo/zip_form";
	   }
	   
	   @RequestMapping(value = "/zip_result", method = RequestMethod.POST)
	   public String zip_result(@RequestParam String address, Model m,HttpSession session, ZipVo vo) throws SQLException{
		 
		   List<ZipVo> list = dao.zipvo(address);
		  m.addAttribute("result", list);
		 session.setAttribute("zipp", vo.getZipcode());
		 return "member/memberinfo/zip_form";
	   }
	   
	   @RequestMapping("/searchPw_form")//비밀번호 찾기 폼
	   public String pwSearch(){
		   return "member/memberinfo/find_form";
	   }
	   @RequestMapping("/serarchPw")
	   public String search_pw(@RequestParam String password,Model m) throws SQLException{
		    MemberVO mv = dao.selectpwd(password);
		   m.addAttribute("pass",mv);
		   return "member/memberinfo/find_form";
	   } 
	   @RequestMapping("/member_Detail")//Detail폼띄우기
	   public String member_Detail(HttpSession session, Model m){
		   MemberVO vo=dao.memberdetail((String)session.getAttribute("skey"));
		   m.addAttribute("member",vo);
		   return "member/memberinfo/member_Detail";
	   }
	   
	   
	   
}
