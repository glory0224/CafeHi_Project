package com.cafeHi.www.board.board.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
	
	@GetMapping("/Introduce.do")
	public String Introduce() {
		
		return "cafehi_introduce";
		
	}
	
	@GetMapping("/Membership.do")
	public String Membership() {
		return "cafehi_membership";
		
	}
	
	@GetMapping("/Event.do")
	public String Event() {
		return "cafehi_event";
		
	}
	
	@GetMapping("/Place.do")
	public String Place() {
		return "cafehi_place";
		
	}
	

	@GetMapping("/Menu.do")
	public String Menu() {
		
		return "cafehi_menu";
	}
}
