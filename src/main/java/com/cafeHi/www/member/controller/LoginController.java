package com.cafeHi.www.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.member.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class LoginController {

	@Autowired
	private MemberService memberService;
	
	

	/*
	 * // Get 요청
	 * 
	 * @RequestMapping(value = "/login.do", method = RequestMethod.GET) public
	 * String loginView(HttpServletRequest request, HttpSession session) {
	 * 
	 * //이미 로그인한 계정 처리 String sessionId = (String)session.getAttribute("UserId");
	 * if(sessionId != null) { request.setAttribute("msg", "이미 로그인 되어 있습니다.");
	 * request.setAttribute("url", "/cafeHi/"); return "alert"; }else {
	 * 
	 * // 로그인 안한 경우 return "all/cafehi_login"; }
	 * 
	 * }
	 */
	
	// Get 요청
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginView(String error, String logout, Model model) {
		
		log.info("error : " + error);
		log.info("logout : " + logout);
		
		if (error != null ) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		
		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
		
		return "cafehi_login";
	}

	// Post 요청
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(MemberDTO member, HttpServletRequest request, HttpSession session) throws Exception {

		if (member != null) {

			/*
			 * String find_id = member.getMember_id(); MemberDTO getMember =
			 * memberService.getMemberId(find_id);
			 * System.out.println(member.getMember_pw()); System.out.println("가져온 아이디 :" +
			 * find_id);
			 */
			String member_id = member.getMember_id();
			MemberDTO getMember = memberService.readMember(member_id);
			
			log.info("getMember : " + getMember);
			/*
			 * if (getUser == null) { request.setAttribute("msg", "계정이 존재하지 않습니다.");
			 * request.setAttribute("url", "login.do"); return "alert"; // id를 체크하는 로직이 동작되게
			 * 하고 싶다. 지금은 임시 방편으로 위에서 null로 막았다. 왜 안돌아가지? } else
			 */ 
			
			
/*			if (!member.getMember_id().equals(getMember.getMember_id()) || !member.getMember_pw().equals(getMember.getMember_pw())) {
				
				request.setAttribute("msg", "아이디 또는 비밀번호를 확인하세요");
				request.setAttribute("url", "login.do");
				return "alert";

			} else {
				*/
			log.info("가져온 유저 이름 : " + getMember.getMember_name());
			log.info("가져온 계정 비밀번호 : " + getMember.getMember_pw());
				session.setAttribute("MemberSeq", getMember.getMember_seq());
				session.setAttribute("MemberId", getMember.getMember_id());
				session.setAttribute("MemberName", getMember.getMember_name());
				session.setAttribute("MemberContact", getMember.getMember_contact());
				session.setAttribute("MemberEmail", getMember.getMember_email());
				session.setAttribute("MemberRoadAddress", getMember.getMember_road_address());
				session.setAttribute("MemberJibunAddress", getMember.getMember_jibun_address());
				session.setAttribute("MemberDetailAddress", getMember.getMember_detail_address());
				return "redirect:/"; // viewResolver를 이용하면 WEB-INF로 경로 설정되기 때문에 바로 이동시킨다.

			//}  
			
		} else {
			return "all/cafehi_login";
		}
	}

}
