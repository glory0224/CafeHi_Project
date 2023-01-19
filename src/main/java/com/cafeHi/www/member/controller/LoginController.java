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




	// Get 요청
	@GetMapping("/login.do")
	public String loginView(String error, String logout, Model model) {

		log.info("error : " + error);
		log.info("logout : " + logout);

		if (error != null) {
			model.addAttribute("msg", "아이디 또는 비밀번호를 확인해주세요!");
			model.addAttribute("url", "login.do");
			return "alert";
		}

		if (logout != null) {
			
			model.addAttribute("msg", "로그아웃 되었습니다!");
			model.addAttribute("url", "/cafeHi/");
			return "alert";
		}

		return "cafehi_login";
	}

	// Post 요청 (스프링 시큐리티 사용)


}
