package com.cafeHi.www.order.service;

import java.util.Map;

import com.cafeHi.www.member.dto.MemberDTO;
import com.cafeHi.www.order.dto.orderDTO;

public interface orderService {
	
	public void insertOrderMenu(Map<String, Object> memberOrderMenu);
	
	public void updateOrder(orderDTO orderMenu);
	
	public void deleteOrder(orderDTO orderMenu);

	
	public int sumOrderMoney(int member_code);
	

	public void insertOrder(Map<String, Object> memberOrder);

	public orderDTO getOrder(MemberDTO member);
	
}
