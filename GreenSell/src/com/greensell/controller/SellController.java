package com.greensell.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greensell.model.sell.SellDao;
import com.greensell.sell.beans.AuctionVO;
import com.greensell.sell.beans.ItemSellVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class SellController {
	// 자동 매핑
	@Autowired
	SellDao dao;
	
	@RequestMapping("/sell_detail") // 글 클릭시 상세보기로 이동
	public String detailform(@RequestParam int no, Model m) throws SQLException {

		ItemSellVO ivo = dao.itemDetail(no); // 게시글 한가지의 정보를 가져온다.
		//System.out.println(ivo.getEmail());
		if (ivo.getHowsell().equals("경매")) {
			AuctionVO avo = dao.auctionitemDetail(no);
			m.addAttribute("auctionitem", avo);
		} else {
			m.addAttribute("itemone", ivo);
			
		}

		List<String> list = dao.getImagenames(no); // 이미지 뿌리기
		m.addAttribute("imglist", list);
		System.out.println(list.size());
		return "/sell/sell_detail";
	}

	@RequestMapping("/home") // home 페이지 출력
	public String viewHome(Model m) {

		try {
			List<ItemSellVO> list = dao.allitemList();

			m.addAttribute("itemlist", list);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/main/home";
	}

	@RequestMapping("/itemList")//중고 및 경매인 경우 글보기
	public String viewitemlist(@RequestParam(required = false) String howsell, Model m) throws SQLException {
		if (howsell == null || howsell.equals("중고")) {
			List<ItemSellVO> list = dao.olditemList(howsell);
			m.addAttribute("itemlist", list);
			List<String> fristimg = new ArrayList<String>();
			for(int j=0;j<list.size();j++)
			{
				List<String> imglist = dao.getImagenames(list.get(j).getNo());
				fristimg.add(imglist.get(0));
			}
			m.addAttribute("fristimg",fristimg);
		} else {
			List<AuctionVO> list = dao.auctionitemList();
			m.addAttribute("itemlist", list);
			
		}
		return "/sell/itemList";

	}

	// UTF
	@RequestMapping("deleteitem") // delete 기능구현
	public String deleteitem(@RequestParam int no, @RequestParam String howsell) throws SQLException {
		boolean r = false;
		if (howsell.equals("경매")) {
			 r = dao.auctionDelete(no);
		}
		if (r && dao.itemDelete(no)) {
			System.out.println("삭제에 성공하셨습니다.");
		} else {
			System.out.println("삭제에 실패하였습니다.");
		}
		return "/sell/main";
	}

	@RequestMapping("/updateitem")//자신이 올린글 수정
	public String updateitem(@RequestParam ItemSellVO iso) throws SQLException { 
	
		return "1023/update_form";
	}

	@RequestMapping("/inputform")//판매하기 눌렀을때 판매로 이동
	public String viewitemlist() throws SQLException {
		return "/sell/sell_write";
		}


	@RequestMapping("/sellinput") // 파일 올리기 후 경매인지 중고판매인지에 따라 다르게 insert 후 상품 이미지 db에 넣기
	public String insertsellitem(ItemSellVO itsv, HttpServletRequest req) throws SQLException, IOException {	
		int maxPostSize = 50 * 1024 * 1024; // 50MB	
		String pcname =  InetAddress.getLocalHost().getHostName().substring(0, InetAddress.getLocalHost().getHostName().indexOf("-"));
	    String uploadDir = "C:\\Users\\"+pcname+"\\git\\GreenSell\\GreenSell\\WebContent\\img\\item";
		MultipartRequest multi = new MultipartRequest(req, uploadDir, maxPostSize, "UTF-8", new DefaultFileRenamePolicy());
		
		//폼에서  enctype="multipart/form-data"로 데이터 전송시에 
		//request영역에서 parameter를 받아올 수 없기 때문에 일일이 받아와야한다.
		itsv.setItemname(multi.getParameter("itemname"));
		itsv.setCategory(multi.getParameter("category"));
		itsv.setItemstate(multi.getParameter("itemstate"));
		itsv.setHowsell(multi.getParameter("howsell"));
		itsv.setItemprice(Integer.parseInt(multi.getParameter("itemprice")));
		itsv.setItemdetail(multi.getParameter("itemdetail"));
		itsv.setEmail(multi.getParameter("email"));
		String finishtime = multi.getParameter("finishtime");
		String imgname1 = multi.getFilesystemName("imgname1");
		String imgname2 = multi.getFilesystemName("imgname2");
		String imgname3 = multi.getFilesystemName("imgname3");
		String imgname4 = multi.getFilesystemName("imgname4");
		
		boolean result = false;
		Map<String, Object> map = new HashMap<String, Object>();	
		result = dao.itemInsert(itsv);
		int i = dao.selectlastno();
		map.put("email", itsv.getEmail());
		map.put("itemno", i);
		if(itsv.getHowsell().equals("경매")){//경매라면 실행
			map.put("startprice", itsv.getItemprice());
			map.put("finishtime", finishtime);
			result = dao.auctionInsert(map);} 
		
		if (result) { //이미지를 db에 추가
			map.put("imgname", imgname1);
			dao.imginsert(map);
			
			if (imgname2 != null){
				map.put("imgname", imgname2);
				dao.imginsert(map);
				multi.getFilesystemName(imgname2);
				}
			if(imgname3 != null){
				map.put("imgname", imgname3);
				dao.imginsert(map);
				multi.getFilesystemName(imgname3);}
			if(imgname4 != null){
				map.put("imgname", imgname4);	
				dao.imginsert(map);
				multi.getFilesystemName(imgname4);}
		}
		
		return "redirect:home";
	}
	

	
}


