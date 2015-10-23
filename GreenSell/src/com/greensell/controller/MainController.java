package com.greensell.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String home(){
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
