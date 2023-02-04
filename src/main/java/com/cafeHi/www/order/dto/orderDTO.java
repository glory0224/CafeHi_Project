package com.cafeHi.www.order.dto;

import java.util.Date;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter @Setter
@RequiredArgsConstructor
public class orderDTO {
	
	// 주문 행위 
	
	private int order_menu_code;
	private int member_code;
	private String orderstate;
	private Date orderdate;
	
	
	public orderDTO(int order_menu_code, int member_code, String orderstate, Date orderdate) {
		super();
		this.order_menu_code = order_menu_code;
		this.member_code = member_code;
		this.orderstate = orderstate;
		this.orderdate = orderdate;
	}
	
	
	
}
