package com.cafeHi.www.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AccountController {
	
	// ���̵� ã�� ������
	@RequestMapping(value = "/idSearch.do", method = RequestMethod.GET)
	public String idSearchView() {
		
		return "cafehi_idSearch";
	}
	

	

}
