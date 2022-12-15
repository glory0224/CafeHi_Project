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
	 * // Get ��û
	 * 
	 * @RequestMapping(value = "/login.do", method = RequestMethod.GET) public
	 * String loginView(HttpServletRequest request, HttpSession session) {
	 * 
	 * //�̹� �α����� ���� ó�� String sessionId = (String)session.getAttribute("UserId");
	 * if(sessionId != null) { request.setAttribute("msg", "�̹� �α��� �Ǿ� �ֽ��ϴ�.");
	 * request.setAttribute("url", "/cafeHi/"); return "alert"; }else {
	 * 
	 * // �α��� ���� ��� return "all/cafehi_login"; }
	 * 
	 * }
	 */
	
	// Get ��û
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

	// Post ��û
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(MemberDTO member, HttpServletRequest request, HttpSession session) throws Exception {

		if (member != null) {

			/*
			 * String find_id = member.getMember_id(); MemberDTO getMember =
			 * memberService.getMemberId(find_id);
			 * System.out.println(member.getMember_pw()); System.out.println("������ ���̵� :" +
			 * find_id);
			 */
			String member_id = member.getMember_id();
			MemberDTO getMember = memberService.readMember(member_id);
			
			log.info("getMember : " + getMember);
			/*
			 * if (getUser == null) { request.setAttribute("msg", "������ �������� �ʽ��ϴ�.");
			 * request.setAttribute("url", "login.do"); return "alert"; // id�� üũ�ϴ� ������ ���۵ǰ�
			 * �ϰ� �ʹ�. ������ �ӽ� �������� ������ null�� ���Ҵ�. �� �ȵ��ư���? } else
			 */ 
			
			
/*			if (!member.getMember_id().equals(getMember.getMember_id()) || !member.getMember_pw().equals(getMember.getMember_pw())) {
				
				request.setAttribute("msg", "���̵� �Ǵ� ��й�ȣ�� Ȯ���ϼ���");
				request.setAttribute("url", "login.do");
				return "alert";

			} else {
				*/
			log.info("������ ���� �̸� : " + getMember.getMember_name());
			log.info("������ ���� ��й�ȣ : " + getMember.getMember_pw());
				session.setAttribute("MemberSeq", getMember.getMember_seq());
				session.setAttribute("MemberId", getMember.getMember_id());
				session.setAttribute("MemberName", getMember.getMember_name());
				session.setAttribute("MemberContact", getMember.getMember_contact());
				session.setAttribute("MemberEmail", getMember.getMember_email());
				session.setAttribute("MemberRoadAddress", getMember.getMember_road_address());
				session.setAttribute("MemberJibunAddress", getMember.getMember_jibun_address());
				session.setAttribute("MemberDetailAddress", getMember.getMember_detail_address());
				return "redirect:/"; // viewResolver�� �̿��ϸ� WEB-INF�� ��� �����Ǳ� ������ �ٷ� �̵���Ų��.

			//}  
			
		} else {
			return "all/cafehi_login";
		}
	}

}
