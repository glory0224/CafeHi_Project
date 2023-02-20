package com.cafeHi.www.cart.controller;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@GetMapping("/myCartList.do")
	public String CartListView(Model model) {
		Map<String, Object> map = new HashMap<>();
		
		 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		    CustomUser userInfo = (CustomUser)principal;
		    int member_code = userInfo.getMember().getMember_code();
		
		if (member_code != 0) {
			List<CartDTO> list = cartService.listCart(member_code); // 장바구니 목록
			int sumMoney = cartService.sumMoney(member_code); // 금액 합계
			// 배송료 계산
			// 30000원이 넘으면 배송료가 0원, 안넘으면 2500원
			int fee=sumMoney >= 30000? 0 : 2500;
			// hash map 장바구니에 넣을 각종 값들을 저장한다.
			map.put("sumMoney", sumMoney);
			map.put("fee", fee); //배송료
			map.put("sum", sumMoney+fee); // 전체 금액
			map.put("list", list); // 장바구니 목록
			map.put("count", list.size()); // 레코드 개수
			
			model.addAttribute("map", map);
		}
		    
		return "member/cafehi_cart_list";
	}
	
	@PostMapping("/insertCart.do")
	public String CartInsert(@RequestParam(required = false) int toCartAmount, CartDTO cart, HttpServletRequest request) {
		
		if(toCartAmount == 0) {
			request.setAttribute("msg", "수량은 1개 이상 담을 수 있습니다.");
			request.setAttribute("url", "coffeeList.do");
			System.out.println("toCartAmount : " + toCartAmount);
			
			return "alert";
		}
				
		
		cart.setCart_amount(toCartAmount);
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser userInfo = (CustomUser) principal;
		int member_code = userInfo.getMember().getMember_code();
		cart.setMember_code(member_code);
		cart.setCart_writetime(LocalDateTime.now());
		cart.setCart_updatetime(LocalDateTime.now());
		cartService.insertCart(cart);
		return "redirect:/myCartList.do";
		
	}
	
	
	// 장바구니 수정 
	@PostMapping("/modifyCart.do")
	public String CartModify(CartDTO cart) {
				
		cartService.modifyCart(cart);
		
		return "redirect:/myCartList.do";
		
	}
	
	// 장바구니 삭제
	@PostMapping("/deleteCart.do")
	public String CartDelete(CartDTO cart) {
				
		cartService.deleteCart(cart.getCart_code());
		
		return "redirect:/myCartList.do";
		
	}
	
	// 장바구니 비우기
	@PostMapping("/deleteCartAll.do")
	public String CartDeleteAll() {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser userInfo = (CustomUser) principal;
		int member_code = userInfo.getMember().getMember_code();
		
		
		cartService.deleteAllCart(member_code);
		
		return "redirect:/myCartList.do";
		
	}
	
	
}
