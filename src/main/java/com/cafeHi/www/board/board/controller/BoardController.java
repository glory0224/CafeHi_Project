package com.cafeHi.www.board.board.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("/Introduce.do")
	public String Introduce() {
		
		return "cafehi_introduce";
		
	}
	
	@RequestMapping("/Membership.do")
	public String Membership() {
		return "cafehi_membership";
		
	}
	
	@RequestMapping("/Event.do")
	public String Event() {
		return "cafehi_event";
		
	}
	
	@RequestMapping("/Place.do")
	public String Place() {
		return "cafehi_place";
		
	}
	

	@RequestMapping("/Menu.do")
	public String Menu() {
		
		return "cafehi_menu";
	}
}
