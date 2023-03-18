package com.cafeHi.www.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafeHi.www.member.dto.CustomUser;
import com.cafeHi.www.membership.dto.MembershipDTO;
import com.cafeHi.www.membership.service.MembershipService;
import com.cafeHi.www.menu.dto.MenuDTO;
import com.cafeHi.www.menu.service.menuService;
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
	
	private final MembershipService membershipService;
	
	@GetMapping("/CafehiOrder.do")
	public String CafehiOrderView(@RequestParam(required = false) int toOrderAmount, MenuDTO menu, Model model, HttpServletRequest request) {
		
		if(toOrderAmount == 0) {
			request.setAttribute("msg", "수량을 선택 해야 구매 가능합니다.");
			request.setAttribute("url", "coffeeList.do");
			
			return "alert";
		}
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    CustomUser userInfo = (CustomUser)principal;
	    int member_code = userInfo.getMember().getMember_code();
		
		
		model.addAttribute("Menu", menuService.getMenu(menu.getMenu_code()));
		model.addAttribute("orderAmount", toOrderAmount);
		model.addAttribute("Membership", membershipService.getMembership(member_code));
		
		
		return "member/cafehi_order";
	}
	

	
	@PostMapping("/CafehiOrder.do")
	public String CafehiOrder(@RequestParam(value="deliveryFee", required = false) int deliveryFee, 
			@RequestParam("menu_code") int menu_code,
			@RequestParam("include_delivery") Boolean include_delivery,
			@RequestParam("member_code") int member_code,
			@RequestParam("total_order_count") int total_order_count, 
			MembershipDTO membership
			) {
	
		orderDTO newOrder = new orderDTO();
		orderMenuDTO newOrderMenu = new orderMenuDTO();
		
		newOrder.setMemberCode(member_code);
		newOrder.setIncludeDelivery(include_delivery);
		newOrder.setTimeAndStatus();
		
		log.info("membership = {}", membership);
		
		log.info(" =============== membership start =============== ");		
		
		membershipService.updateMembershipPoint(membership);
		
		log.info("=============== membership end =============== ");
			
		
		MenuDTO getMenu = menuService.getMenu(menu_code);
		
		if(deliveryFee != 0 & newOrder.getInclude_delivery()) {
			
		orderService.insertOrder(newOrder);
					
		int TotalPrice = newOrderMenu.totalPrice(deliveryFee, getMenu.getMenu_price(), total_order_count); // 배송비 포함 총 비용 
		
		log.info("TotalPrice = {}", TotalPrice);
						
		newOrderMenu.setMenu(getMenu);
		
		newOrderMenu.setTimeAndStatus();
		
		newOrderMenu.setCountAndTotalPriceAndTotalPoint(total_order_count, TotalPrice, membership.getMembership_new_point());
		
			
		orderService.insertOrderMenu(newOrderMenu);
			
			
			return "redirect:/CafehiOrderList.do";
			
		} else {
			
			orderService.insertOrder(newOrder);
			
		int NotDeliveryTotalPrice = newOrderMenu.totalPrice(getMenu.getMenu_price(), total_order_count);  // 배송비 불포함 총 비용 
			
			newOrderMenu.setMenu(getMenu);
			
			newOrderMenu.setTimeAndStatus();
			
			newOrderMenu.setCountAndTotalPriceAndTotalPoint(total_order_count, NotDeliveryTotalPrice, membership.getMembership_new_point());
				
			orderService.insertOrderMenu(newOrderMenu);
		
		
		return "redirect:/CafehiOrderList.do";
		
		}
	}
	
	@GetMapping("/CafehiOrderList.do")
	public String CafehiOrderListView(Model model) {
		
		  Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		  CustomUser userInfo = (CustomUser)principal;
		  int member_code = userInfo.getMember().getMember_code();
		    
		if(member_code != 0) {
			
			  List<orderMenuDTO> orderList = orderService.listOrder(member_code);
			  			  
			  log.info("orderListSize = {}", orderList.size());
			  			
			  model.addAttribute("orderList", orderList);
			  			  			  
			  model.addAttribute("orderListCount", orderList.size());
			  
		}
		
		
		
		return "member/cafehi_orderList";
	}
	
	@PostMapping("/CafehiOrderCancel.do")
	public String CafehiOrderCancel(orderDTO order, orderMenuDTO orderMenu, Model model) {
		
		log.info("order_code = {}", order.getOrder_code());
		
		order.cancelTimeAndStatus();
		
		orderService.CancelOrder(order);
		
		// 취소 했을 때 멤버쉽 포인트 감소
		
		log.info("order_menu_code = {}", orderMenu.getOrder_menu_code());
		
		orderMenu.cancelTimeAndStatus();
		
		orderService.CancelOrderMenu(orderMenu);
		
		orderMenuDTO getOrderMenu = orderService.getOrderMenu(orderMenu.getOrder_menu_code());
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser userInfo = (CustomUser)principal;
		int member_code = userInfo.getMember().getMember_code();
		
		log.info("session member_code = {}", member_code);
		
		MembershipDTO getMembership = membershipService.getMembership(member_code);
		
		log.info("getMemebership member_code = {}", getMembership.getMember_code());
		
		membershipService.minusMembershipPoint(getMembership, getOrderMenu);
		
		return "redirect:/CafehiOrderList.do";
	}
	
	
}
