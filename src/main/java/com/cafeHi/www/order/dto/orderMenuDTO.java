package com.cafeHi.www.order.dto;

import com.cafeHi.www.menu.dto.MenuDTO;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter @Setter
@RequiredArgsConstructor
public class orderMenuDTO {
	
	// 객체 지향적인 DTO 
	
	private int order_menu_code;	// 기본키 
	private MenuDTO menu;	// 메뉴 정보 
	private orderDTO order;	// 주문 정보 
	private int total_order_price; // 총 가격
	private int total_order_count;	// 주문 총 수량
	
	
	public orderMenuDTO(MenuDTO menu, orderDTO order, int total_order_price,
			int total_order_count) {
		super();
		this.menu = menu;
		this.order = order;
		this.total_order_price = total_order_price;
		this.total_order_count = total_order_count;
	}
	
	
	
	
	
	
}
