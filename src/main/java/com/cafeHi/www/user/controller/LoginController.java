package com.cafeHi.www.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafeHi.www.user.dto.UserDTO;
import com.cafeHi.www.user.service.UserService;

@Controller
@RequestMapping("/all/*")
public class LoginController {

	@Autowired
	private UserService userService;
	
	

	// Get ��û
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginView(HttpServletRequest request, HttpSession session) {
		
		//�̹� �α����� ���� ó�� 
		String sessionId = (String)session.getAttribute("UserId");
		if(sessionId != null) {
			request.setAttribute("msg", "�̹� �α��� �Ǿ� �ֽ��ϴ�.");
			request.setAttribute("url", "/cafeHi/");
			return "alert";
		}else {
			
			// �α��� ���� ���
			return "all/cafehi_login";
		}
		
	}

	// Post ��û
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(UserDTO user, HttpServletRequest request, HttpSession session) throws Exception {

		if (user != null) {

			String find_id = user.getUser_id();
			UserDTO getUser = userService.getUserId(find_id);
			System.out.println(user.getUser_pw());
			System.out.println("������ ���̵� :" + find_id);
			
			/*
			 * if (getUser == null) { request.setAttribute("msg", "������ �������� �ʽ��ϴ�.");
			 * request.setAttribute("url", "login.do"); return "alert"; // id�� üũ�ϴ� ������ ���۵ǰ�
			 * �ϰ� �ʹ�. ������ �ӽ� �������� ������ null�� ���Ҵ�. �� �ȵ��ư���? } else
			 */ 
			
			
			if (!user.getUser_id().equals(getUser.getUser_id()) || !getUser.getUser_pw().equals(getUser.getUser_pw())) {
				
				request.setAttribute("msg", "���̵� �Ǵ� ��й�ȣ�� Ȯ���ϼ���");
				request.setAttribute("url", "login.do");
				return "alert";

			} else {
				System.out.println("������ ���� �̸� : " + getUser.getUser_name());
				System.out.println("������ ���� ��й�ȣ : " + getUser.getUser_pw());
				session.setAttribute("UserSeq", getUser.getUser_seq());
				session.setAttribute("UserId", getUser.getUser_id());
				session.setAttribute("UserName", getUser.getUser_name());
				session.setAttribute("UserContact", getUser.getUser_contact());
				session.setAttribute("UserEmail", getUser.getUser_email());
				session.setAttribute("UserRoadAddress", getUser.getUser_road_address());
				session.setAttribute("UserJibunAddress", getUser.getUser_jibun_address());
				session.setAttribute("UserDetailAddress", getUser.getUser_detail_address());
				return "redirect:/"; // viewResolver�� �̿��ϸ� WEB-INF�� ��� �����Ǳ� ������ �ٷ� �̵���Ų��.

				 } 
			
		} else {
			return "cafehi_login";
		}
	}

}
