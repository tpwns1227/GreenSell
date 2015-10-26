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
	
	@RequestMapping("/sell_write_form")
	public String view(){
		return "/sell/sell_write_form";
	}
	
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
	
	
}
