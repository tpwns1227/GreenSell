package com.greensell.controller;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

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
		// System.out.println(ivo.getEmail());
		if (ivo.getHowsell().equals("경매")) {
			AuctionVO avo = dao.auctionitemDetail(no);
			m.addAttribute("auctionitem", avo);
		} else {
			m.addAttribute("itemone", ivo);

		}

		List<String> list = dao.getImagenames(no); // 이미지 뿌리기
		m.addAttribute("imglist", list);
		return "/sell/sell_detail";
	}

	@RequestMapping("/home") // home 페이지 출력
	public String viewHome(Model m) throws SQLException {

		List<ItemSellVO> list = dao.allitemList();
		List<String> fristimg = new ArrayList<String>();
		m.addAttribute("itemlist", list);
		for (int j = 0; j < list.size(); j++) {
			List<String> imglist = dao.getImagenames(list.get(j).getNo());
			fristimg.add(imglist.get(0));
		}
		m.addAttribute("fristimg", fristimg);
		return "/main/home";
	}

	@RequestMapping("/itemList") // 중고 및 경매인 경우 글보기
	public String viewitemlist(@RequestParam(required = false) String howsell, Model m) throws SQLException {
		List<String> fristimg = new ArrayList<String>();

		if (howsell == null || howsell.equals("중고")) {

			List<ItemSellVO> list = dao.olditemList(howsell);
			m.addAttribute("itemlist", list);

			for (int j = 0; j < list.size(); j++) {
				List<String> imglist = dao.getImagenames(list.get(j).getNo());
				fristimg.add(imglist.get(0));
			}

			m.addAttribute("fristimg", fristimg);

		} else {

			List<AuctionVO> list = dao.auctionitemList();
			m.addAttribute("itemlist", list);
			for (int j = 0; j < list.size(); j++) {
				List<String> imglist = dao.getImagenames(list.get(j).getNo());
				fristimg.add(imglist.get(0));
			}
			m.addAttribute("fristimg", fristimg);

		}
		return "/sell/itemList";
	}

	// UTF
	@RequestMapping("/deleteitem") // delete 기능구현
	public String deleteitem(@RequestParam int no) throws SQLException, UnknownHostException {

		String pcname = InetAddress.getLocalHost().getHostName().substring(0,
				InetAddress.getLocalHost().getHostName().lastIndexOf("-"));
		String uploadDir = "C:\\Users\\" + pcname + "\\git\\GreenSell\\GreenSell\\WebContent\\img\\item\\";
		List<String> name = dao.getImagenames(no);
		for (int i = 0; i < name.size(); i++) {
			File oldfile = new File(uploadDir + name.get(i));
			oldfile.delete();
		}
		dao.itemDeleteimg(no);
		dao.itemDelete(no);

		return "redirect:itemList";
	}

	@RequestMapping("/updateitem_form") // 자신이 올린글 수정
	public String updateitem(@RequestParam int no, Model m) throws SQLException {

		ItemSellVO ivo = dao.itemDetail(no); // 게시글 한가지의 정보를 가져온다.
		m.addAttribute("itemone", ivo);
		List<String> imgnames = dao.getImagenames(no);
		m.addAttribute("names", imgnames);
		m.addAttribute("count", imgnames.size());
		return "/sell/update_form";
	}
	
	@RequestMapping("/update_result")
	public String update_result(HttpServletRequest req) throws IOException, SQLException {
		int maxPostSize = 50 * 1024 * 1024; // 50MB
		String pcname = InetAddress.getLocalHost().getHostName().substring(0,
				InetAddress.getLocalHost().getHostName().lastIndexOf("-"));
		String uploadDir = "C:\\Users\\" + pcname + "\\git\\GreenSell\\GreenSell\\WebContent\\img\\item";
		MultipartRequest multi = new MultipartRequest(req, uploadDir, maxPostSize, "UTF-8",
				new DefaultFileRenamePolicy());
		List<String> names = dao.getImagenames(Integer.parseInt(multi.getParameter("no")));
		for (int i = 0; i < names.size(); i++) {
			File oldfile = new File(uploadDir + names.get(i));
			oldfile.delete();
		}
		ItemSellVO itsv = new ItemSellVO();
		itsv.setNo(Integer.parseInt(multi.getParameter("no")));
		itsv.setItemname(multi.getParameter("itemname"));
		itsv.setCategory(multi.getParameter("category"));
		itsv.setItemstate(multi.getParameter("itemstate"));
		itsv.setItemprice(Integer.parseInt(multi.getParameter("itemprice")));
		itsv.setItemdetail(multi.getParameter("itemdetail"));
		String imgname1 = multi.getFilesystemName("imgname1");
		String imgname2 = multi.getFilesystemName("imgname2");
		String imgname3 = multi.getFilesystemName("imgname3");
		String imgname4 = multi.getFilesystemName("imgname4");
		Map<String, Object> map = new HashMap<String, Object>();	
		if (dao.itemUpdate(itsv)) {
			if (imgname1 != null) {
				map.put("oldimg", names.get(0));
				map.put("imgname", imgname1);
				dao.imgupdate(map);
			}
			if (imgname2 != null) {
				map.put("oldimg", names.get(1));
				map.put("imgname", imgname2);
				dao.imgupdate(map);
			}
			if (imgname3 != null) {
				map.put("oldimg", names.get(2));
				map.put("imgname", imgname3);
				dao.imgupdate(map);
			} 
			if (imgname4 != null) {
				map.put("oldimg", names.get(3));
				map.put("imgname", imgname4);
				dao.imgupdate(map);
			}
		}

		return "redirect:sell_detail?no="+itsv.getNo();
	}
	
	@RequestMapping("/time")
	public @ResponseBody String gettime(){	
		long curTime = System.currentTimeMillis();
		SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = time.format(new Date(curTime));
		return str;
	}

	@RequestMapping("/inputform") // 판매하기 눌렀을때 판매로 이동
	public String viewitemlist() throws SQLException {
		return "/sell/sell_write";
	}

	@RequestMapping("/sellinput") // 파일 올리기 후 경매인지 중고판매인지에 따라 다르게 insert 후 상품
									// 이미지 db에 넣기
	public String insertsellitem(ItemSellVO itsv, HttpServletRequest req) throws SQLException, IOException {
		int maxPostSize = 50 * 1024 * 1024; // 50MB
		String pcname = InetAddress.getLocalHost().getHostName().substring(0,
				InetAddress.getLocalHost().getHostName().lastIndexOf("-"));
		String uploadDir = "C:\\Users\\" + pcname + "\\git\\GreenSell\\GreenSell\\WebContent\\img\\item";
		MultipartRequest multi = new MultipartRequest(req, uploadDir, maxPostSize, "UTF-8",
				new DefaultFileRenamePolicy());

		// 폼에서 enctype="multipart/form-data"로 데이터 전송시에
		// request영역에서 parameter를 받아올 수 없기 때문에 일일이 받아와야한다.
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
		if (itsv.getHowsell().equals("경매")) {// 경매라면 실행
			map.put("startprice", itsv.getItemprice());
			map.put("finishtime", finishtime);
			result = dao.auctionInsert(map);
		}

		if (result) { // 이미지를 db에 추가
			map.put("imgname", imgname1);
			dao.imginsert(map);

			if (imgname2 != null) {
				map.put("imgname", imgname2);
				dao.imginsert(map);
				multi.getFilesystemName(imgname2);
			}
			if (imgname3 != null) {
				map.put("imgname", imgname3);
				dao.imginsert(map);
				multi.getFilesystemName(imgname3);
			}

			if (imgname4 != null) {
				map.put("imgname", imgname4);
				dao.imginsert(map);
				multi.getFilesystemName(imgname4);
			}
		}

		return "redirect:home";
	}
	
	@RequestMapping("/insert_cart")
	public @ResponseBody String insertcart(@RequestParam String email, @RequestParam String itemno) throws SQLException{

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("itemno", itemno);
		if(dao.selectedchk(itemno))
		{
			return "nok";
		}else{
			dao.selectedinsert(map);
			return "ok";
		}	
	}
	
	
	
}