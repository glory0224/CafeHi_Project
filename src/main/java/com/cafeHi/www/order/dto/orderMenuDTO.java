package com.cafeHi.www.order.dto;


import java.time.LocalDateTime;

import com.cafeHi.www.menu.dto.MenuDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class orderMenuDTO {
	
	private int order_menu_code;	// 기본키 
	private MenuDTO menu;	// 메뉴 정보
	private orderDTO order;
	private int total_order_price; // 총 가격
	private int total_order_count;	// 주문 총 수량
	private LocalDateTime order_menu_writetime; // 주문 메뉴 등록일
	private LocalDateTime order_menu_updatetime; // 주문 메뉴 수정일
	private int total_order_price_point; // 총 가격에 따른 적립 포인트
	private boolean order_menu_status; // 주문 메뉴 상태 (주문, 취소) 
	
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
