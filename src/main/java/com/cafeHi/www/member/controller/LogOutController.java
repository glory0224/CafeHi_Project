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
			// HttpSession�� �����ϸ� ���� HttpSession�� ��ȯ�ϰ� �������� ������ ������ �������� �ʰ� �׳� null ��ȯ
			HttpSession session = request.getSession(false);
			
			if(session != null) {
				session.invalidate();
				request.setAttribute("msg", "�α׾ƿ��� �Ϸ�Ǿ����ϴ�.");
				request.setAttribute("url", "login.do");
				return "alert"; // jsp�� �̿��ؼ� alert ��� �̿�
			}
			
			return null;
			
			
			
	}
	

}
