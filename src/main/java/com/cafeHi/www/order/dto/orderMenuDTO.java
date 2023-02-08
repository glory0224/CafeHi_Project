package com.cafeHi.www.order.dto;

import com.cafeHi.www.menu.dto.MenuDTO;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter @Setter
@RequiredArgsConstructor
public class orderMenuDTO {
	
	// ��ü �������� DTO 
	
	private int order_menu_code;	// �⺻Ű 
	private MenuDTO menu;	// �޴� ���� 
	private orderDTO order;	// �ֹ� ���� 
	private int total_order_price; // �� ����
	private int total_order_count;	// �ֹ� �� ����
	
	
	public orderMenuDTO(MenuDTO menu, orderDTO order, int total_order_price,
			int total_order_count) {
		super();
		this.menu = menu;
		this.order = order;
		this.total_order_price = total_order_price;
		this.total_order_count = total_order_count;
	}
	
	
	
	
	
	
}
