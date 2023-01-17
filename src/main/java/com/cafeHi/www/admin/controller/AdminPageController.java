package com.cafeHi.www.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminPageController {
	
	@RequestMapping("/adminPage.do")
	public String adminPage() {
		
		return "admin/cafehi_adminPage";
	}
	
	@RequestMapping("/adminInfoPage.do")
	public String adminInfoPage() {
		
		return "admin/cafehi_adminInfo";
	}
	
	@RequestMapping("/adminInfoUpdatePage.do")
	public String adminInfoUpdatePage() {
		
		return "admin/cafehi_adminInfoUpdate";
	}
	
	@RequestMapping("/adminDeletePage.do")
	public String adminDeletePage() {
		return "admin/cafehi_adminDelete";
	}
	
	@RequestMapping("/adminSignUpPage.do")
	public String adminSignUpPage() {
		return "admin/cafehi_adminSignUp";
	}
	
	
	@RequestMapping("/adminMemberListPage.do")
	public String adminMemberListPage() {
		return "admin/cafehi_adminMemberList";
	}
	
	@RequestMapping("/adminMemberBoardPage.do")
	public String adminMemberBoardPage() {
		return "admin/cafehi_adminMemberBoard";
	}
	
	@RequestMapping("/adminBoardPage.do")
	public String adminBoardPage() {
		return "admin/cafehi_adminBoard";
	}
	
}
