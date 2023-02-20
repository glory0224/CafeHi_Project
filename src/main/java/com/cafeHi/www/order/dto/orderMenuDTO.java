package com.cafeHi.www.order.dto;


import java.time.LocalDateTime;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter @Setter
@RequiredArgsConstructor
public class orderMenuDTO {
	

	
	private int order_menu_code;	// 기본키 
	private int menu_code;	// 메뉴 정보 
	private int order_code;	// 주문 정보 
	private int total_order_price; // 총 가격
	private int total_order_count;	// 주문 총 수량
	private LocalDateTime order_menu_writetime; // 주문 메뉴 등록일
	private LocalDateTime order_menu_updatetime; // 주문 메뉴 수정일
	


	
	// 배송비 불포함 총 비용 계산
	
	public int totalPrice(int menuPrice, int orderCount) {
		
		int TotalPrice = (menuPrice * orderCount);
		
		return TotalPrice;
	}
	
	// 배송비 포함 총 비용 계산
	
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
