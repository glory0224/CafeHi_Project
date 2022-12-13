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
	
	

	// Get 요청
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginView(HttpServletRequest request, HttpSession session) {
		
		//이미 로그인한 계정 처리 
		String sessionId = (String)session.getAttribute("UserId");
		if(sessionId != null) {
			request.setAttribute("msg", "이미 로그인 되어 있습니다.");
			request.setAttribute("url", "/cafeHi/");
			return "alert";
		}else {
			
			// 로그인 안한 경우
			return "all/cafehi_login";
		}
		
	}

	// Post 요청
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(UserDTO user, HttpServletRequest request, HttpSession session) throws Exception {

		if (user != null) {

			String find_id = user.getUser_id();
			UserDTO getUser = userService.getUserId(find_id);
			System.out.println(user.getUser_pw());
			System.out.println("가져온 아이디 :" + find_id);
			
			/*
			 * if (getUser == null) { request.setAttribute("msg", "계정이 존재하지 않습니다.");
			 * request.setAttribute("url", "login.do"); return "alert"; // id를 체크하는 로직이 동작되게
			 * 하고 싶다. 지금은 임시 방편으로 위에서 null로 막았다. 왜 안돌아가지? } else
			 */ 
			
			
			if (!user.getUser_id().equals(getUser.getUser_id()) || !getUser.getUser_pw().equals(getUser.getUser_pw())) {
				
				request.setAttribute("msg", "아이디 또는 비밀번호를 확인하세요");
				request.setAttribute("url", "login.do");
				return "alert";

			} else {
				System.out.println("가져온 유저 이름 : " + getUser.getUser_name());
				System.out.println("가져온 계정 비밀번호 : " + getUser.getUser_pw());
				session.setAttribute("UserSeq", getUser.getUser_seq());
				session.setAttribute("UserId", getUser.getUser_id());
				session.setAttribute("UserName", getUser.getUser_name());
				session.setAttribute("UserContact", getUser.getUser_contact());
				session.setAttribute("UserEmail", getUser.getUser_email());
				session.setAttribute("UserRoadAddress", getUser.getUser_road_address());
				session.setAttribute("UserJibunAddress", getUser.getUser_jibun_address());
				session.setAttribute("UserDetailAddress", getUser.getUser_detail_address());
				return "redirect:/"; // viewResolver를 이용하면 WEB-INF로 경로 설정되기 때문에 바로 이동시킨다.

				 } 
			
		} else {
			return "cafehi_login";
		}
	}

}
