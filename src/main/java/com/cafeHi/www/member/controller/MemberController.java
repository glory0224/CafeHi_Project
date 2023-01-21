package com.cafeHi.www.member.controller;





import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		// session ���� ���� 
		 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		    CustomUser userInfo = (CustomUser)principal;
		    userInfo.getMember().setMember_name(member.getMember_name());
		    System.out.println("update name : " + userInfo.getMember().getMember_name());
		
		return "member/cafehi_memberInfo";
		
	}
	
	@PostMapping("/updateMemberContact.do")
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
	
	
	@PostMapping("/updateMemberEmail.do")
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
	
	@PostMapping("/updateMemberAddress.do")
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
	
	@PostMapping("/updateMemberDetailAddress.do")
	public String updateUserDetailAddress(MemberDTO member) {
		memberService.updateMemberDetailAddress(member);
		
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser userInfo = (CustomUser) principal;
		userInfo.getMember().setMember_detail_address(member.getMember_detail_address());
		
		System.out.println("update detail address : " + userInfo.getMember().getMember_detail_address());
		
		return "member/cafehi_memberInfo";
	}
	
	// ȸ�� ���� 
	@PostMapping("/deleteMember.do")
	public String deleteUser(MemberDTO member, HttpSession session, HttpServletRequest request) {
		String MemberId = member.getMember_id();
		String MemberPw = member.getMember_pw();
		
		  Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		  CustomUser userInfo = (CustomUser) principal;
	    String securityId = userInfo.getUsername();
		String securityPw = userInfo.getMember().getMember_pw();
		System.out.println("security Id : " + securityId);
		System.out.println("member Id : " + MemberId);		
		System.out.println("member Pw : " + MemberPw);
		System.out.println("security password : " +  securityPw);
		
		System.out.println(MemberId.equals(securityId));
		System.out.println(pwdEncoder.matches(MemberPw, securityPw));
		
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
		
		System.out.println("pageNum : " + cri.getPageNum());
		System.out.println("keyword : " + cri.getKeyword());
		System.out.println("amount : " + cri.getAmount());
		
		Map<String, Object> auth = new HashMap();
		
		auth.put("auth", "ROLE_USER");
		auth.put("cri", cri);
		
		String roleName = "ROLE_USER";
		
		List<MemberDTO> memberList = memberService.getMemberList(auth);
		
		for(MemberDTO mem : memberList) {
			System.out.println("mem_code" + mem.getMember_code());
		}
		
		int total = memberService.getMemberNum(cri);
		
		PageDTO pageDTO = new PageDTO(cri, total);
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("memberList", memberList);
		
		
		return "admin/cafehi_adminMemberList";
		
	}
	
//	@GetMapping("/MemberList.do")
//	public String SearchQnAList(MemberDTO member, CriteriaDTO cri, Model model) {
//				
//		int total = qnaService.getQnANum(cri);
//		
//		PageDTO pageDTO = new PageDTO(cri, total);
//		System.out.println("page�� cri�� pageNum : " + pageDTO.getCri().getPageNum());
//		System.out.println("page�� cri�� amount : " + pageDTO.getCri().getAmount());
//		System.out.println("page�� cri�� keyword : " + pageDTO.getCri().getKeyword());
//		model.addAttribute("pageDTO", pageDTO);
//		model.addAttribute("qnaList", qnaService.getQnAList(cri));
//		
//		
//			
//		return "cafehi_QnA_board";
//	}
//	
	
	
}
