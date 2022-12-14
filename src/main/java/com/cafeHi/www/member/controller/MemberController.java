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
	
	
	
	// 회원 수정
	// 지금과 같은 로직으로 한꺼번에 업데이트 처리를 할 경우, 한꺼번에 다 입력받아야 에러가 발생하지 않는다. 
	// 그래서 혹시 null을 허용하면 되지 않을까 라고 생각하여 mybatis에서 jdbcType을 명시하여 null도 허용 하게끔 하는 방법도 생각했다.
	// 하지만 결국 database에 null로 들어온 값을 그대로 넣는것이 아니라 변경된 정보는 변경된 정보대로, 변경하지 않는 정보는 기존의 데이터로 넣는 방법을 모르겠다. 
	// 따라서 그냥 view 부분에서 각각 수정해주도록 하는 방식으로 변경하고자 한다. (22/11/29)
	// -> mybatis-config.xml 파일에 settings 태그로 null 처리 하는 방법을 찾아냈다. 
//	@RequestMapping("/updateUser.do")
//	public String updateUser(UserDTO user, HttpSession session) {
//		System.out.println("로직 실행 전 : " + user.getUser_name());
//		userService.updateUser(user);
//		
//		System.out.println("로직 실행 후 " + user.getUser_name());
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
	
	// 회원 삭제 
	@RequestMapping("/deleteMember.do")
	public String deleteUser(MemberDTO member, HttpSession session, HttpServletRequest request) {
		memberService.deleteMember(member);
		session.invalidate();
		request.setAttribute("msg", "계정이 삭제되었습니다.");
		request.setAttribute("url", "/cafeHi/");
		return "alert"; // jsp를 이용해서 alert 기능 이용
		//return "redirect:/";
	}
	
	
}
