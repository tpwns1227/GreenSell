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
		return "bbs/bbsWrite";
	}
	
	@RequestMapping("/write2")
	public String write2(){
		return "bbs/bbsWrite2";
	}
	
	@RequestMapping("/help")
	public String help(){
		return "main/help";
	}
	
	//게시글 보기 
		@RequestMapping("/list")
		public String list(@RequestParam(defaultValue="1") int bbsno,
				@RequestParam(required=false,defaultValue="") String title,
				@RequestParam(required=false,defaultValue="") String bbscontent,
				@RequestParam(defaultValue="1") int pagelink,
				Model m){

			//m.addAttribute("bbsno",bbsno);
			try {
				List<BbsVo> list = dao.selectAll(pagelink,pagelink);
				List<BbsVo> list2 = dao.selectTitle(title);
				List<BbsVo> list3 = dao.selectContent(bbscontent);
				int num = dao.count();
				m.addAttribute("selectAll", list);
				m.addAttribute("selecttitle", list2);
				m.addAttribute("selectcontent", list3);
				m.addAttribute("count", num);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "bbs/bbsList";
		}
	
	@RequestMapping("/qna")
	public String qna(){
		return "bbs/bbsQNA";
	} 
	
	//게시글 상세보기
		@RequestMapping("/view")
		public String view(@RequestParam int no,BbsVo b,Model m,ReplyVo r){
			
			try{
				BbsVo bbsVo = dao.view(no);
				List<ReplyVo> replyvo=dao.selectComment(r);
				m.addAttribute("view", bbsVo);
				m.addAttribute("comment",replyvo);
				
				if(dao.hitUp(b)){
				}				
				
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			return "bbs/bbsView";
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
					
					if(dao.insert(b)){
						m.addAttribute("msg","입력되었습니다.");
						return "bbs/bbsWriteOk";
					}
					
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					
					return "bbs/bbsWrite";
				}
			
	

			@RequestMapping("/cmok")
			public String cmok(ReplyVo v,Model m){
				int no=v.getNo();
				try{  
					   
					/*System.out.println(v.getEmail());
					System.out.println(v.getCmcontent());
					System.out.println(v.getNo());*/
					if(dao.insert(v)){
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
			/*	System.out.println(b.getEmail());
				System.out.println(b.getTitle());
				System.out.println(b.getBbscontent());
				System.out.println(b.getBbsno());
				System.out.println(b.getBbsdate());*/
				
				try{
					BbsVo bbsVo = dao.view(no);
					
					m.addAttribute("view", bbsVo);
					
					
					if(dao.hitUp(b)){
					}				
					
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
				
				return "bbs/bbsUpdate";
			}
			
			@RequestMapping("/updateok")
			public String updateok(BbsVo b){
				int no=b.getNo();
				System.out.println(b.getEmail());
				System.out.println(b.getTitle());
				System.out.println(b.getBbscontent());
				System.out.println(no);
				try {
					if(dao.update(b))
					{
						System.out.println("나 업데이트야");
						return "redirect:view?no="+no;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				return "redirect:view?no="+no;
			}
			
			@RequestMapping("/delete")
			public String delete(@RequestParam int no){
				//int n=b.getNo();
				//m.addAttribute(no); 
				try {
					
					if(dao.cmAlldelete(no)){
						if(dao.delete(no))
							return "redirect:list";
					}
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				return "redirect:list";
			}
			
			@RequestMapping("/cmdelete")
			public String cmdelete(@RequestParam int cmno, @RequestParam String skey,@RequestParam String email,
									@RequestParam int no){				
				try {
					if(email.equals(skey)){
						if(dao.cmdelete(cmno))
						{
							return "redirect:view?no="+no;
						}
					
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return "redirect:view?no="+no;
				
			}
}
	

