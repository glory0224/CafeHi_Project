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
	

	
	private int order_code;	// �⺻Ű
	private int member_code;	// ��� ����
	private OrderState orderState; // �ֹ� ����
	private LocalDateTime orderDate;	// �ֹ� ��¥
	private LocalDateTime orderUpdateDate; // ���� ��¥ 
	private orderMenuDTO orderMenu; // �ֹ� �޴�
	private Boolean include_delivery; // ��ۺ� ���� ����
	
	
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
