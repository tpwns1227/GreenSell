package com.greensell.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	// 자동 매핑
	@Autowired
	SellDao dao;

	@RequestMapping("/sell_detail") // 글 클릭시 상세보기로 이동
	public String detailform(@RequestParam int no, Model m) throws SQLException {

		ItemSellVO ivo = dao.itemDetail(no); // 게시글 한가지의 정보를 가져온다.

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

	@RequestMapping("/itemList")
	public String viewitemlist(@RequestParam(required = false) String howsell, Model m) throws SQLException {
		if (howsell == null || howsell.equals("중고")) {
			List<ItemSellVO> list = dao.olditemList(howsell);
			m.addAttribute("itemlist", list);
		} else {
			List<AuctionVO> list = dao.auctionitemList();
			m.addAttribute("itemlist", list);
		}
		return "/sell/itemList";

	}

	// UTF
	@RequestMapping("deleteitem") // delete 기능구현
	public String deleteitem(@RequestParam int no, @RequestParam String howsell) throws SQLException {

		if (howsell.equals("경매")) {
			boolean r = dao.auctionDelete(no);
			System.out.println(r);
		}

		boolean b = dao.itemDelete(no);

		if (b) {
			System.out.println("삭제에 성공하셨습니다.");
		} else {
			System.out.println("삭제에 실패하였습니다.");
		}

		return "/sell/main";
	}

	@RequestMapping("updateitem")
	public String updateitem(@RequestParam ItemSellVO iso) {
		try {
			System.out.println("여기오냐?");
			if (dao.itemUpdate(iso)) {
				System.out.println("업데이트 성공!");
				return "redirect:list";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// model.addAttribute("person", dao.select(name));
		System.out.println("업데이트 실패!");
		return "1023/update_form";
	}

	@RequestMapping("/inputform")
	public String viewitemlist() throws SQLException {

		return "/sell/sell_write";
	}

	@RequestMapping("/List")
	public String viewitemlist(ItemSellVO itsv) throws SQLException {
		if (dao.itemInsert(itsv)) {
			System.out.println("나는된다.");
		}
		return "/main/home";
	}

	@RequestMapping("/sellinput")
	public String insertsellitem(ItemSellVO itsv, @RequestParam(required=false) String finishtime, @RequestParam() String imgname1,
			@RequestParam(required = false) String imgname2, @RequestParam(required = false) String imgname3,
			@RequestParam(required = false) String imgname4) throws SQLException {
		boolean result = false;
		Map<String, Object> map = new HashMap<String, Object>();
		int i = dao.selectlastno();
		result = dao.itemInsert(itsv);
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
				dao.imginsert(map);}
			if(imgname3 != null){
				map.put("imgname", imgname3);
				dao.imginsert(map);}
			if(imgname4 != null){
				map.put("imgname", imgname4);	
				dao.imginsert(map);}
		}

		return "redirect:home";
	}

}