package com.cafeHi.www.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InfoController {
	
	// ���� ���� ������
	
	@RequestMapping("user/info.do") 
	public String UserInfo(HttpServletRequest request, HttpSession session) { // �α��� ���� üũ 
		String sessionId = (String)session.getAttribute("UserId"); 
	  
	  if(sessionId == null) {
		  request.setAttribute("msg", "�α��� �� �̿��ϼ���."); request.setAttribute("url","login.do"); 
		  	
		  	return "alert"; 
		  }else {
	  
		  return "cafehi_userInfo"; 
	  
	  }
	}
	 
	
	
	// ���� ���� ���� ������
	@RequestMapping("user/infoUpdate.do")
	public String UserInfoUpdate(HttpServletRequest request, HttpSession session) {
		// �α��� ���� üũ 
				String sessionId = (String)session.getAttribute("UserId");
				if(sessionId == null) {
					request.setAttribute("msg", "�α��� �� �̿��ϼ���.");
					request.setAttribute("url", "login.do");
					return "alert";
				}else {
		return "cafehi_userUpdate";
				}
	}
}
