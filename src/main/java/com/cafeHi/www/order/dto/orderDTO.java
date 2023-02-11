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
	
	// 객체 지향적인 DTO 
	
	private int order_code;	// 기본키
	private MemberDTO member;	// 멤버 정보
	private OrderState orderState; // 주문 상태
	private LocalDateTime orderDate;	// 주문 날짜
	private List<orderMenuDTO> orderMenuList;
	
	
	
	
	// 주문 메뉴 리스트 추가
	
//	public void addOrderItem(orderMenuDTO orderMenu) {
//		orderMenuList.add(orderMenu);
//		orderMenu.setOrder(this);
//	}



	// 생성 메서드
	
//	public static orderDTO createOrder(MemberDTO member, List<orderMenuDTO> orderMenuList){
//		
//		orderDTO order = new orderDTO();
//		order.setMember(member);
//		for (orderMenuDTO orderMenu : orderMenuList) {
//			order.addOrderItem(orderMenu);
//		}
//		
//		order.setOrderState(OrderState.주문완료);
//		order.setOrderDate(LocalDateTime.now());
//		return order;
//	}


	

	public orderDTO(MemberDTO member, OrderState orderState, LocalDateTime orderDate,
			List<orderMenuDTO> orderMenuList) {
		super();
		this.member = member;
		this.orderState = orderState;
		this.orderDate = LocalDateTime.now();
		this.orderMenuList = orderMenuList;
	}




	@Override
	public String toString() {
		return "orderDTO [order_code=" + order_code + ", member=" + member + ", orderState=" + orderState
				+ ", orderDate=" + orderDate + ", orderMenuList=" + orderMenuList + "]";
	}



	
}
