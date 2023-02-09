package com.cafeHi.www.order.dto;

import java.util.Date;
import java.util.List;

import com.cafeHi.www.member.dto.MemberDTO;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter @Setter
@RequiredArgsConstructor
public class orderDTO {
	
	// 객체 지향적인 DTO 
	
	private int order_code;	// 기본키
	private MemberDTO member;	// 멤버 정보
	private String orderState; // 주문 상태
	private Date orderDate;	// 주문 날짜
	private List<orderMenuDTO> orderMenuList;
	
	
	public orderDTO(MemberDTO member, String orderState, Date orderDate, List<orderMenuDTO> orderMenuList) {
		super();
		this.member = member;
		this.orderState = orderState;
		this.orderDate = orderDate;
		this.orderMenuList = orderMenuList;
	}


	@Override
	public String toString() {
		return "orderDTO [order_code=" + order_code + ", member=" + member + ", orderState=" + orderState
				+ ", orderDate=" + orderDate + ", orderMenuList=" + orderMenuList + "]";
	}
	
	
	
	
	
		
	
}
