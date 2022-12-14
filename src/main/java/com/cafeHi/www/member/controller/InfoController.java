package com.cafeHi.www.member.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/*")
public class InfoController {
	
	// ���� ���� ������
	
	@RequestMapping("/info.do") 
	public String UserInfoView() { 
		
		return "member/cafehi_userInfo";
		
	}
	 
	
	
	// ���� ���� ���� ������
	@RequestMapping("/infoUpdate.do")
	public String UserInfoUpdateView() {
		
		return "member/cafehi_userUpdate";
	}
}
