package com.cafeHi.www.order.dto;

import java.util.Date;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter @Setter
@RequiredArgsConstructor
public class orderTableDTO {
	
	// 테이블 중심 DTO
	
	private int order_code;	// 기본키
	private int member_code;	// 멤버 기본키
	private int menu_code;	// 메뉴 기본키
	private int order_price;	// 주문 총 가격
	private int order_count;	// 주문 총 수량
	private String orderState;	// 주문 상태 
	private Date orderDate;	// 주문 날짜
	
	
	


	@Override
	public String toString() {
		return "orderDTO [order_code=" + order_code + ", member_code=" + member_code + ", menu_code=" + menu_code
				+ ", order_price=" + order_price + ", order_count=" + order_count + ", orderState=" + orderState
				+ ", orderDate=" + orderDate + "]";
	}





	public orderTableDTO(int member_code, int menu_code, int order_price, int order_count, String orderState,
			Date orderDate) {
		super();
		this.member_code = member_code;
		this.menu_code = menu_code;
		this.order_price = order_price;
		this.order_count = order_count;
		this.orderState = orderState;
		this.orderDate = orderDate;
	}
	
	
	
	
	
}
