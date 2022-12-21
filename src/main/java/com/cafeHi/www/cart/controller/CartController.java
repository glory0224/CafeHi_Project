package com.cafeHi.www.cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafeHi.www.cart.dto.CartDTO;
import com.cafeHi.www.cart.service.CartService;
import com.cafeHi.www.member.dto.CustomUser;

public class CartController {
	
	@Autowired
	CartService cartService;
	
	@RequestMapping("/insertCart.do")
	public String CartInsert(CartDTO cart) {
		
		 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		    CustomUser userInfo = (CustomUser)principal;
		    String member_id = userInfo.getMember().getMember_id();
		    cart.setMember_id(member_id);
		    cartService.insertCart(cart);
		return "";
		
	}
}
