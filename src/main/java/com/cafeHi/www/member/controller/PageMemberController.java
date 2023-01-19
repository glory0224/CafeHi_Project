package com.cafeHi.www.member.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageMemberController {
	
	// 회원
	
	// 마이페이지 
		@GetMapping("/myPage.do")
		public String MyPageView() {
			return "member/cafehi_myPage";
			
		}
	
	// 계정 정보 페이지
	
	@GetMapping("/info.do") 
	public String MemberInfoView() { 
		
		return "member/cafehi_memberInfo";
		
	}
	 
	
	
	// 계정 정보 수정 페이지
	@GetMapping("/infoUpdate.do")
	public String MemberInfoUpdateView() {
		
		return "member/cafehi_memberUpdate";
	}
	
	// 계정 탈퇴 페이지
	@GetMapping("/infoDelete.do")
	public String MemberInfoDeleteView() {
		return "member/cafehi_memberDelete";
		
	}
	

	
}
