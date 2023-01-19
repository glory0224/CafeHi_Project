package com.cafeHi.www.member.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class LoginController {




	// Get ��û
	@GetMapping("/login.do")
	public String loginView(String error, String logout, Model model) {

		log.info("error : " + error);
		log.info("logout : " + logout);

		if (error != null) {
			model.addAttribute("msg", "���̵� �Ǵ� ��й�ȣ�� Ȯ�����ּ���!");
			model.addAttribute("url", "login.do");
			return "alert";
		}

		if (logout != null) {
			
			model.addAttribute("msg", "�α׾ƿ� �Ǿ����ϴ�!");
			model.addAttribute("url", "/cafeHi/");
			return "alert";
		}

		return "cafehi_login";
	}

	// Post ��û (������ ��ť��Ƽ ���)


}
