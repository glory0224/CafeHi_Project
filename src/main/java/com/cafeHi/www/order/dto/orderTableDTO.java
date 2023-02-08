package com.cafeHi.www.order.dto;

import java.util.Date;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter @Setter
@RequiredArgsConstructor
public class orderTableDTO {
	
	// ���̺� �߽� DTO
	
	private int order_code;	// �⺻Ű
	private int member_code;	// ��� �⺻Ű
	private int menu_code;	// �޴� �⺻Ű
	private int order_price;	// �ֹ� �� ����
	private int order_count;	// �ֹ� �� ����
	private String orderState;	// �ֹ� ���� 
	private Date orderDate;	// �ֹ� ��¥
	
	
	


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
