package com.cafeHi.www.order.controller;

import java.util.Date;
import java.util.HashMap;
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
import com.cafeHi.www.member.service.MemberService;
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
	
	private final MemberService memberService;
	
	private final menuService menuService;
	
	private final orderService orderService;
	
	@GetMapping("/CafehiOrder.do")
	public String CafehiOrderView(@RequestParam(required = false) int toOrderAmount, MenuDTO menu, Model model, HttpServletRequest request) {
		
		if(toOrderAmount == 0) {
			request.setAttribute("msg", "������ ���� �ؾ� ���� �����մϴ�.");
			request.setAttribute("url", "coffeeList.do");
			
			return "alert";
		}
		
		
		model.addAttribute("Menu", menuService.getMenu(menu.getMenu_code()));
		model.addAttribute("orderAmount", toOrderAmount);
		
		return "member/cafehi_order";
	}
	
	@PostMapping("/CafehiOrder.do")
	public String CafehiOrder(@RequestParam(required = false) String deliveryFee, MenuDTO menu, MemberDTO member, orderDTO order, orderMenuDTO orderMenu) {
		
		log.info("CafehiOrderController");
		log.info("member_code : {}", member.getMember_code());
		
		MemberDTO findMember = memberService.getMember(member);
		
		order.setOrderDate(new Date());
		order.setOrderState("�ֹ��Ϸ�");	//enum class ���� �ٲ�� �Ѵ�.
		order.setMember(findMember);
		
		Map<String, Object> memberOrder = new ConcurrentHashMap<String, Object>();
		memberOrder.put("order", order);
		memberOrder.put("member_code", member.getMember_code());
				
		orderService.insertOrder(memberOrder);
		
		orderDTO getOrder = orderService.getOrder(member); // NPE �߻�, �ֳ�? insertOrder�ϸ� ordercode�� �������� ���� ���⼭ ���� order������ order_code ��ü�� ���� ������ �ֹ� ��ü�� ã�� �� ����. 
		
		log.info("getOrder, order_code = {}", getOrder.getOrder_code());
		
		
		
		int fee = Integer.parseInt(deliveryFee); // ��ۺ�
		
		int orderCount = orderMenu.getTotal_order_count();
		
		MenuDTO getMenu = menuService.getMenu(menu.getMenu_code());
		
		int menuPrice = getMenu.getMenu_price();
		
		if(deliveryFee != null) {
			
			
			int deliveryTotal = (menuPrice * orderCount) + fee;
			
			orderMenu.setTotal_order_price(deliveryTotal);
			Map<String, Object> memberOrderMenu = new ConcurrentHashMap<String, Object>();
			
			memberOrderMenu.put("orderMenu", orderMenu);
			memberOrderMenu.put("order_code", getOrder.getOrder_code());
			memberOrderMenu.put("menu_code", getMenu.getMenu_code());
			
			
			orderService.insertOrderMenu(memberOrderMenu);
			
			return "redirect:/CafehiOrderList.do";
			
		}
		
		int NotDeliveryTotal = menuPrice * orderCount;
		
		orderMenu.setTotal_order_price(NotDeliveryTotal);
		
		Map<String, Object> memberOrderMenu = new ConcurrentHashMap<String, Object>();
		
		memberOrderMenu.put("orderMenu", orderMenu);
		memberOrderMenu.put("order_code", getOrder.getOrder_code());
		memberOrderMenu.put("orderMenu", getMenu.getMenu_code());
		
		orderService.insertOrderMenu(memberOrderMenu);
		
		
		return "redirect:/CafehiOrderList.do";
	}
	
	@GetMapping("/CafehiOrderList.do")
	public String CafehiOrderListView(Model model) {
		
		Map<String, Object> map = new HashMap<>();
		
		 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		    CustomUser userInfo = (CustomUser)principal;
		    int member_code = userInfo.getMember().getMember_code();
		    
		if(member_code != 0) {
			//orderService.listOrder(member_code); // �ֹ� ���
			
		}
		
		
		return "member/cafehi_orderList";
	}
	
	
}
