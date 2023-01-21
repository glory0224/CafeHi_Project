package com.cafeHi.www.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageAdminController {
	
	// ������ ������
	
	@GetMapping("adminPage.do")
	public String adminPage() {
		
		return "admin/cafehi_adminPage";
	}
	
	@GetMapping("adminInfoPage.do")
	public String adminInfoPage() {
		
		return "admin/cafehi_adminInfo";
	}
	
	@GetMapping("adminInfoUpdatePage.do")
	public String adminInfoUpdatePage() {
		
		return "admin/cafehi_adminInfoUpdate";
	}
	
	@GetMapping("adminDeletePage.do")
	public String adminDeletePage() {
		return "admin/cafehi_adminDelete";
	}
	
	@GetMapping("adminSignUpPage.do")
	public String adminSignUpPage() {
		return "admin/cafehi_adminSignUp";
	}
	
	
	@GetMapping("adminMemberBoardPage.do")
	public String adminMemberBoardPage() {
		return "admin/cafehi_adminMemberBoard";
	}
	
	@GetMapping("adminBoardPage.do")
	public String adminBoardPage() {
		return "admin/cafehi_adminBoard";
	}

}
