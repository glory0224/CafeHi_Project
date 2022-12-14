package com.cafeHi.www.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InfoController {
	
	// 계정 정보 페이지
	
	@RequestMapping("user/info.do") 
	public String UserInfo(HttpServletRequest request, HttpSession session) { // 로그인 여부 체크 
		String sessionId = (String)session.getAttribute("UserId"); 
	  
	  if(sessionId == null) {
		  request.setAttribute("msg", "로그인 후 이용하세요."); request.setAttribute("url","login.do"); 
		  	
		  	return "alert"; 
		  }else {
	  
		  return "cafehi_userInfo"; 
	  
	  }
	}
	 
	
	
	// 계정 정보 수정 페이지
	@RequestMapping("user/infoUpdate.do")
	public String UserInfoUpdate(HttpServletRequest request, HttpSession session) {
		// 로그인 여부 체크 
				String sessionId = (String)session.getAttribute("UserId");
				if(sessionId == null) {
					request.setAttribute("msg", "로그인 후 이용하세요.");
					request.setAttribute("url", "login.do");
					return "alert";
				}else {
		return "cafehi_userUpdate";
				}
	}
}
