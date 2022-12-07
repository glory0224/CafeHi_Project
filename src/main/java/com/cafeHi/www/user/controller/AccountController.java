package com.cafeHi.www.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AccountController {
	
	// 아이디 찾기 페이지
	@RequestMapping(value = "/idSearch.do", method = RequestMethod.GET)
	public String idSearchView() {
		
		return "cafehi_idSearch";
	}
	

	

}
