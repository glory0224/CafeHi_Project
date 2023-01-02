package com.cafeHi.www.membership.controller;


import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafeHi.www.member.dto.CustomUser;
import com.cafeHi.www.membership.dto.myMembershipDTO;
import com.cafeHi.www.membership.service.MembershipService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MembershipController {
	
	private final MembershipService membershipService;
	
	
	
	@RequestMapping("/myMembership.do")
	public String myMembershipView(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser userInfo = (CustomUser) principal;
	    String member_id = userInfo.getUsername();
		System.out.println(member_id);
		myMembershipDTO myMembership = membershipService.getMembership(member_id);
		//System.out.println(myMembership.getMember().getMember_id());
		System.out.println(myMembership.getMembership().getMembership_grade());
		System.out.println(myMembership.getMembership_point());
		model.addAttribute("membershipGrade",myMembership.getMembership().getMembership_grade());
		model.addAttribute("membershipPoint", myMembership.getMembership_point());
		
		return "member/cafehi_myMembership";
		
	}
	
}
