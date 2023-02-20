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
	private OrderState order_status; // 주문 상태
	private LocalDateTime order_writetime;	// 주문 날짜
	private LocalDateTime order_updatetime; // 수정 날짜 
	private orderMenuDTO orderMenu; // 주문 메뉴
	private Boolean include_delivery; // 배송비 포함 여부
	
	
	public orderDTO(int order_code, int member_code, OrderState order_status, LocalDateTime order_writetime,
			LocalDateTime order_updatetime, orderMenuDTO orderMenu, Boolean include_delivery) {
		super();
		this.order_code = order_code;
		this.member_code = member_code;
		this.order_status = order_status;
		this.order_writetime = order_writetime;
		this.order_updatetime = order_updatetime;
		this.orderMenu = orderMenu;
		this.include_delivery = include_delivery;
	}

	

	@Override
	public String toString() {
		return "orderDTO [order_code=" + order_code + ", member_code=" + member_code + ", order_status=" + order_status
				+ ", order_writetime=" + order_writetime + ", order_updatetime=" + order_updatetime + ", orderMenu="
				+ orderMenu + ", include_delivery=" + include_delivery + "]";
	}
	
	

	
}
