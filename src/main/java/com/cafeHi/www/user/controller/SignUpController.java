package com.cafeHi.www.user.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class SignUpController {
		
	
	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public String signUpView() {
		
		return "cafehi_signup";
	}
	
	
	

}
