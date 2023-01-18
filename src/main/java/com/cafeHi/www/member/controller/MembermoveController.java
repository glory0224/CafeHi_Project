package com.cafeHi.www.member.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MembermoveController {
	
	// ȸ��
	
	// ���������� 
		@RequestMapping("/myPage.do")
		public String MyPageView() {
			return "member/cafehi_myPage";
			
		}
	
	// ���� ���� ������
	
	@RequestMapping("/info.do") 
	public String MemberInfoView() { 
		
		return "member/cafehi_memberInfo";
		
	}
	 
	
	
	// ���� ���� ���� ������
	@RequestMapping("/infoUpdate.do")
	public String MemberInfoUpdateView() {
		
		return "member/cafehi_memberUpdate";
	}
	
	// ���� Ż�� ������
	@RequestMapping("/infoDelete.do")
	public String MemberInfoDeleteView() {
		return "member/cafehi_memberDelete";
		
	}
	

	
}
