package com.greensell.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.greensell.member.beans.MemberVO;
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
	   
	   
	   @RequestMapping("/id_check") // 아이디 중복확인
	   public String idCheck(@RequestParam String email,@RequestParam String password,
			   				Model m)throws SQLException{
		   
		   boolean ch = dao.idcheck(email);
		   if(ch){
			  m.addAttribute("check", true);
		   }else{
			   m.addAttribute("check",false);
		   }   
		   return "member/memberinfo/register_form";
	   }
	   
	   @RequestMapping("/idchk") //아이디 중복검사 (윤세준)
	   public String registeridchk(@RequestParam String email, Model m) throws SQLException{
		  
		   boolean b = dao.idcheck(email);
		   System.out.println(b);
		   if(!b){ //아이디가 없어서 중복확인 ok.
			   m.addAttribute("chkresult", "사용하셔도 좋은 아이디입니다.");
		   }else{//아이디가 있어서 중복확인 fail
			   m.addAttribute("chkresult", "이미 존재하는 아이디입니다.");
		   }
		   
		   return "/member/memberinfo/register_form";
	   }
	   
	   //@RequestMapping("/")
}
