package com.cafeHi.www.order.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafeHi.www.member.dto.CustomUser;
import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.menu.dto.MenuDTO;
import com.cafeHi.www.menu.service.menuService;
import com.cafeHi.www.order.OrderState;
import com.cafeHi.www.order.dto.orderDTO;
import com.cafeHi.www.order.dto.orderMenuDTO;
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
	public String CafehiOrder(@RequestParam(required = false) String deliveryFee, MenuDTO menu, MemberDTO member, orderDTO order, orderMenuDTO orderMenu) {
		
		log.info("order include delivery = {}", order.getInclude_delivery());
		
		
		order.setOrder_writetime(LocalDateTime.now());
		order.setOrder_updatetime(LocalDateTime.now());
		order.setOrder_status(OrderState.주문완료);	
		
		Map<String, Object> memberOrder = new ConcurrentHashMap<String, Object>();
		
		Map<String, Object> memberOrderMenu = new ConcurrentHashMap<String, Object>();
		
		MenuDTO getMenu = menuService.getMenu(menu.getMenu_code());
		
		if(deliveryFee != null & order.getInclude_delivery()) {
			
		int fee = Integer.parseInt(deliveryFee); // 배송비	
		
		memberOrder.put("order", order);
		memberOrder.put("member_code", member.getMember_code());
				
		orderService.insertOrder(memberOrder);
		
			
		int TotalPrice = orderMenu.totalPrice(fee, getMenu.getMenu_price(), orderMenu.getTotal_order_count()); // 배송비 포함 총 비용 
			
		orderMenu.setTotal_order_price(TotalPrice);
		orderMenu.setOrder_menu_writetime(LocalDateTime.now());
		orderMenu.setOrder_menu_updatetime(LocalDateTime.now());
			
			
		memberOrderMenu.put("orderMenu", orderMenu);
		memberOrderMenu.put("menu_code", getMenu.getMenu_code());
			
			
		orderService.insertOrderMenu(memberOrderMenu);
			
		return "redirect:/CafehiOrderList.do";
			
		} else {
			
		memberOrder.put("order", order);
		memberOrder.put("member_code", member.getMember_code());
			
		orderService.insertOrder(memberOrder);
		
		int NotDeliveryTotalPrice = orderMenu.totalPrice(getMenu.getMenu_price(), orderMenu.getTotal_order_count());  // 배송비 불포함 총 비용 
		
		orderMenu.setTotal_order_price(NotDeliveryTotalPrice);
		
		
		memberOrderMenu.put("orderMenu", orderMenu);
		memberOrderMenu.put("menu_code", getMenu.getMenu_code());
		
		orderService.insertOrderMenu(memberOrderMenu);
		
		
		return "redirect:/CafehiOrderList.do";
		
		}
	}
	
	@GetMapping("/CafehiOrderList.do")
	public String CafehiOrderListView(Model model) {
		
		Map<String, Object> OrderMap = new HashMap<>();
		
		 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		    CustomUser userInfo = (CustomUser)principal;
		    int member_code = userInfo.getMember().getMember_code();
		    
		if(member_code != 0) {
			
			List<orderDTO> orderList = orderService.listOrder(member_code); // 주문 목록			
			List<MenuDTO> OrderMenuList = new ArrayList<MenuDTO>();
			

			log.info("orderList = {} ", orderList);
			
			for(orderDTO order : orderList) {
				
				MenuDTO getMenu = menuService.getMenu(order.getOrderMenu().getMenu_code());
				
				
				
				OrderMenuList.add(getMenu);
				
				log.info("orderMenuList = {}", OrderMenuList);
			}
			
			OrderMap.put("orderList", orderList);
			OrderMap.put("orderListCount", orderList.size()); 
			
			model.addAttribute("orderMap", OrderMap);
			model.addAttribute("orderMenuList", OrderMenuList);
		}
		
		return "member/cafehi_orderList";
	}
	
	@PostMapping("/CafehiOrderCancel.do")
	public String CafehiOrderCancel(orderDTO order, Model model) {
		
		
		
		Map<String, Object> OrderCancelInfo = new HashMap<>();
		
		OrderCancelInfo.put("order_code", order.getOrder_code());
		OrderCancelInfo.put("orderState", OrderState.주문취소);
		OrderCancelInfo.put("orderUpateDate", LocalDateTime.now());
		
		orderService.CancelOrder(OrderCancelInfo);
		
		
		
		return "redirect:/CafehiOrderList.do";
	}
	
	
}
