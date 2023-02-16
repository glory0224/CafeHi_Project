package com.cafeHi.www.order.dto;

import java.time.LocalDateTime;
import java.util.List;

import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.order.OrderState;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter @Setter
@RequiredArgsConstructor
public class orderDTO {
	

	
	private int order_code;	// 기본키
	private int member_code;	// 멤버 정보
	private OrderState orderState; // 주문 상태
	private LocalDateTime orderDate;	// 주문 날짜
	private LocalDateTime orderUpdateDate; // 수정 날짜 
	private orderMenuDTO orderMenu; // 주문 메뉴
	private Boolean include_delivery; // 배송비 포함 여부
	
	
	public orderDTO(int order_code, int member_code, OrderState orderState, LocalDateTime orderDate,
			LocalDateTime orderUpdateDate, orderMenuDTO orderMenu, Boolean include_delivery) {
		super();
		this.order_code = order_code;
		this.member_code = member_code;
		this.orderState = orderState;
		this.orderDate = orderDate;
		this.orderUpdateDate = orderUpdateDate;
		this.orderMenu = orderMenu;
		this.include_delivery = include_delivery;
	}


	@Override
	public String toString() {
		return "orderDTO [order_code=" + order_code + ", member_code=" + member_code + ", orderState=" + orderState
				+ ", orderDate=" + orderDate + ", orderUpdateDate=" + orderUpdateDate + ", orderMenu=" + orderMenu
				+ ", include_delivery=" + include_delivery + "]";
	}
	
	
	


	
}
