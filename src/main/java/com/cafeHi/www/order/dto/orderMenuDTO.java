package com.cafeHi.www.order.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter @Setter
@RequiredArgsConstructor
public class orderMenuDTO {
	// 메뉴 주문
	
	private int order_menu_code;
	private int order_code;
	private int menu_code;
	private int member_code;
	private int order_menu_price;
	private int order_menu_count;
	
	
	public orderMenuDTO(int order_menu_code, int order_code, int menu_code, int member_code, int order_menu_price,
			int order_menu_count) {
		super();
		this.order_menu_code = order_menu_code;
		this.order_code = order_code;
		this.menu_code = menu_code;
		this.member_code = member_code;
		this.order_menu_price = order_menu_price;
		this.order_menu_count = order_menu_count;
	}
	
	
	
}
