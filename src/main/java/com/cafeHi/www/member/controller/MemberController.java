package com.cafeHi.www.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.member.service.MemberService;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	
	// ȸ�� ����
	// ���ݰ� ���� �������� �Ѳ����� ������Ʈ ó���� �� ���, �Ѳ����� �� �Է¹޾ƾ� ������ �߻����� �ʴ´�. 
	// �׷��� Ȥ�� null�� ����ϸ� ���� ������ ��� �����Ͽ� mybatis���� jdbcType�� ����Ͽ� null�� ��� �ϰԲ� �ϴ� ����� �����ߴ�.
	// ������ �ᱹ database�� null�� ���� ���� �״�� �ִ°��� �ƴ϶� ����� ������ ����� �������, �������� �ʴ� ������ ������ �����ͷ� �ִ� ����� �𸣰ڴ�. 
	// ���� �׳� view �κп��� ���� �������ֵ��� �ϴ� ������� �����ϰ��� �Ѵ�. (22/11/29)
	// -> mybatis-config.xml ���Ͽ� settings �±׷� null ó�� �ϴ� ����� ã�Ƴ´�. 
//	@RequestMapping("/updateUser.do")
//	public String updateUser(UserDTO user, HttpSession session) {
//		System.out.println("���� ���� �� : " + user.getUser_name());
//		userService.updateUser(user);
//		
//		System.out.println("���� ���� �� " + user.getUser_name());
//		
//		session.setAttribute("UserId", user.getUser_id());
//		session.setAttribute("UserName", user.getUser_name());
//		session.setAttribute("UserContact", user.getUser_contact());
//		session.setAttribute("UserRoadAddress", user.getUser_road_address());
//		session.setAttribute("UserJibunAddress", user.getUser_jibun_address());
//		session.setAttribute("UserDetailAddress", user.getUser_detail_address());
//		
//		return "cafehi_userInfo";
//	}
	
	
	@RequestMapping("/updateMemberId.do")
	public String updateUserId(MemberDTO member, HttpSession session) {
		
		memberService.updateMemberId(member);
		member = memberService.getMember(member);
		session.setAttribute("MemberId", member.getMember_id());
		session.setAttribute("MemberName", member.getMember_name());
		session.setAttribute("MemberContact", member.getMember_contact());
		session.setAttribute("MemberEmail", member.getMember_email());
		session.setAttribute("MemberRoadAddress", member.getMember_road_address());
		session.setAttribute("MemberJibunAddress", member.getMember_jibun_address());
		session.setAttribute("MemberDetailAddress", member.getMember_detail_address());
		return "cafehi_userInfo";
		
	}
	
	@RequestMapping("/updateMemberName.do")
	public String updateUserName(MemberDTO member, HttpSession session) {
		memberService.updateMemberName(member);
		member = memberService.getMember(member);
		session.setAttribute("MemberId", member.getMember_id());
		session.setAttribute("MemberName", member.getMember_name());
		session.setAttribute("MemberContact", member.getMember_contact());
		session.setAttribute("MemberEmail", member.getMember_email());
		session.setAttribute("MemberRoadAddress", member.getMember_road_address());
		session.setAttribute("MemberJibunAddress", member.getMember_jibun_address());
		session.setAttribute("MemberDetailAddress", member.getMember_detail_address());
		return "cafehi_userInfo";
		
	}
	
	@RequestMapping("/updateMemberContact.do")
	public String updateUserContact(MemberDTO member, HttpSession session) {
		memberService.updateMemberContact(member);
		member = memberService.getMember(member);
		session.setAttribute("MemberId", member.getMember_id());
		session.setAttribute("MemberName", member.getMember_name());
		session.setAttribute("MemberContact", member.getMember_contact());
		session.setAttribute("MemberEmail", member.getMember_email());
		session.setAttribute("MemberRoadAddress", member.getMember_road_address());
		session.setAttribute("MemberJibunAddress", member.getMember_jibun_address());
		session.setAttribute("MemberDetailAddress", member.getMember_detail_address());
		return "cafehi_userInfo";
	}
	
	@RequestMapping("/updateMemberEmail.do")
	public String updateUserEmail(MemberDTO member, HttpSession session) {
		memberService.updateMemberEmail(member);
		member = memberService.getMember(member);
		session.setAttribute("MemberId", member.getMember_id());
		session.setAttribute("MemberName", member.getMember_name());
		session.setAttribute("MemberContact", member.getMember_contact());
		session.setAttribute("MemberEmail", member.getMember_email());
		session.setAttribute("MemberRoadAddress", member.getMember_road_address());
		session.setAttribute("MemberJibunAddress", member.getMember_jibun_address());
		session.setAttribute("MemberDetailAddress", member.getMember_detail_address());
		return "cafehi_userInfo";
	}
	
	@RequestMapping("/updateMemberAddress.do")
	public String updateUserAddress(MemberDTO member, HttpSession session) {
		memberService.updateMemberAddress(member);
		member = memberService.getMember(member);
		session.setAttribute("MemberId", member.getMember_id());
		session.setAttribute("MemberName", member.getMember_name());
		session.setAttribute("MemberContact", member.getMember_contact());
		session.setAttribute("MemberEmail", member.getMember_email());
		session.setAttribute("MemberRoadAddress", member.getMember_road_address());
		session.setAttribute("MemberJibunAddress", member.getMember_jibun_address());
		session.setAttribute("MemberDetailAddress", member.getMember_detail_address());
		return "cafehi_userInfo";
	}
	
	@RequestMapping("/updateMemberDetailAddress.do")
	public String updateUserDetailAddress(MemberDTO member, HttpSession session) {
		memberService.updateMemberDetailAddress(member);
		member = memberService.getMember(member);
		session.setAttribute("MemberId", member.getMember_id());
		session.setAttribute("MemberName", member.getMember_name());
		session.setAttribute("MemberContact", member.getMember_contact());
		session.setAttribute("MemberEmail", member.getMember_email());
		session.setAttribute("MemberRoadAddress", member.getMember_road_address());
		session.setAttribute("MemberJibunAddress", member.getMember_jibun_address());
		session.setAttribute("MemberDetailAddress", member.getMember_detail_address());
		return "cafehi_userInfo";
	}
	
	// ȸ�� ���� 
	@RequestMapping("/deleteMember.do")
	public String deleteUser(MemberDTO member, HttpSession session, HttpServletRequest request) {
		memberService.deleteMember(member);
		session.invalidate();
		request.setAttribute("msg", "������ �����Ǿ����ϴ�.");
		request.setAttribute("url", "/cafeHi/");
		return "alert"; // jsp�� �̿��ؼ� alert ��� �̿�
		//return "redirect:/";
	}
	
	
}
