package com.cafeHi.www.member.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LogOutController {
	
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logOut(HttpServletRequest request, HttpServletResponse response) throws Exception {
			// HttpSession이 존재하면 현재 HttpSession을 반환하고 존재하지 않으면 새로이 생성하지 않고 그냥 null 반환
			HttpSession session = request.getSession(false);
			
			if(session != null) {
				session.invalidate();
				request.setAttribute("msg", "로그아웃이 완료되었습니다.");
				request.setAttribute("url", "login.do");
				return "alert"; // jsp를 이용해서 alert 기능 이용
			}
			
			return null;
			
			
			
	}
	

}
