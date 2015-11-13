package com.greensell.controller;

import java.sql.Date;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Generated;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.greensell.bbs.beans.BbsVo;
import com.greensell.bbs.beans.ReplyVo;
import com.greensell.model.bbs.BbsDao;
import com.greensell.model.member.MemberDao;
import com.greensell.sell.beans.ItemSellVO;

@Controller
public class BbsController {

   @Autowired
   BbsDao dao;
   //게시글 쓰기
   
   @RequestMapping("/write")
   public String write(@RequestParam int no,Model m){
      
      m.addAttribute("no",no);
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
      public String list(Model m ,HttpSession session,@RequestParam(required=false) String no, @RequestParam(defaultValue="1") int page) throws SQLException{  
    	if(no==null){
    	  no = (String)session.getAttribute("no");
    	}
    	int bbsno = Integer.parseInt(no);
    	List<BbsVo> bbslist = dao.selectAll(bbsno, page);
    	  
    	m.addAttribute("bbslist", bbslist);
    	  session.setAttribute("no", no);
    	m.addAttribute("totalcount",dao.count(bbsno));
    	m.addAttribute("page",page);
    	 return "bbs/bbsList";
      }
      
      @RequestMapping("/searchbbs")
      public String searchbbs(@RequestParam String title,Model m ,HttpSession session,@RequestParam(required=false) String no, @RequestParam(defaultValue="1") int page) throws SQLException{  

    	  if(no==null){
    	  no = (String)session.getAttribute("no");
    	}
    	int bbsno = Integer.parseInt(no);
    	List<BbsVo> bbslist = dao.selectSearch(bbsno, page, title);  
    	m.addAttribute("bbslist", bbslist);
    	  session.setAttribute("no", no);
    	  Map<String, Object> map = new HashMap<String, Object>();
    	  map.put("bbsno", bbsno);
    	  map.put("title", title);
    	m.addAttribute("totalcount",dao.searchcount(map));
    	m.addAttribute("page",page);
    	 return "bbs/bbsSearch";
      }
      
   
   @RequestMapping("/qna")
   public String qna(){
      return "bbs/bbsQNA";
   } 
   
   //게시글 상세보기
      @RequestMapping("/view")
      public String view(HttpSession session,@RequestParam int no,BbsVo b,Model m,ReplyVo r,@RequestParam String email){
           //System.out.println(no);
         try{
            //System.out.println("이메일 : "+email);
            //이메일로 등급찾기
        	 
            //System.out.println(grade);
            System.out.println("================================================================");
            BbsVo bbsVo = dao.view(no);
            System.out.println(bbsVo.getTitle());
            //System.out.println(bbsVo.getBbsno());
            m.addAttribute("view", bbsVo);
            if((String)session.getAttribute("skey")!=null){
            	int grade=dao.grade((String)session.getAttribute("skey"));
                m.addAttribute("grade",grade);
            }
            List<ReplyVo> replyvo=dao.selectComment(r);
            m.addAttribute("comment",replyvo);
           System.out.println(bbsVo.getBbsno());
            
            dao.hitUp(b);
         }
            catch(Exception e)
            {
               e.printStackTrace();
            }
         return "bbs/bbsView";
      }
   
   //게시글 쓰기 완료
         @RequestMapping("/writeok")
            
         public String ok(BbsVo b,Model m,@RequestParam int bbsno){
            System.out.println(b.getBbsno());
            System.out.println(bbsno);
            m.addAttribute("no",bbsno);
      
            
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
         //댓글쓰기완료
         @RequestMapping("/cmok")
         public String cmok(ReplyVo v,Model m,@RequestParam String email){
            int no=v.getNo();
            try{  
                  
               /*System.out.println(v.getEmail());
               System.out.println(v.getCmcontent());
               System.out.println(v.getNo());*/
               if(dao.insert(v)){
                  return "redirect:view?no="+no+"&email="+email;
               }
               
               }
               catch(Exception e)
               {
                  e.printStackTrace();
               }
               
               return "redirect:view?no="+no+"&email="+email;
            }
         //view에서 수정버튼 누를시 게시글번호로 데이터 전달
         //내용,제목,작성자,날짜,조회수 출력
         //작성자,날짜,조회수 비활성
         @RequestMapping("/update")
         public String update(@RequestParam int no,BbsVo b,Model m){
            //int no=b.getNo();
        	 /*System.out.println(b.getEmail());
            System.out.println(b.getTitle());
            System.out.println(b.getBbscontent());
            System.out.println(b.getBbsno());
            System.out.println(b.getBbsdate());
            System.out.println(no);*/
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
         //수정완료
         @RequestMapping("/updateok")
         public String updateok(BbsVo b,@RequestParam String email){
        	 int no=b.getNo();
            try {
               dao.update(b);
               
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
            System.out.println(email);
            
            return "redirect:view?no="+no+"&email="+email;
         }
         //게시글 삭제
         @RequestMapping("/delete")
         public String delete(@RequestParam int no,@RequestParam int bbsno){
            System.out.println("삭제 ="+no);
            
            //int n=b.getNo();
            //m.addAttribute(no); 
            try {
               
               //if(dao.cmAlldelete(no)){
                  System.out.println("댓글삭제");
                  if(dao.delete(no))
                     return "redirect:list?no="+bbsno;
               //}
               
               
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
            
            return "redirect:list";
         }
         //댓글삭제
         @RequestMapping("/cmdelete")
         public String cmdelete(@RequestParam int cmno, @RequestParam String skey,@RequestParam String email,
                           @RequestParam int no){            
            try {
               if(email.equals(skey)){
                  if(dao.cmdelete(cmno))
                  {
                     return "redirect:view?no="+no+"&email="+email;
                  }
               
               }
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
            return "redirect:view?no="+no+"&email="+email;
            
         }
         
       //소개글
     	@RequestMapping("/introduce")
     	public String introduce(){
     		return "main/introduce";
     	}
     	//소개글
     	@RequestMapping("/way")
     	public String wayway(){
     		return "main/wayofutilization";
     	}
     	//소개글
     	@RequestMapping("/deal")
     	public String dealdeal(){
     		return "main/dealprocess";
     	}
}
   
