package com.cafeHi.www.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageAdminController {
	
	// 관리자 페이지
	
	@GetMapping("/AdminPage.do")
	public String adminPage() {
		
		return "admin/cafehi_adminPage";
	}
	
	@GetMapping("/AdminInfoPage.do")
	public String adminInfoPage() {
		
		return "admin/cafehi_adminInfo";
	}
	
	@GetMapping("/AdminInfoUpdatePage.do")
	public String adminInfoUpdatePage() {
		
		return "admin/cafehi_adminInfoUpdate";
	}
	
	@GetMapping("/AdminDeletePage.do")
	public String adminDeletePage() {
		return "admin/cafehi_adminDelete";
	}
	
	@GetMapping("/AdminSignUpPage.do")
	public String adminSignUpPage() {
		return "admin/cafehi_adminSignUp";
	}
	
	
	@GetMapping("/MemberListPage.do")
	public String adminMemberListPage() {
		return "admin/cafehi_adminMemberList";
	}
	
	@GetMapping("/MemberBoardPage.do")
	public String adminMemberBoardPage() {
		return "admin/cafehi_adminMemberBoard";
	}
	
	@GetMapping("/AdminBoardPage.do")
	public String adminBoardPage() {
		return "admin/cafehi_adminBoard";
	}

}
