package com.cafeHi.www.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("admin/index.do")
	public String indexPage() {
		System.out.println("어드민 페이지");
		return "admin/adminMain";
	}
	
}
