package com.greensell.controller;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Generated;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greensell.bbs.beans.BbsVo;
import com.greensell.bbs.beans.ReplyVo;
import com.greensell.model.bbs.BbsDao;
import com.greensell.sell.beans.ItemSellVO;

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
	public String list(//@RequestParam int bbsno,
			@RequestParam(required=false,defaultValue="") String title,
			@RequestParam(required=false,defaultValue="") String content,
			Model m){

		//m.addAttribute("bbsno",bbsno);
		try {

			List<BbsVo> list = dao.selectAll();
			List<BbsVo> list2 = dao.selecttitle(title);
//			List<BbsVo> list3 = dao.selectcontent(content);
			m.addAttribute("selectAll", list);
			m.addAttribute("selecttitle", list2);
//			m.addAttribute("selectcontent", list3);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "bbs/BbsList";
	}
	
	@RequestMapping("/qna")
	public String qna(){
		return "bbs/BbsQNA";
	} 
	
	//게시글 상세보기
		@RequestMapping("/view")
		public String view(@RequestParam int no,BbsVo b,Model m,ReplyVo r){
			
			try{
				BbsVo bbsVo = dao.view(no);
				List<ReplyVo> replyvo=dao.selectcomment(r);
				m.addAttribute("view", bbsVo);
				m.addAttribute("comment",replyvo);
				
				if(dao.Hitup(b)){
				}				
				
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			return "bbs/BbsView";
		}
	
	//게시글 쓰기 완료
			@RequestMapping("/writeok")
				
			public String ok(BbsVo b,Model m){
				
			/*	System.out.println(b.getEmail());
				System.out.println(b.getTitle());
				System.out.println(b.getBbscontent());
				System.out.println(b.getBbsno());
				System.out.println(b.getBbsdate());*/
				
				try{
					
					if(dao.Insert(b)){
						m.addAttribute("msg","입력되었습니다.");
						return "bbs/BbsWriteOk";
					}
					
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					
					return "bbs/BbsWrite";
				}
			
			private void alert(String email) {
				// TODO Auto-generated method stub
				
			}

			@RequestMapping("/cmok")
			public String cmok(ReplyVo v,Model m){
				int no=v.getNo();
				try{  
					   
					/*System.out.println(v.getEmail());
					System.out.println(v.getCmcontent());
					System.out.println(v.getNo());*/
					if(dao.Insert(v)){
						return "redirect:view?no="+no;
					}
					
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					
					return "redirect:view?no="+no;
				}
			//view에서 수정버튼 누를시 게시글번호로 데이터 전달
			//내용,제목,작성자,날짜,조회수 출력
			//작성자,날짜,조회수 비활성
			@RequestMapping("/update")
			public String update(@RequestParam int no,BbsVo b,Model m){
				//int no=b.getNo();
				System.out.println(b.getEmail());
				System.out.println(b.getTitle());
				System.out.println(b.getBbscontent());
				System.out.println(b.getBbsno());
				System.out.println(b.getBbsdate());
				
				try{
					BbsVo bbsVo = dao.view(no);
					
					m.addAttribute("view", bbsVo);
					
					
					if(dao.Hitup(b)){
					}				
					
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
				
				return "bbs/BbsUpdate";
			}
}
	

