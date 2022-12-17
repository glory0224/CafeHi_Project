package com.cafeHi.www.member.controller;





import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafeHi.www.member.dto.CustomUser;
import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.member.service.MemberService;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	// ȸ�� ����

//	@RequestMapping("/updateMemberId.do")
//	public String updateUserId(MemberDTO member) {
//		
//		memberService.updateMemberId(member);
//		
//		// session ���� ���� 
//		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		CustomUser userInfo = (CustomUser) principal;
//		userInfo.getMember().setMember_id(member.getMember_id());
//		System.out.println("update id : " + userInfo.getMember().getMember_id());
//		
//		return "member/cafehi_memberInfo";
//		
//	}
	
	@RequestMapping("/updateMemberName.do")
	public String updateUserName(MemberDTO member) {
		// db ���� ����
		memberService.updateMemberName(member);
		
		// session ���� ���� 
		 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		    CustomUser userInfo = (CustomUser)principal;
		    userInfo.getMember().setMember_name(member.getMember_name());
		    System.out.println("update name : " + userInfo.getMember().getMember_name());
		
		return "member/cafehi_memberInfo";
		
	}
	
	@RequestMapping("/updateMemberContact.do")
	public String updateUserContact(MemberDTO member) {
		// db ���� ���� 
		memberService.updateMemberContact(member);
		
		// session ���� ���� 
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser userInfo = (CustomUser) principal;
		userInfo.getMember().setMember_contact(member.getMember_contact());
		
		System.out.println("update contact : " + userInfo.getMember().getMember_contact());
		
		return "member/cafehi_memberInfo";
	}
	
	
	@RequestMapping("/updateMemberEmail.do")
	public String updateUserEmail(MemberDTO member) {
		
		// db ���� ���� 
		memberService.updateMemberEmail(member);
		
		// session ���� ���� 
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser userInfo = (CustomUser) principal;
		userInfo.getMember().setMember_email(member.getMember_email());

		System.out.println("update email : " + userInfo.getMember().getMember_contact());
		
		return "member/cafehi_memberInfo";
	}
	
	@RequestMapping("/updateMemberAddress.do")
	public String updateUserAddress(MemberDTO member) {
		
		// db ���� ���� 
		memberService.updateMemberAddress(member);
		
		// session ���� ���� 
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser userInfo = (CustomUser) principal;
		userInfo.getMember().setMember_road_address(member.getMember_road_address());
		userInfo.getMember().setMember_jibun_address(member.getMember_jibun_address());

		System.out.println("update road address : " + userInfo.getMember().getMember_road_address());
		System.out.println("update jibun address : " + userInfo.getMember().getMember_road_address());
		
		
		return "member/cafehi_memberInfo";
	}
	
	@RequestMapping("/updateMemberDetailAddress.do")
	public String updateUserDetailAddress(MemberDTO member) {
		memberService.updateMemberDetailAddress(member);
		
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser userInfo = (CustomUser) principal;
		userInfo.getMember().setMember_detail_address(member.getMember_detail_address());
		
		System.out.println("update detail address : " + userInfo.getMember().getMember_detail_address());
		
		return "member/cafehi_memberInfo";
	}
	
	// ȸ�� ���� 
	@RequestMapping("/deleteMember.do")
	public String deleteUser(MemberDTO member, HttpSession session, HttpServletRequest request) {
		
		memberService.deleteMember(member);
		session.invalidate();
		SecurityContextHolder.getContext().setAuthentication(null);
		
		request.setAttribute("msg", "������ �Ϸ�Ǿ����ϴ�!");
		request.setAttribute("url", "/cafeHi/");
		
		return "alert";
		
	}
	
	
}
