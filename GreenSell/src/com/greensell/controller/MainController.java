package com.greensell.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greensell.model.sell.SellDao;

@Controller
public class MainController {
	
	@Autowired
	SellDao dao;
	
	@RequestMapping("/view")
	public String view(){
		return "view";
	}
	
	@RequestMapping("/home")
	public String home(@RequestParam String pname,
					   @RequestParam String selltype,
					   @RequestParam String category,
					   @RequestParam String price,
					   @RequestParam String state,
					   @RequestParam String img_1,
					   Model m){
		System.out.println(pname);
		System.out.println(selltype);
		System.out.println(category);
		System.out.println(price);
		System.out.println(state);
		System.out.println(img_1);
		
		m.addAttribute("pname",pname);
		m.addAttribute("selltype",selltype);
		m.addAttribute("category",category);
		m.addAttribute("price",price);
		m.addAttribute("state",state);
		m.addAttribute("img_1",img_1);
		
		return "home";
	}
	
	@RequestMapping("/person")
	public String person(Model model){	
		System.out.println("일단 시작");
		String name = dao.personList();
		model.addAttribute("name", name);
		return "Personlist";
	}
	
	
}
