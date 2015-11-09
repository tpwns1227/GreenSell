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
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.greensell.bbs.beans.ReplyVo;
import com.greensell.member.beans.MemberPSVO;
import com.greensell.member.beans.MemberVO;
import com.greensell.model.member.MemberDao;
import com.greensell.model.member.MemberDaoImpl;
import com.greensell.model.sell.SellDao;
import com.greensell.sell.beans.AuctionVO;
import com.greensell.sell.beans.ItemSellVO;
import com.greensell.sell.beans.Postbean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class SellController {
	// 자동 매핑
	@Autowired
	SellDao dao;
	@Autowired
	MemberDao mdao;
	
	Map<String, Object> map = new HashMap<String, Object>();
	@RequestMapping("/sell_detail") // 글 클릭시 상세보기로 이동
	public String detailform(@RequestParam int no, Model m, HttpSession session) throws SQLException {

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
		session.setAttribute("itemno", no);
		return "/sell/sell_detail";
	}

	@RequestMapping("/") // home 페이지 출력
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
	
	@RequestMapping("/home") // home 페이지 출력
	public String viewhome(Model m) throws SQLException {
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
		uploadDir = uploadDir + "\\";
		
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
		System.out.println(imgname1);
		System.out.println(imgname2);
		System.out.println(imgname3);
		System.out.println(imgname4);
		String img[] = {imgname1, imgname2, imgname3, imgname4};
		System.out.println(img[0]);
		System.out.println(img[1]);
		System.out.println(img[2]);
		System.out.println(img[3]);
		
		for (int i = 0; i < names.size(); i++) {
			if(img[i]!=null){
			File oldfile = new File(uploadDir + names.get(i));
			oldfile.delete();
			}
		}
		map.put("itemno", itsv.getNo());
		if (dao.itemUpdate(itsv)) {
			if (imgname1 != null) {
				map.put("oldimg", names.get(0));
				map.put("imgname", imgname1);
				dao.imgupdate(map);
			}
			if (imgname2 != null && names.size()>=2) {
				map.put("oldimg", names.get(1));
				map.put("imgname", imgname2);
				dao.imgupdate(map);
			}else if(imgname2 != null && names.size()<2){
				map.put("imgname", imgname2);
				dao.imginsert(map);
			}
			if (imgname3 != null && names.size()>=3) {
				map.put("oldimg", names.get(2));
				map.put("imgname", imgname3);
				dao.imgupdate(map);
			}else if(imgname3 != null && names.size()<3){
				map.put("imgname", imgname3);
				dao.imginsert(map);
			}
			if (imgname4 != null && names.size()>=4) {
				map.put("oldimg", names.get(3));
				map.put("imgname", imgname4);
				dao.imgupdate(map);
			}else if(imgname4 != null && names.size()<4){
				map.put("imgname", imgname4);
				dao.imginsert(map);
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

		map.put("email", email);
		map.put("itemno", itemno);
		if(dao.selectedchk(map))
		{
			return "nok";
		}else{
			dao.selectedinsert(map);
			return "ok";
		}	
	}
	
	@RequestMapping("/testest")
	public String test(){
		return "sell/NewFile";
	}
	
	@RequestMapping("/reitemlist")
	public String reitemlist(Model m, @RequestParam String count, @RequestParam String howsell, @RequestParam String category) throws SQLException{
		if(category.equals("전체")){
			if(howsell.equals("경매"))
			return "redirect:itemList?howsell="+8;
			else
			return "redirect:itemList?howsell="+7;	
		}else{
		map.put("count", count);
		map.put("category", category);
		map.put("howsell", howsell);
		List<ItemSellVO> list = dao.selectlistcategory(map);
		List<String> fristimg = new ArrayList<String>();
		for (int j = 0; j < list.size(); j++) {
			List<String> imglist = dao.getImagenames(list.get(j).getNo());
			fristimg.add(imglist.get(0));
		}
		m.addAttribute("fristimg", fristimg);
		m.addAttribute("howsell",howsell);
		m.addAttribute("category", category);
		m.addAttribute("itemlist",list);
		return "sell/itemList";
		}
	}
	
	@RequestMapping("/bid_form")
	public String bid_form(){
		return "sell/bid_form";
	}
	
	@RequestMapping("/bid")
	public @ResponseBody String bid(HttpSession session, Model m, @RequestParam String bidprice,
			@RequestParam String email, @RequestParam String itemno) throws SQLException{
		
		AuctionVO oldavo = dao.selectbid(Integer.parseInt(itemno));
		map.put("oldprice", oldavo.getNowprice());
		map.put("oldemail", oldavo.getNowemail());
		dao.returnbidprice(map);
		
		map.put("nowprice", Integer.parseInt(bidprice));
		map.put("email", email);
		map.put("itemno", Integer.parseInt(itemno));
		if(dao.bidupdate(map)){
		 AuctionVO avo = dao.selectbid(Integer.parseInt(itemno));
		 dao.bidpriceminus(map);
		 
		 int  point = Integer.parseInt((String) session.getAttribute("point"));  
		   point -= Integer.parseInt(bidprice);
		   
		  String poin = Integer.toString(point);
		  session.setAttribute("point", poin);
		 
		 return "{point:'"+ poin +"', nowprice:'"+avo.getNowprice()+"', nowemail:'"+avo.getNowemail()+"',tendernumber:'"+avo.getTendernumber()+"'}";
		}
		return "실패";	
	}
	
	@RequestMapping("/review_form")
	public String review(){
		return "sell/review_view";
		
	}
	//연락처보기 클릭시
	@RequestMapping("/sell_contact")
	public String contact(@RequestParam String email, Model m) throws SQLException{
		
		Postbean post = dao.selectreview(email);
		m.addAttribute("info", post);
		List<Integer> pointlist = dao.selectpointlist(email);
		int su = 0;
		for(int i=0; i<pointlist.size();i++){
			su += pointlist.get(i);
		}
		
		if(pointlist.size()!=0){
			float f = su;
			m.addAttribute("starpoint", f/pointlist.size());
		}else{
			m.addAttribute("starpoint", "0");
		}
		return "sell/sell_contact";
	}

	
	//후기게시판
	@RequestMapping("/review_list")
	public String reviewlist(Model m, @RequestParam String email) throws SQLException{
		List<MemberPSVO> list = dao.selectPS(email);
		m.addAttribute("PSlist",list);
		m.addAttribute("email",email);
		return "sell/review_view";
	}
	//후기 게시판 등록 폼
	@RequestMapping("/review_write")
	public String reviewwirte(@RequestParam String email, Model m){
		m.addAttribute("email", email);
		return "sell/review";
	}
	
	
	//후기게시판 등록
	@RequestMapping("/reviewok")
	public String postok(MemberPSVO mp, HttpSession session,@RequestParam String email) throws SQLException{
			mp.setEmail(email);
			mp.setWemail((String) session.getAttribute("skey"));
			if(dao.insertpost(mp))
			System.out.println("입력되었습니다.");
			return "redirect:sell_contact?email="+email;
	}
	
	
	@RequestMapping(value="/searchitem", method = RequestMethod.POST)
	public String searchitem(Model m,@RequestParam String str, @RequestParam String count,
			@RequestParam String category ,@RequestParam String howsell) throws SQLException{
		if(category.equals("전체")){
			category = "";
		}
		map.put("howsell", howsell);
		map.put("str", str);
		map.put("category", category);
		map.put("count", count);
		List<String> fristimg = new ArrayList<String>();
		List<ItemSellVO> list = dao.searchitemList(map);
		m.addAttribute("itemlist", list);
		for (int j = 0; j < list.size(); j++) {
			List<String> imglist = dao.getImagenames(list.get(j).getNo());
			fristimg.add(imglist.get(0));
		}
		m.addAttribute("fristimg", fristimg);
		return "sell/searchitem";
	}
	
	@RequestMapping("/itemList") // 중고 및 경매인 경우 글보기
	public String viewitemlist(@RequestParam(required = false) String howsell, @RequestParam(defaultValue="8") String count
			, Model m) throws SQLException {
		List<String> fristimg = new ArrayList<String>();
		List<ItemSellVO> list;
		if (howsell == null || howsell.equals("중고") || howsell.equals("7")) {
			howsell="중고";
			map.put("howsell", howsell);
			map.put("count", count);
			list = dao.olditemList(map);
			m.addAttribute("itemlist", list);
			m.addAttribute("howsell", "중고");
		} else {
			howsell="경매";
			map.put("howsell", howsell);
			map.put("count", count);
			list = dao.olditemList(map);
			m.addAttribute("itemlist", list);
			m.addAttribute("howsell", howsell);
		}
		for (int j = 0; j < list.size(); j++) {
			List<String> imglist = dao.getImagenames(list.get(j).getNo());
			fristimg.add(imglist.get(0));
		}
		m.addAttribute("fristimg", fristimg);	
		return "/sell/itemList";
	}
	
	@RequestMapping("/plusitem")
	public String plusimg(@RequestParam int count){
		System.out.println(count);
		return null;
	}
	
	@RequestMapping("/sellok")
	public @ResponseBody String sellok(HttpSession session,@RequestParam String price,@RequestParam String itemname, 
			@RequestParam String rvemail, @RequestParam String itemno) throws SQLException{
		String buyemail = (String) session.getAttribute("skey");
		
		MemberVO mvo = new MemberVO();
		mvo = mdao.memberdetail(buyemail);
		map.put("email", buyemail);
		map.put("itemno", itemno);
		dao.insertbuy(map);//구매 테이블에 정보넣기
		map.put("rvemail", rvemail);
		String str = "안녕하세요. 관리자 입니다." + buyemail +"님 으로 부터 구매신청이 들어왔습니다. '우편번호:"+mvo.getZipcode() +" 주소:"+ mvo.getAddress()
		+"' 이곳으로 "+itemname+"제품을 보내주시기 바랍니다. 인수가 확인되면 판매금액을 받으실 수 있습니다.";
		map.put("content", str);//판매자 에게 메시지 보내기
		dao.insertMessage(map);//메시지 저장
		int point;
		point = Integer.parseInt((String) session.getAttribute("point"));
		point -= Integer.parseInt(price);
		String poin = Integer.toString(point);
		map.put("price", price);
		mdao.collectPoint(map);  //가격만큼 포인트 차감
		System.out.println(itemno);
		dao.updatesellstate(itemno);
		session.setAttribute("point",poin);
		
		return poin;
	}
	
	
	
}