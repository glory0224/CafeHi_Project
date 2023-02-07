package com.cafeHi.www.order.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafeHi.www.member.dto.CustomUser;
import com.cafeHi.www.menu.dto.MenuDTO;
import com.cafeHi.www.menu.service.menuService;
import com.cafeHi.www.order.dto.orderDTO;
import com.cafeHi.www.order.service.orderService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequiredArgsConstructor
@Slf4j
public class orderController {
	
	private final menuService menuService;
	
	private final orderService orderService;
	
	@GetMapping("/CafehiOrder.do")
	public String CafehiOrderView(@RequestParam(required = false) int toOrderAmount, MenuDTO menu, Model model, HttpServletRequest request) {
		
		if(toOrderAmount == 0) {
			request.setAttribute("msg", "수량을 선택 해야 구매 가능합니다.");
			request.setAttribute("url", "coffeeList.do");
			
			return "alert";
		}
		
		
		model.addAttribute("Menu", menuService.getMenu(menu.getMenu_code()));
		model.addAttribute("orderAmount", toOrderAmount);
		
		return "member/cafehi_order";
	}
	
	@PostMapping("/CafehiOrder.do")
	public String CafehiOrder(@RequestParam(required = false) String deliveryFee, orderDTO order) {
		order.setOrderDate(new Date());
		order.setOrderState("주문완료");
		log.info("CafehiOrder!!");
		log.info("order = {} ", order);
		
		int fee = Integer.parseInt(deliveryFee);
		int orderCount = order.getOrder_count();
		MenuDTO getMenu = menuService.getMenu(order.getMenu_code());
		int menuPrice = getMenu.getMenu_price();
		
		if(deliveryFee != null) {
			
			
			int deliveryTotal = (menuPrice * orderCount) + fee;
			
			order.setOrder_price(deliveryTotal);
			
			orderService.insertOrder(order);
			
		}
		
		int NotDeliveryTotal = menuPrice * orderCount;
		
		order.setOrder_price(NotDeliveryTotal);
		
		orderService.insertOrder(order);
		
		
		return "redirect:/CafehiOrderList.do";
	}
	
	@GetMapping("/CafehiOrderList.do")
	public String CafehiOrderListView(Model model) {
		
		Map<String, Object> map = new HashMap<>();
		
		 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		    CustomUser userInfo = (CustomUser)principal;
		    int member_code = userInfo.getMember().getMember_code();
		    
		if(member_code != 0) {
			//orderService.listOrder(member_code); // 주문 목록
			
		}
		
		
		return "member/cafehi_orderList";
	}
	
	
}
