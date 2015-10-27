package com.greensell.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	    	  
	    	  System.out.println(v.getAddress());
	    	  
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
	   
}
