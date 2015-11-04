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
      public String list(@RequestParam int no,
            @RequestParam(required=false,defaultValue="") String title,
            @RequestParam(required=false,defaultValue="") String bbscontent,
            @RequestParam(defaultValue="1") int count,
            @RequestParam(required=false,defaultValue="") String ftitle,
            @RequestParam(required=false,defaultValue="") String fcontent,
            Model m){
         //int plus=no+1;
            //System.out.println("숫자 ="+no+" 더하기="+plus+"title="+title+"bbscontent="+bbscontent+"ftitle="+ftitle+"fcontent="+fcontent+"=page="+pagelink);
    	  m.addAttribute("no",no);
         try {
            List<BbsVo> list = dao.selectAll(no,count,count);
            
            List<BbsVo> list2 = dao.selectTitle(no,count,count,ftitle);
            
            List<BbsVo> list3 = dao.selectContent(no,count,count,bbscontent);
             
            int num = dao.count(no);
            int num2 = dao.counttitle(no, ftitle);
            int num3 = dao.countcontent(no, bbscontent);
            System.out.println();
            m.addAttribute("selectAll", list);
            m.addAttribute("selecttitle", list2);
            m.addAttribute("selectcontent", list3);
            m.addAttribute("count", num);
            m.addAttribute("bbsno", count);
            m.addAttribute("counttitle", num2);
            m.addAttribute("countcontent", num3);
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
      public String view(@RequestParam int no,BbsVo b,Model m,ReplyVo r,@RequestParam String email){
           //System.out.println(no);
         try{
            //System.out.println("이메일 : "+email);
            //이메일로 등급찾기
        	 System.out.println("view 시작");
        	 System.out.println(email);
            int grade=dao.grade(email);
            m.addAttribute("grade",grade);
            //System.out.println(grade);
            
            BbsVo bbsVo = dao.view(no);
            //System.out.println(bbsVo.getBbsno());
            List<ReplyVo> replyvo=dao.selectComment(r);
            m.addAttribute("view", bbsVo);
            m.addAttribute("comment",replyvo);
           
            
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
}
   
