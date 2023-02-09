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
	
	// ��ü �������� DTO 
	
	private int order_code;	// �⺻Ű
	private MemberDTO member;	// ��� ����
	private String orderState; // �ֹ� ����
	private Date orderDate;	// �ֹ� ��¥
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
