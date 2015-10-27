package com.greensell.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.greensell.model.bbs.BbsDao;

@Controller
public class BbsController {

	@Autowired
	BbsDao dao;
	//게시글 쓰기
	@RequestMapping("/write")
	public String write(){
		return "bbs/BbsWrite";
	}
	
	@RequestMapping("/write2")
	public String write2(){
		return "bbs/BbsWrite2";
	}
	
	//게시글 보기
	@RequestMapping("/list")
	public String list(){
		return "bbs/BbsList";
	}
	
	@RequestMapping("/qna")
	public String qna(){
		return "bbs/BbsQNA";
	}
	
	//게시글 상세보기
		@RequestMapping("/view")
		public String view(){
			return "bbs/BbsView";
		}
	
	
}
