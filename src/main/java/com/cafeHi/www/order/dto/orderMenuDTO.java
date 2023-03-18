package com.cafeHi.www.order.dto;


import java.time.LocalDateTime;

import com.cafeHi.www.menu.dto.MenuDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class orderMenuDTO {
	
	private int order_menu_code;	// �⺻Ű 
	private MenuDTO menu;	// �޴� ����
	private orderDTO order;
	private int total_order_price; // �� ����
	private int total_order_count;	// �ֹ� �� ����
	private LocalDateTime order_menu_writetime; // �ֹ� �޴� �����
	private LocalDateTime order_menu_updatetime; // �ֹ� �޴� ������
	private int total_order_price_point; // �� ���ݿ� ���� ���� ����Ʈ
	private boolean order_menu_status; // �ֹ� �޴� ���� (�ֹ�, ���) 
	
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
	

	public void setTimeAndStatus() {
		this.order_menu_status = true;
		this.order_menu_writetime = LocalDateTime.now();
		this.order_menu_updatetime = LocalDateTime.now();
	}
	
	public void cancelTimeAndStatus() {
		this.order_menu_status = false;
		this.order_menu_updatetime = LocalDateTime.now();
	}
	
	public void updateTime() {
		this.order_menu_updatetime = LocalDateTime.now();
	}
	
	public void setOrder(orderDTO order) {
		this.order = order;
	}

	public void setMenu(MenuDTO menu) {
		this.menu = menu;
	}
	
	public void setOrder_menu_code(int order_menu_code) {
		this.order_menu_code = order_menu_code;
	}

	
	public void setCountAndTotalPriceAndTotalPoint(int total_order_count, int total_order_price , int total_order_price_point) {
		
		this.total_order_price = total_order_price;
		this.total_order_count = total_order_count;
		this.total_order_price_point = total_order_price_point;
	}
	
	
	
	@Override
	public String toString() {
		return "orderMenuDTO [order_menu_code=" + order_menu_code + ", menu=" + menu + ", order=" + order
				+ ", total_order_price=" + total_order_price + ", total_order_count=" + total_order_count
				+ ", order_menu_writetime=" + order_menu_writetime + ", order_menu_updatetime=" + order_menu_updatetime
				+ "]";
	}




	
	
	
}
