package com.cafeHi.www.board.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/all/*")
public class BoardController {
	
	@RequestMapping("Introduce.do")
	public String Introduce() {
		
		return "all/cafehi_introduce";
		
	}
	
	@RequestMapping("Membership.do")
	public String Membership() {
		return "all/cafehi_membership";
		
	}
	
	@RequestMapping("/Event.do")
	public String Event() {
		return "all/cafehi_event";
		
	}
	
	@RequestMapping("/Place.do")
	public String Place() {
		return "all/cafehi_place";
		
	}
	
	@RequestMapping("/Menu.do")
	public String Menu() {
		return "all/cafehi_menu";
	}
}
