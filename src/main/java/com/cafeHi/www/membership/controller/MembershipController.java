package com.cafeHi.www.membership.controller;


import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.cafeHi.www.member.dto.CustomUser;
import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.membership.dto.MembershipDTO;
import com.cafeHi.www.membership.service.MembershipService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
public class MembershipController {
	
	private final MembershipService membershipService;
	
	
	
	@GetMapping("/myMembership.do")
	public String myMembershipView(Model model) {
		// 세션 정보 
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser userInfo = (CustomUser) principal;
		MemberDTO mem = userInfo.getMember();
		
		
		int member_code = mem.getMember_code();
		
		MembershipDTO myMembership = membershipService.getMembership(member_code);
		
		model.addAttribute("membershipGrade",myMembership.getMembership_grade());
		model.addAttribute("membershipPoint",myMembership.getMembership_point());
		
		
		return "member/cafehi_myMembership";
		
	}
	
	
	
}
