package com.cafeHi.www.user.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafeHi.www.user.service.UserService;


@Controller
public class SignUpController {
		
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public String signUpView() {
		
		return "cafehi_signup";
	}
	
	// 아이디 중복체크
	@RequestMapping("/IdCheck.do")
	public @ResponseBody int IdCheck(String user_id) {
		int result = userService.idCheck(user_id);
		return result;
	}
	
	

}
