package com.cafeHi.www.order.dto;


import java.time.LocalDateTime;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter @Setter
@RequiredArgsConstructor
public class orderMenuDTO {
	

	
	private int order_menu_code;	// �⺻Ű 
	private int menu_code;	// �޴� ���� 
	private int order_code;	// �ֹ� ���� 
	private int total_order_price; // �� ����
	private int total_order_count;	// �ֹ� �� ����
	private LocalDateTime order_menu_writetime; // �ֹ� �޴� �����
	private LocalDateTime order_menu_updatetime; // �ֹ� �޴� ������
	


	
	// ��ۺ� ������ �� ��� ���
	
	public int totalPrice(int menuPrice, int orderCount) {
		
		int TotalPrice = (menuPrice * orderCount);
		
		return TotalPrice;
	}
	
	// ��ۺ� ���� �� ��� ���
	
	public int totalPrice(int fee, int menuPrice, int orderCount) {
		
		int TotalPrice = (menuPrice * orderCount) + fee;
		
		return TotalPrice;
	}
	

	public orderMenuDTO(int order_menu_code, int menu_code, int order_code, int total_order_price,
			int total_order_count) {
		super();
		this.order_menu_code = order_menu_code;
		this.menu_code = menu_code;
		this.order_code = order_code;
		this.total_order_price = total_order_price;
		this.total_order_count = total_order_count;
	}

	@Override
	public String toString() {
		return "orderMenuDTO [order_menu_code=" + order_menu_code + ", menu_code=" + menu_code + ", order_code="
				+ order_code + ", total_order_price=" + total_order_price + ", total_order_count=" + total_order_count
				+ "]";
	}



	
	
}
