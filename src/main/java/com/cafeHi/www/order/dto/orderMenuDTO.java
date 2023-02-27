package com.cafeHi.www.order.dto;


import java.time.LocalDateTime;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
public class orderMenuDTO {
	

	
	private int order_menu_code;	// �⺻Ű 
	private int menu_code;	// �޴� ���� 
	private int order_code;	// �ֹ� ���� 
	private int total_order_price; // �� ����
	private int total_order_count;	// �ֹ� �� ����
	private LocalDateTime order_menu_writetime; // �ֹ� �޴� �����
	private LocalDateTime order_menu_updatetime; // �ֹ� �޴� ������
	

	public orderMenuDTO() {
		
	}
	
	
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
	

	public void setTime() {
		
		this.order_menu_writetime = LocalDateTime.now();
		this.order_menu_updatetime = LocalDateTime.now();
	}
	
	public void setOrderCode(int order_code) {
		this.order_code = order_code;
	}

	public void setMenuCode(int menu_code) {
		this.menu_code = menu_code;
	}
	
	
	public void setTotalPriceAndCount(int total_order_price , int total_order_count) {
		
		this.total_order_price = total_order_price;
		this.total_order_count = total_order_count;
		
	}
	
	
}
