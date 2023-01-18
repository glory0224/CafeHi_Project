package com.cafeHi.www.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageAdminController {
	
	// 관리자 페이지
	
	@RequestMapping("/AdminPage.do")
	public String adminPage() {
		
		return "admin/cafehi_adminPage";
	}
	
	@RequestMapping("/AdminInfoPage.do")
	public String adminInfoPage() {
		
		return "admin/cafehi_adminInfo";
	}
	
	@RequestMapping("/AdminInfoUpdatePage.do")
	public String adminInfoUpdatePage() {
		
		return "admin/cafehi_adminInfoUpdate";
	}
	
	@RequestMapping("/AdminDeletePage.do")
	public String adminDeletePage() {
		return "admin/cafehi_adminDelete";
	}
	
	@RequestMapping("/AdminSignUpPage.do")
	public String adminSignUpPage() {
		return "admin/cafehi_adminSignUp";
	}
	
	
	@RequestMapping("/MemberListPage.do")
	public String adminMemberListPage() {
		return "admin/cafehi_adminMemberList";
	}
	
	@RequestMapping("/MemberBoardPage.do")
	public String adminMemberBoardPage() {
		return "admin/cafehi_adminMemberBoard";
	}
	
	@RequestMapping("/AdminBoardPage.do")
	public String adminBoardPage() {
		return "admin/cafehi_adminBoard";
	}

}
