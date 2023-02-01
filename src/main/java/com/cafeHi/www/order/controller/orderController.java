package com.cafeHi.www.order.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafeHi.www.member.service.MemberService;
import com.cafeHi.www.menu.dto.MenuDTO;
import com.cafeHi.www.menu.service.menuService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class orderController {
	
//	private final MemberService memberService;
	private final menuService menuService;
	
	@GetMapping("/CafehiOrder.do")
	public String CafehiOrderView(@RequestParam(required = false) int orderAmount, MenuDTO menu, Model model, HttpServletRequest request) {
		
		if(orderAmount == 0) {
			request.setAttribute("msg", "수량을 선택 해야 구매 가능합니다.");
			request.setAttribute("url", "coffeeList.do");
			
			return "alert";
		}
		
		
		model.addAttribute("Menu", menuService.getMenu(menu.getMenu_code()));
		model.addAttribute("orderAmount", orderAmount);
		
		return "member/cafehi_order";
	}
	
	
}
