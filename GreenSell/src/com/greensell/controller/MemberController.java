package com.greensell.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greensell.member.beans.MemberVO;
import com.greensell.model.member.MemberDao;

@Controller
public class MemberController {
	
	   @Autowired
	   MemberDao dao;
	   
		@RequestMapping("/insert_form")
		public String viewinsertForm(){
			return "/member/memberinfo/insert_form";
		}
	   @RequestMapping("/result")
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
	
	   @RequestMapping("/login_form")
	   public String loginView(){
		   return "/member/memberinfo/login_form";
	   }
	   
	   @RequestMapping("/register_form")
	   public String registerView(){
		   return "/member/memberinfo/register_form";
	   }
	   
	   @RequestMapping("/login_check")
	   public String loginCheck(@RequestParam String email, @RequestParam String password,
			   					Model m) throws SQLException{
		
		   boolean re = dao.logincheck(email, password);
		  if(re) {
			  m.addAttribute("result", "로그인 성공되었습니다.");
			  return "/member/memberinfo/result2";
		  }else{
			  m.addAttribute("result","로그인에 실패되었습니다.");
			  return "member/memberinfo/login_form";
		  }  
	   }
	   
	   @RequestMapping("/id_check")
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
	   
	   @RequestMapping("/idchk")
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
	   
	   
}
