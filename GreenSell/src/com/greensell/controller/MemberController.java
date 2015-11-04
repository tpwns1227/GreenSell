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
import com.greensell.sell.beans.AuctionVO;
import com.greensell.sell.beans.ItemSellVO;

@Controller
public class MemberController {
	
	   @Autowired
	   MemberDao dao;
	   
	   @RequestMapping("/result") //회원가입하면 이동되는 페이지
	    public String insert(MemberVO v){
	      //DB연동      
	      try {
	    	  
	         if(dao.insert(v)){
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return "redirect:login_form";
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
		   	}else{
		   		m.addAttribute("result","이메일이 존재하지 않습니다.");
				 return "member/memberinfo/login_form";
		   	}
		  if(pwchk) {
			  m.addAttribute("result", "로그인 성공되었습니다.");
			  session.setAttribute("skey", email);
			  session.setAttribute("point", dao.selectpoint(email));
			  return "redirect:home";
		  }else{
			  m.addAttribute("result","로그인에 실패되었습니다.");
			  return "member/memberinfo/login_form";
		  }  
	   }
	   
	   @RequestMapping("/logout") //로그아웃
	   public String logout(HttpSession session){
			   session.invalidate();
			   return "redirect:home";
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
	   @RequestMapping(value = "/phonechk", method = RequestMethod.POST)
	   	public @ResponseBody String phonechk(@RequestParam String phone) throws SQLException{
		   String ph = "(01[016789])-(\\d{3,4})-(\\d{4})";
		   Pattern p = Pattern.compile(ph);
		   System.out.println(ph); 
		   if(!p.matcher(phone).matches()){
			   return "사용불가";
		   }else{
			   boolean phonechk = dao.phonechk(phone);
			   if(phonechk){
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
		   if(!b){ //아이디가 없어서 중복확인 ok.
			   m.addAttribute("chkresult", "사용하셔도 좋은 아이디입니다.");
		   }else{//아이디가 있어서 중복확인 fail
			   m.addAttribute("chkresult", "이미 존재하는 아이디입니다.");
		   }
		   
		   return "member/memberinfo/register_form";
	   }
	   
	   @RequestMapping(value = "/updateForm")//회원정보 수정폼띄우기
	   public String updateForm(HttpSession session, Model m){ 
		   MemberVO vo=dao.memberdetail((String)session.getAttribute("skey"));
		   m.addAttribute("member",vo);
		   return "member/memberinfo/update_form";		   
	   }

	   @RequestMapping(value = "/update_form")//회원정보 수정하기
	   public String memberupdate(MemberVO vo, Model m) throws SQLException{
		   if(vo.getPassword().equals(dao.passwordget(vo.getEmail()))){
			   if(dao.update(vo)){
				   return "redirect:member_Detail";
			   }
		   }
		   MemberVO memvo=dao.memberdetail(vo.getEmail());
		   m.addAttribute("member",memvo);
		   m.addAttribute("result", "비밀번호가 일치하지 않습니다.");
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
		   String skey = (String)session.getAttribute("skey");
		   if(skey==null) return "redirect:home"; 
		   else{
			   MemberVO vo=dao.memberdetail((String)session.getAttribute("skey"));
			   m.addAttribute("member",vo);
			   return "member/memberinfo/member_Detail";
		   }
	   }
	   @RequestMapping("/cart_form")//찜목록이동하기
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
	   public String cart_delete(@RequestParam String no, @RequestParam String email) throws SQLException{
		   Map<String, Object> map = new HashMap<String, Object>();
		   map.put("itemno", no);
		   map.put("email", email);
		   dao.cart_delete(map);
		   return "redirect:cart_form?email="+email;
	   }
	   
	   @RequestMapping("/delete_form")//회원탈퇴하기
	   public String delete_form(){
		   return "member/memberinfo/delete_form";
	   }
	   
	   @RequestMapping("/delete_result")
	   public String delete2(HttpSession session, @RequestParam String password) throws SQLException{
		   String email = (String) session.getAttribute("skey");
		   boolean pwchk = dao.logincheck(email, password);
		   System.out.println(email);
		   System.out.println(pwchk);
		   if (pwchk == true){
			   dao.delete(email);
			   session.invalidate();
			   return "/member/memberinfo/login_form";
		   }
		   return "/home"; // 회원탈퇴할때 비밀번호가 다를경우 수정좀		  
	   }
	   
	   @RequestMapping("/point_form")//포인트내역가기
	   public String point () throws SQLException{
		   return "/member/memberinfo/point_form";
	   }
	   
	   
}