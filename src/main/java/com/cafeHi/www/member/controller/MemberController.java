package com.cafeHi.www.member.controller;





import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafeHi.www.common.dto.CriteriaDTO;
import com.cafeHi.www.common.dto.PageDTO;
import com.cafeHi.www.member.dto.CustomUser;
import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.member.service.MemberService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService memberService;
	
	
	private final BCryptPasswordEncoder pwdEncoder;
	
	// ȸ�� ����
	
	@PostMapping("/updateMemberName.do")
	public String updateUserName(MemberDTO member) {
		// db ���� ����
		memberService.updateMemberName(member);
		
		// spring security session ���� ���� 
		 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 CustomUser userInfo = (CustomUser)principal;
		 userInfo.getMember().setMember_name(member.getMember_name());
		
		return "member/cafehi_memberInfo";
		
	}
	
	@PostMapping("/updateMemberContact.do")
	public String updateUserContact(MemberDTO member) {
		// db ���� ���� 
		memberService.updateMemberContact(member);
		
		// spring security session ���� ���� 
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser userInfo = (CustomUser) principal;
		userInfo.getMember().setMember_contact(member.getMember_contact());
		
		
		return "member/cafehi_memberInfo";
	}
	
	
	@PostMapping("/updateMemberEmail.do")
	public String updateUserEmail(MemberDTO member) {
		
		// db ���� ���� 
		memberService.updateMemberEmail(member);
		
		// spring security session ���� ���� 
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser userInfo = (CustomUser) principal;
		userInfo.getMember().setMember_email(member.getMember_email());

		
		return "member/cafehi_memberInfo";
	}
	
	@PostMapping("/updateMemberAddress.do")
	public String updateUserAddress(MemberDTO member) {
		
		// db ���� ���� 
		memberService.updateMemberAddress(member);
		
		// spring security session ���� ���� 
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser userInfo = (CustomUser) principal;
		userInfo.getMember().setMember_road_address(member.getMember_road_address());
		userInfo.getMember().setMember_jibun_address(member.getMember_jibun_address());

		
		
		return "member/cafehi_memberInfo";
	}
	
	@PostMapping("/updateMemberDetailAddress.do")
	public String updateUserDetailAddress(MemberDTO member) {
		memberService.updateMemberDetailAddress(member);
		
		// spring security session ���� ���� 
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser userInfo = (CustomUser) principal;
		userInfo.getMember().setMember_detail_address(member.getMember_detail_address());
		
		
		return "member/cafehi_memberInfo";
	}
	
	// ȸ�� ���� 
	@PostMapping("/deleteMember.do")
	public String deleteUser(MemberDTO member, HttpSession session, HttpServletRequest request) {
		
		String MemberId = member.getMember_id();
		String MemberPw = member.getMember_pw();
		
		// spring security session ���� ���� 
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser userInfo = (CustomUser) principal;
	    String securityId = userInfo.getUsername();
		String securityPw = userInfo.getMember().getMember_pw();
		
		// �Է¹��� ���� ������ ���� ���� �� 
		if(MemberId.equals(securityId) && pwdEncoder.matches(MemberPw, securityPw)) {
		
		int member_code = userInfo.getMember().getMember_code();
		memberService.deleteMember(member_code);
		
		session.invalidate();
		SecurityContextHolder.getContext().setAuthentication(null);
		
		request.setAttribute("msg", "������ �Ϸ�Ǿ����ϴ�!");
		request.setAttribute("url", "/cafeHi/");
		
		return "alert";
		
		}else {
			request.setAttribute("msg", "���̵� �Ǵ� ��й�ȣ�� Ȯ�����ּ���!");
			request.setAttribute("url", "/cafeHi/infoDelete.do");
			
			return "alert";
		}
		
	}
	
	// ������ ȸ�� ���� ����Ʈ
	@GetMapping("getMemeberList.do")
	public String getMemberList(MemberDTO member, CriteriaDTO cri, Model model) {
		
		
		String mem_auth = "ROLE_USER";
		
		Map<String, Object> auth = new ConcurrentHashMap<String, Object>();
		
		auth.put("member_auth", mem_auth);
		auth.put("cri", cri);
		
		
		int total = memberService.getMemberNum(mem_auth);
		
		
		PageDTO pageDTO = new PageDTO(cri, total);
		
		List<MemberDTO> memberList = memberService.getMemberList(auth);
		
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("memberList", memberList);
		
		
		return "admin/cafehi_adminMemberList";
		
	}
	
	
	
	
}
