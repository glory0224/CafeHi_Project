package com.cafeHi.www.member.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/*")
public class InfoController {
	
	// 계정 정보 페이지
	
	@RequestMapping("/info.do") 
	public String UserInfoView() { 
		
		return "member/cafehi_userInfo";
		
	}
	 
	
	
	// 계정 정보 수정 페이지
	@RequestMapping("/infoUpdate.do")
	public String UserInfoUpdateView() {
		
		return "member/cafehi_userUpdate";
	}
}
