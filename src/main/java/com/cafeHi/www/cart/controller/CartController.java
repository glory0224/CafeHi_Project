package com.cafeHi.www.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafeHi.www.cart.dto.CartDTO;
import com.cafeHi.www.cart.service.CartService;
import com.cafeHi.www.member.dto.CustomUser;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CartController {
	
	private final CartService cartService;
	
	@RequestMapping("/myCartList.do")
	public String CartListView(Model model) {
		Map<String, Object> map = new HashMap<>();
		
		 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		    CustomUser userInfo = (CustomUser)principal;
		    int member_code = userInfo.getMember().getMember_code();
		
		if (member_code != 0) {
			List<CartDTO> list = cartService.listCart(member_code); // ��ٱ��� ���
			int sumMoney = cartService.sumMoney(member_code); // �ݾ� �հ�
			// ��۷� ���
			// 30000���� ������ ��۷ᰡ 0��, �ȳ����� 2500��
			int fee=sumMoney >= 30000? 0 : 2500;
			// hash map ��ٱ��Ͽ� ���� ���� ������ �����Ѵ�.
			map.put("sumMoney", sumMoney);
			map.put("fee", fee); //��۷�
			map.put("sum", sumMoney+fee); // ��ü �ݾ�
			map.put("list", list); // ��ٱ��� ���
			map.put("count", list.size()); // ���ڵ� ����
			
			model.addAttribute("map", map);
		}
		    
		return "member/cafehi_cart_list";
	}
	
	@RequestMapping("/insertCart.do")
	public String CartInsert(@RequestParam(required = false) int orderAmount, CartDTO cart, HttpServletRequest request) {
		
		if(orderAmount == 0) {
			request.setAttribute("msg", "������ 1�� �̻� ���� �� �ֽ��ϴ�.");
			request.setAttribute("url", "coffeeList.do");
			
			return "alert";
		}
		
		System.out.println("amount : " + orderAmount);
		System.out.println("menu_code : " +  cart.getMenu_code());
		
		
		cart.setCart_amount(orderAmount);
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser userInfo = (CustomUser) principal;
		int member_code = userInfo.getMember().getMember_code();
		cart.setMember_code(member_code);
		cartService.insertCart(cart);
		return "redirect:/myCartList.do";
		
	}
	
	
	// ��ٱ��� ���� 
	@RequestMapping("/modifyCart.do")
	public String CartModify(CartDTO cart) {
		
		System.out.println("cart_code : " + cart.getCart_code());
		System.out.println("amount : " + cart.getCart_amount());
		
		cartService.modifyCart(cart);
		
		return "redirect:/myCartList.do";
		
	}
	
	// ��ٱ��� ����
	@RequestMapping("/deleteCart.do")
	public String CartDelete(CartDTO cart) {
		
		System.out.println("cart_code : " + cart.getCart_code());
		
		cartService.deleteCart(cart.getCart_code());
		
		return "redirect:/myCartList.do";
		
	}
	
	// ��ٱ��� ����
	@RequestMapping("/deleteCartAll.do")
	public String CartDeleteAll() {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser userInfo = (CustomUser) principal;
		int member_code = userInfo.getMember().getMember_code();
		
		
		cartService.deleteAllCart(member_code);
		
		return "redirect:/myCartList.do";
		
	}
	
	
}
