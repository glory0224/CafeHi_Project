package com.cafeHi.www.member.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageMemberController {
	
	// ȸ��
	
	// ���������� 
		@GetMapping("/myPage.do")
		public String MyPageView() {
			return "member/cafehi_myPage";
			
		}
	
	// ���� ���� ������
	
	@GetMapping("/info.do") 
	public String MemberInfoView() { 
		
		return "member/cafehi_memberInfo";
		
	}
	 
	
	
	// ���� ���� ���� ������
	@GetMapping("/infoUpdate.do")
	public String MemberInfoUpdateView() {
		
		return "member/cafehi_memberUpdate";
	}
	
	// ���� Ż�� ������
	@GetMapping("/infoDelete.do")
	public String MemberInfoDeleteView() {
		return "member/cafehi_memberDelete";
		
	}
	

	
}
