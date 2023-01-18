package com.cafeHi.www.member.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MembermoveController {
	
	// 회원
	
	// 마이페이지 
		@RequestMapping("/myPage.do")
		public String MyPageView() {
			return "member/cafehi_myPage";
			
		}
	
	// 계정 정보 페이지
	
	@RequestMapping("/info.do") 
	public String MemberInfoView() { 
		
		return "member/cafehi_memberInfo";
		
	}
	 
	
	
	// 계정 정보 수정 페이지
	@RequestMapping("/infoUpdate.do")
	public String MemberInfoUpdateView() {
		
		return "member/cafehi_memberUpdate";
	}
	
	// 계정 탈퇴 페이지
	@RequestMapping("/infoDelete.do")
	public String MemberInfoDeleteView() {
		return "member/cafehi_memberDelete";
		
	}
	

	
}
