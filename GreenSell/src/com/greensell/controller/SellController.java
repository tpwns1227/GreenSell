package com.greensell.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greensell.model.sell.SellDao;
import com.greensell.sell.beans.AuctionVO;
import com.greensell.sell.beans.ItemSellVO;

@Controller
public class SellController {
   //자동 매핑
   @Autowired
   SellDao dao;
   
   //판매 글 쓰기 폼 매핑
      @RequestMapping("/sell_write_form")
      public String writeform(){
         return "/sell/sell_write_form";
      }
      
      //판매 글 추가 content form으로 매핑.
      @RequestMapping("/sellcontent_write_form")
      public String home(@RequestParam String pname,
                     @RequestParam String selltype,
                     @RequestParam String category,
                     @RequestParam String price,
                     @RequestParam String state,
                     @RequestParam String img_1,
                     Model m){
         
         m.addAttribute("pname",pname);
         m.addAttribute("selltype",selltype);
         m.addAttribute("category",category);
         m.addAttribute("price",price);
         m.addAttribute("state",state);
         m.addAttribute("img_1",img_1);
         
         return "/sell/sellcontent_write_form";
      }
   
    
      @RequestMapping("/home") //home 페이지 출력
      public String viewHome(Model m){
         
         try {
            List<ItemSellVO> list = dao.allitemList();
            
            m.addAttribute("itemlist", list);
            
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         return "/main/home";
      }
      
      @RequestMapping("/itemList")
      public String viewitemlist(@RequestParam(required=false) String howsell,
                              Model m) throws SQLException{
         if(howsell == null || howsell.equals("중고")){
            List<ItemSellVO> list = dao.olditemList(howsell);
            m.addAttribute("itemlist", list);
         }else{
            List<AuctionVO> list = dao.auctionitemList();
            m.addAttribute("itemlist", list);
         }
         return "/sell/itemList";
      
      }
      
      //UTF
      @RequestMapping("deleteitem")//delete 기능구현
      public String deleteitem(@RequestParam int no, @RequestParam String howsell) throws SQLException{
         
         
         if(howsell.equals("경매")){
         boolean r =   dao.auctionDelete(no);
         System.out.println(r);
         }
         
         boolean b = dao.itemDelete(no);
         
         if(b){
            System.out.println("삭제에 성공하셨습니다.");
         }else{
            System.out.println("삭제에 실패하였습니다.");
         }
         
         return "/sell/main";
      }
      
      @RequestMapping("updateitem")
      public String updateitem(@RequestParam ItemSellVO iso){
    	  try {
    		  System.out.println("여기오냐?");
  			if(dao.itemUpdate(iso)){
  				System.out.println("업데이트 성공!");
  				return "redirect:list";
  			}
  		} catch (SQLException e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		}
  		//model.addAttribute("person", dao.select(name));
  		 System.out.println("업데이트 실패!");
  		return "1023/update_form";
      }
      
      @RequestMapping("/inputform")
		public String viewitemlist() throws SQLException{
				
			return "/sell/inputItem";
		}
		
		@RequestMapping("/List")
		public String viewitemlist(ItemSellVO itsv) throws SQLException{
			
			if(dao.itemInsert(itsv)){
				System.out.println("나는된다.");
			}
			return "/main/home";
		
		}
}